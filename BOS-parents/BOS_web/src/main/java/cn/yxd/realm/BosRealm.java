package cn.yxd.realm;

import cn.yxd.bean.Function;
import cn.yxd.bean.User;
import cn.yxd.dao.FunctionDao;
import cn.yxd.dao.UserDao;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.realm.SimpleAccountRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BosRealm extends AuthorizingRealm {
    @Autowired
    private UserDao  userDao;
    @Autowired
    private FunctionDao functionDao;
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //授权信息、authorization
        //对staff-list进行授权
        SimpleAuthorizationInfo simpleAuthorizationInfo=new SimpleAuthorizationInfo();
        //simpleAuthorizationInfo.addStringPermission("staff-list");
        //TODO  后期通过银行登入去查询数据库，根据银行去查询用户应有的权限
        /**
         * 授权方法
         *可分为admin超级管理员权限和yxd普通员工权限
         * 超级管理员admin
         * 普通用户zly
         *
         *
         */
        //获取当前的用户对象
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        //根据登入的用户查询数据库，查询实际获取的权限信息
        List<Function> list=null;
        try {
            //登入的内置账号
            if(user.getUsername().equals("yxd")){
                DetachedCriteria detachedCriteria=DetachedCriteria.forClass(Function.class);
                //超级管理员内置权限，获取所有的用户
                list=functionDao.findFunactionByUserId(user.getId());

            }else if(user.getUsername().equals("admin")){
                DetachedCriteria detachedCriteria=DetachedCriteria.forClass(Function.class);
                //超级管理员内置权限，获取所有的用户
                list=functionDao.findFunactionByUserId(user.getId());
            }else {
                list=functionDao.findFunactionByUserId(user.getId());
            }
            if(list!=null&&list.size()>0){
                for (Function f:list){
                    System.out.println(f.getCode());
                    simpleAuthorizationInfo.addStringPermission(f.getCode());
                }
            }
            System.out.println(list);

        }catch (Exception e){
              e.printStackTrace();
        }
        return simpleAuthorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //认证信息
        System.out.println("你的信息为认证");
        //根据用户名去寻找改用用户的信息
        //根据用户名查询user
//        UsernamePasswordToken authenticationToken1 = (UsernamePasswordToken) authenticationToken;
//        String username=((UsernamePasswordToken) authenticationToken).getUsername();
//        //根据用户的名称去查询数据库
//        User user=userDao.findUserByName(username);
//        if(user==null){
//            return null;
//        }
//        //如果能查询到，再由框架比对数据库中查询到的密码和页面提交的密码是否一致
//        AuthenticationInfo authenticationInfo= new SimpleAuthenticationInfo(user,user.getPassword(),this.getName());
//        return  authenticationInfo;

        UsernamePasswordToken usernamePasswordToken= (UsernamePasswordToken) token;
        String username=usernamePasswordToken.getUsername();
        User user = userDao.findUserByName(username);
        if(user==null){
            return  null;
        }else {
            //如果查询到，shiro框架进行客户端输入的密码与数据库的密码进行验证
            SimpleAuthenticationInfo authenticatingRealmb= new SimpleAuthenticationInfo(user, user.getPassword(),this.getName() );
            return  authenticatingRealmb;
        }

    }
}
