package cn.yxd.dao;

import cn.yxd.basedao.IBaseDao;
import cn.yxd.basedaoImpl.BaseDaoImpl;
import cn.yxd.bean.Subarea;

import java.util.List;

public interface SubAreaDao extends IBaseDao<Subarea> {
    List<Object> showSubAreaGroupByProvince();
}
