package com.hsyd.service;

import com.hsyd.model.TradingLog;
import com.hsyd.utils.PageUtil;

/**
 * Created by vie1224 on 2017/8/23.
 */
public interface TradingLogService {
    PageUtil selectTradingLogList(Integer pageIndex,Integer pageSize, TradingLog tradingLog, String startTime, String endTime);
}
