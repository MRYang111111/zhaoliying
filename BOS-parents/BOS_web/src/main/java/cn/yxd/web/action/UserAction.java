package cn.yxd.web.action;

import cn.yxd.bean.User;
import cn.yxd.crm.Customer;
import cn.yxd.crm.CustomerService;
import cn.yxd.servce.UserService;

import cn.yxd.utils.BosUtils;
import cn.yxd.utils.MD5Utils;
import com.opensymphony.xwork2.ActionContext;
import freemarker.template.utility.SecurityUtilities;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User>{
    String f = "1";
    //注入依赖'
    /**注入失败
     *
     */
//    @Resource(name = "CustomerService")
//    private CustomerService customerService;

    public static final String HOME = "home";
    //采用模型驱动的方式获取session中的验证码
    private  String checkcode;
    public void setCheckcode(String checkcode) {
        this.checkcode = checkcode;
    }
    public String getCheckcode() {
        return checkcode;
    }
    @Autowired
    private UserService service;


    public String login() throws Exception {
        //登入时判断验证码是否正确
        String key = (String) ActionContext.getContext().getSession().get("key");
        //判断是否验证码输入正确
        if (org.apache.commons.lang3.StringUtils.isNoneBlank(checkcode) && checkcode.equals(key)) {
        //运用shiro的认证方式进行认证,当前状态为未验证
            Subject subject= SecurityUtils.getSubject();
            AuthenticationToken authenticationToken=new UsernamePasswordToken(modle.getUsername(),MD5Utils.md5(modle.getPassword()));
            try{
                subject.login(authenticationToken);
                User user = (User) subject.getPrincipal();
                System.out.println(user);
                //获取session中的值
                ActionContext.getContext().getSession().put("user",user );
                return  "home";
            }catch (Exception e){
                e.printStackTrace();
                this.addActionError("用户名或密码错误");
                return  "login";
            }
        } else {
            //不正确，输出异常信息，从新返回登入页面
            this.addActionError("验证码错误");
            return LOGIN;
        }

    }


    public void setService(UserService service) {
        this.service = service;
    }

        //注销登入的方法
    public String loginout() throws Exception {
        //销毁session
        ServletActionContext.getRequest().getSession().invalidate();
        return "login";
    }
//修改密码的方法
    public String editPassword() throws Exception {
        //获取sessio中的user
        User user = BosUtils.getLoginUser();
        System.out.println(user.getId());
        //获取用户的id//调用service的方法
        service.editPassword(user.getPassword(),user.getId());
        return null;
    }
    /**
     *
     * 保存用户及关联角色对象
     */
    private  String[] roleIds;
    public void setRoleIds(String[] roleIds) {
        this.roleIds = roleIds;
    }
    public String add() throws Exception {
        System.out.println("roldIds的值为"+roleIds);
        if(StringUtils.isNoneBlank(roleIds)){
            service.save(modle,roleIds );
        }
        return "add";
    }
    /**
     * 分页查询
     *
     */
    public String pageQuery() throws Exception {
        service.pageQuery(pageBean);
       this.javaToJson(pageBean, new String[]{"noticebills","roles"});
        return null;
    }
}
