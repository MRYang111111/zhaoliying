package cn.yxd.web.action;

import cn.yxd.bean.Function;
import cn.yxd.bean.User;
import cn.yxd.dao.FunctionDao;
import cn.yxd.servce.FunctionService;
import cn.yxd.utils.BosUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Scope("prototype")
public class FunctionAction extends BaseAction<Function>{
    @Autowired
    private FunctionService functionService;
    @Autowired
    private FunctionDao functionDao;
    public String listtoajax() throws Exception {
        //查询所有的权限，返回json数据
       List<Function> list= functionService.listtoajax();
       this.listToJson(list, new String[]{"parentFunction","roles"});
        return  null;
    }
    //添加权限
    public String add() {
        //判断表单提交过来的是不是空的字符串
        Function parentFunction = modle.getParentFunction();
        if(parentFunction!=null&&parentFunction.getId().equals("")){
           modle.setParentFunction(null);
        }
        functionService.add(modle);
        return "list";
    }
//分页查询
    public String pageQuery() throws Exception {
                String page=modle.getPage();
                System.out.println("权限管理一共有"+page+"页");
                 pageBean.setCurrentPage(Integer.parseInt(page));
                functionService.pageQuery(pageBean);
                this.javaToJson(pageBean,new String[]{"parentFunction","roles","children"} );
        return  null;
    }
   //查询所有的菜单
    public String findAllMenu() throws Exception {
        //如果使用的是内置的账号登入，则查询所有额权限，否者查勋普通的权限
        //内置账号：admin，yxd
        User user = BosUtils.getLoginUser();
        List<Function> list=null;
        try {
            //内置账号登入
            if(user.getUsername().equals("yxd")||user.getUsername().equals("admin")){
                list=functionDao.findAllMene();
                this.listToJson(list,new String[]{"parentFunction","roles","children"} );
            }else {
                //普通账号登入
                list=functionDao.findMenuByUserId(user.getId());
                this.listToJson(list,new String[]{"parentFunction","roles","children"} );
            }
        } catch (Exception e){
            throw  new RuntimeException(e);
        }
        return null;
    }
}
