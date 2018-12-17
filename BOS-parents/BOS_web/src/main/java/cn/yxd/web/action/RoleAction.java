package cn.yxd.web.action;

import cn.yxd.bean.Function;
import cn.yxd.bean.Role;
import cn.yxd.servce.RoleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.Set;

@Controller
@Scope("prototype")
public class RoleAction  extends BaseAction<Role>{
    @Autowired
    private RoleService roleService;
    //使用说属性驱动结束Function的id
    private String functionIds;
    //运用属性驱动获取role的id；
    private  String ids;
    public void setIds(String ids) {
        this.ids = ids;
    }

    public void setFunctionIds(String functionIds) {
        this.functionIds = functionIds;
    }

    //角色权限的添加
    public String add() throws Exception {
        if(  StringUtils.isNoneBlank(functionIds)){
                roleService.save(this.modle,functionIds);
        }
       return  "list";
    }
    //分页查询
    public String pageQuery() throws Exception {
        roleService.pageQuery(pageBean);
        this.javaToJson(pageBean,new String[]{"functions","users"} );
        return null;
    }
    //修改信息
    public String edit() throws Exception {
        System.out.println("hello"+modle.getId()+modle.getFunctions()+modle.getCode()+" "+modle.getDescription()+modle.getUsers());
       // System.out.println("修改的信息为"+modle);
        //根据id查询数据库
        System.out.println("role的id为"+ids);
        Role role=roleService.findById(ids);
        role.setDescription(modle.getDescription());
        Set string=role.getUsers();
        if(string!=null){
            role.setUsers(string);
        }
        role.setName(modle.getName());
        role.setCode(null);
        System.out.println("查询出来的id是:"+role.getId());
        if(StringUtils.isNoneBlank(functionIds)){
            String[] funtionids= functionIds.split(",");
            for (String id:funtionids) {
                //保留角色·对权限进行关联,对象为托管状态
                Function function=new Function(id);
                //角色关联对象
                Set functions = modle.getFunctions();
                functions.add(function);
                role.setFunctions(functions);
            }

        }
        roleService.edit(role,ids,functionIds);
        return "edit";
    }
    //加载角色，查询所有的角色
    public String listtoajax() throws Exception {
        List<Role> list=roleService.listtoajax();
        this.listToJson(list,new String[]{"functions","users"} );
        return  null;
    }
}
