package com.hsyd.service.impl;

import com.hsyd.dao.TradingLogMapper;
import com.hsyd.model.SearchModel;
import com.hsyd.model.TradingLog;
import com.hsyd.service.TradingLogService;
import com.hsyd.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by vie1224 on 2017/8/23.
 */
@Service
public class TradingLogServiceImpl implements TradingLogService {

    @Autowired
    private TradingLogMapper tradingLogMapper;

    @Override
    public PageUtil selectTradingLogList(Integer pageIndex, Integer pageSize,  TradingLog tradingLog, String startTime, String endTime) {

        List<TradingLog> tradingLogList = new ArrayList<>();
        SearchModel searchModel = new SearchModel();
        searchModel.setStartTime(startTime);
        searchModel.setEndTime(endTime);
        PageUtil pageUtil = new PageUtil();
        pageUtil.setSearchModel(searchModel);

        try {
            pageUtil.setPageSize(pageSize);
            int rows = tradingLogMapper.selectTotal(pageUtil);
            pageUtil.setRows(rows);
            pageUtil.setPageIndex(pageIndex);
            pageUtil.setTradingLog(tradingLog);
            tradingLogList = tradingLogMapper.selectTradingLogList(pageUtil);
            pageUtil.setResultList(tradingLogList);
        }catch (Exception e){
            e.printStackTrace();
        }

        return pageUtil;
    }
}
