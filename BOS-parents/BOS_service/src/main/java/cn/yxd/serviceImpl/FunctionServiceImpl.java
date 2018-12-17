package cn.yxd.serviceImpl;

import cn.yxd.bean.Function;
import cn.yxd.dao.FunctionDao;
import cn.yxd.servce.FunctionService;
import cn.yxd.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class FunctionServiceImpl implements FunctionService {
    @Autowired
    private FunctionDao functionDao;
    @Override
    public List<Function> listtoajax() {
        //查询说有的权限
        return functionDao.findAll();
    }

    @Override
    public void add(Function modle) {
        //添加权限
        functionDao.save(modle);
    }

    @Override
    public void pageQuery(PageBean pageBean) {
        //分页查询
        functionDao.pageQuery(pageBean);
    }
}
