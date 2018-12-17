package cn.yxd.utils;

import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public class PageBean {

    private int currentPage;//当前记录数;
    private  int pageSize;//每页记录数
    private DetachedCriteria detachedCriteria;//离线查询条件
    private  int total;//总的记录数
    private List rows;//查询的数据信息

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public DetachedCriteria getDetachedCriteria() {
        return detachedCriteria;
    }

    public void setDetachedCriteria(DetachedCriteria detachedCriteria) {
        this.detachedCriteria = detachedCriteria;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }
}
