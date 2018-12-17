package cn.yxd.serviceImpl;

import cn.yxd.bean.Role;
import cn.yxd.bean.User;
import cn.yxd.dao.UserDao;
import cn.yxd.servce.UserService;
import cn.yxd.utils.MD5Utils;
import cn.yxd.utils.PageBean;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.IOException;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public User login(User user) {

        String username=user.getUsername();
        String password=user.getPassword();
        //对用户输入的密码进行加密
//        password= MD5Utils.md5(password);
       User user1 =userDao.findUserNameAndPassword(username,password);
        return user1;
    }

    @Override
    public void editPassword(String password, String id) throws IOException {
        String f="1";
        //对密码进行加密
        password=MD5Utils.md5(password);
        //更新密码，直接调用basedao的executeupdate方法
        try {
            userDao.executeUpdate("user.editPassword",password,id);
        }catch (Exception e){
            //如果异常则进行处理
            f="0";
            e.printStackTrace();
        }
        //设置编码格式
        ServletActionContext.getResponse().setContentType("text/html");
        ServletActionContext.getResponse().getWriter().print(f);
    }

    @Override
    public void save(User user, String[] roleIds) {
        //关联以及保存用户角色

        String password = user.getPassword();
        password=MD5Utils.md5(password);
        user.setPassword(password);

        if(roleIds!=null&&roleIds.length>0){
            for (String roleId:roleIds){
                //将id暂时交由role托管
                Role role=new Role(roleId);
                user.getRoles().add(role);
            }
        }
        userDao.saveOrUpdate(user);
   }

    @Override
    public void pageQuery(PageBean pageBean) {
        //分页查询
        userDao.pageQuery(pageBean);
    }


    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
