package cn.yxd.daoImpl;

import cn.yxd.basedaoImpl.BaseDaoImpl;
import cn.yxd.bean.Subarea;
import cn.yxd.dao.SubAreaDao;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SubAreaDaoImpl extends BaseDaoImpl<Subarea>implements SubAreaDao {

    @Override
    public List<Object> showSubAreaGroupByProvince() {
        String hql="select  r.province,count(*) from  Subarea s left  outer  join  s.region r group by  r.province";
        List<Object> list = (List<Object>) this.getHibernateTemplate().find(hql);
        return list;
    }
}
