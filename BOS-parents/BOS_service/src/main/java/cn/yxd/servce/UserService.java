package cn.yxd.servce;

import cn.yxd.bean.User;
import cn.yxd.utils.PageBean;

import java.io.IOException;

public interface UserService {
    //登入的方法
    public  User login(User modle);
    //修改密码
    void editPassword(String password, String id) throws IOException;

    //保存和关联用户对象
    void save(User modle, String[] roleIds);
    //分页查询
    void pageQuery(PageBean pageBean);
}
