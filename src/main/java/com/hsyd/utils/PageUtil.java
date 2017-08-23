package com.hsyd.utils;

import java.util.List;
import com.hsyd.model.SearchModel;
/**
 * Created by vie1224 on 2017/8/22.
 */
public class PageUtil<T> {


        private Integer pageIndex = 1;  // 当前页
        private Integer pageSize = 10;  // 每页长度
        private Integer rows = 0;       // 总记录条数
        private Integer pageCount = 0;  // 总页数
        private Integer start = 0;      // 起始页
        private List<T> resultList;    // 结果集
        private SearchModel searchModel;// 查询条件
        private Integer endFlag;        // 结束页标记
        private boolean isPage=true;   // 是否分页
        private String uuid;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public PageUtil(){}

        public PageUtil(Integer pageIndex, Integer pageSize, Integer pageCount, Integer start) {
            this.pageIndex = pageIndex;
            this.pageSize = pageSize;
            this.pageCount = pageCount;
            this.start = start;
        }

        public Integer getPageIndex() {
            return pageIndex;
        }

        public void setEndFlag(Integer endFlag) {
            this.endFlag = endFlag;
        }

        public Integer getEndFlag() {
            return endFlag;
        }

        public void setPageIndex(Integer pageIndex) {
            // 设置起始页
            if(pageIndex != null && pageIndex > 0){
                pageIndex = pageIndex>pageCount?(pageCount<=0?1:pageCount):pageIndex;
                this.start = (pageIndex-1)*pageSize;
            }else{
                pageIndex = 1;
            }
            this.pageIndex = pageIndex;
        }

        public Integer getRows() {
            return rows;
        }

        public void setRows(Integer rows){
            // 计算总页数
            if(rows != null && rows > 0){
                this.pageCount = rows%pageSize==0?rows/pageSize:(rows/pageSize)+1;
            }else{
                rows = 0;
            }
            this.rows = rows;
        }

        public Integer getPageSize() {
            return pageSize;
        }

        public void setPageSize(Integer pageSize) {
            if(pageSize != null && pageSize > 0)
                this.pageSize = pageSize;
        }

        public Integer getPageCount() {
            return pageCount;
        }

        public Integer getStart() {
            return start;
        }

        public List<T> getResultList() {
            return resultList;
        }

        public void setResultList(List<T> resultList) {
            this.resultList = resultList;
        }

        public SearchModel getSearchModel() {
            return searchModel;
        }

        public void setSearchModel(SearchModel searchModel) {
            this.searchModel = searchModel;
        }

        public void setStart(Integer start) {
            this.start = start;
        }

        public boolean isPage() {
            return isPage;
        }

        public void setPage(boolean page) {
            isPage = page;
        }
    }

