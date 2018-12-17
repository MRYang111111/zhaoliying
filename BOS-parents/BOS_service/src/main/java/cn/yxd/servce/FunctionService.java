package cn.yxd.servce;

import cn.yxd.bean.Function;
import cn.yxd.utils.PageBean;
import org.springframework.stereotype.Service;

import java.util.List;


public interface FunctionService {
    //查询所有的权限
    List<Function> listtoajax();
//添加权限
    void add(Function modle);

    void pageQuery(PageBean pageBean);
}
