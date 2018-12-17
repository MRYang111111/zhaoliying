package cn.yxd.dao;

import cn.yxd.basedao.IBaseDao;
import cn.yxd.bean.Function;

import java.util.List;

public interface FunctionDao  extends IBaseDao<Function> {
    //对用户进行查询所有的前线
   List<Function> findAll();
    //根据用户的id查询权限
    List<Function> findFunactionByUserId(String id);
//查询内置账号的菜单
    List<Function> findAllMene();
//查询普通用户的菜单
    List<Function> findMenuByUserId(String id);
}
