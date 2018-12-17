package cn.yxd.daoImpl;

import cn.yxd.basedaoImpl.BaseDaoImpl;
import cn.yxd.bean.Function;
import cn.yxd.dao.FunctionDao;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class FunctionDaoImpl extends BaseDaoImpl<Function>implements  FunctionDao{
    public List<Function> findAll(){
        String hql="from Function f where f.parentFunction is null";
        List<Function> list = (List<Function>) this.getHibernateTemplate().find(hql);
        return  list;
    }

    @Override
    public List<Function> findFunactionByUserId(String id) {
        System.out.println("userid的值为"+id);
        /**
         * 根据用户的id查询所有的权限
         *
         */
        String hql="SELECT f FROM Function f LEFT OUTER JOIN f.roles r LEFT OUTER JOIN r.users u WHERE u.id=?";
        //String hql="SELECT DISTINCT  f  FROM Function f LEFT OUTER  JOIN f.roles r LEFT OUTER JOIN r.users u WHERE u.id=?";
        //String hql=" SELECT f FROM  User u LEFT OUTER  JOIN  u.roles r LEFT OUTER JOIN r.functions f WHERE u.id=? ";
        List<Function> list = (List<Function>) this.getHibernateTemplate().find(hql,id);
        if(list!=null&&list.size()>0){
            for (Function function:list){
                System.out.println("functionDao中的权限集合为"+function);
            }
        }else {
            System.out.println("functionDaoImpldelist集合为null");
        }

        //System.out.println("functionDaoimpl的集合时"+list);
        return list;
    }

    @Override
    public List<Function> findAllMene() {
        String hql=" FROM Function f  WHERE f.generatemenu='1' ORDER BY f.zindex DESC";
        List<Function>  list= (List<Function>) this.getHibernateTemplate().find(hql);
        if(list!=null&&list.size()>0){
            return list;
        }else {
            return null;
        }
    }

    @Override
    public List<Function> findMenuByUserId(String id) {
        String hql="SELECT f FROM Function f LEFT OUTER JOIN f.roles r LEFT OUTER JOIN r.users u WHERE u.id=? AND f.generatemenu='1'";
        List<Function> list = (List<Function>) this.getHibernateTemplate().find(hql,id);
        if(list!=null&&list.size()>0){
            return list;
        }else {
            return null;
        }
    }

}
