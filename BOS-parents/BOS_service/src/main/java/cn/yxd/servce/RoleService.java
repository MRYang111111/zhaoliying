package cn.yxd.servce;

import cn.yxd.bean.Role;
import cn.yxd.utils.PageBean;

import java.util.List;

public interface RoleService {
    //保存角色权限管理
    void save(Role modle, String functionIds);
    //权限分页查询
    void pageQuery(PageBean pageBean);
//修改角色权限
    void edit(Role modle, String ids, String functionIds);
//查询角色的id
    Role findById(String ids);
    //加载用户
    List<Role> listtoajax();
}
