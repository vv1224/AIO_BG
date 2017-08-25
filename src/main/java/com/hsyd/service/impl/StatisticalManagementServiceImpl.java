package com.hsyd.service.impl;

import com.hsyd.dao.StatisticalManagementMapper;
import com.hsyd.model.SearchModel;
import com.hsyd.model.StatisticalManagement;
import com.hsyd.service.StatisticalManagementService;
import com.hsyd.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by vie1224 on 2017/8/25.
 */
@Service
public class StatisticalManagementServiceImpl implements StatisticalManagementService {

    @Autowired
    private StatisticalManagementMapper statisticalManagementMapper;

    @Override
    public PageUtil select(Integer pageIndex, Integer pageSize, String startTime) {

        List<StatisticalManagement> statisticalManagementList = new ArrayList<>();
        PageUtil pageUtil = new PageUtil();
        String endTime = "";
        try {
                pageUtil.setPageSize(pageSize);
                int rows = statisticalManagementMapper.selectTotal();
                pageUtil.setRows(rows);
                pageUtil.setPageIndex(pageIndex);
                if(!startTime.equals("") && startTime != null){
                    endTime = startTime + " 23:59:59";
                    startTime += " 00:00:00" ;
                    pageUtil.setStartTime(startTime);
                    pageUtil.setEndTime(endTime);
                }
                statisticalManagementList = statisticalManagementMapper.select(pageUtil);
                pageUtil.setResultList(statisticalManagementList);
        }catch (Exception e){
            e.printStackTrace();
        }
        return pageUtil;

    }
}
