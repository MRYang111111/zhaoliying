package cn.yxd.serviceImpl;

import cn.yxd.bean.Function;
import cn.yxd.bean.Role;
import cn.yxd.dao.RoleDao;
import cn.yxd.servce.RoleService;
import cn.yxd.utils.PageBean;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;
    @Override
    public void save(Role modle, String functionIds) {
        //添加角色权限
        roleDao.save(modle);
        //对functionsId进行分割
        if(StringUtils.isNoneBlank(functionIds)){
            String[] funtionids= functionIds.split(",");
            for (String id:funtionids) {
                //保留角色·对权限进行关联,对象为托管状态
                Function function=new Function(id);
                //角色关联对象
               modle.getFunctions().add(function);
            }

        }


    }

    @Override
    public void pageQuery(PageBean pageBean) {
        roleDao.pageQuery(pageBean);
    }

    @Override
    public void edit(Role modle, String ids, String functionIds) {
        roleDao.update(modle);


    }

    @Override
    public Role findById(String ids) {
        return roleDao.findById(ids);
    }

    @Override
    public List<Role> listtoajax() {
        return roleDao.getAll();
    }


}
