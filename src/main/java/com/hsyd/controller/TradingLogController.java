package com.hsyd.controller;

import com.hsyd.model.Terminal;
import com.hsyd.model.TradingLog;
import com.hsyd.service.TradingLogService;
import com.hsyd.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by vie1224 on 2017/8/23.
 */
@Controller
public class TradingLogController {

    @Autowired
    private TradingLogService tradingLogService;

    @RequestMapping("selectTradingLogList")
    public void selectTradingLogList(HttpServletResponse response, @RequestParam("pageIndex") Integer pageIndex,
                                     @RequestParam("pageSize") Integer pageSize,@RequestParam("patientCard") Integer patientCard,
                                     @RequestParam("payType") Integer payType,@RequestParam("startTime") String startTime,@RequestParam("endTime") String endTime){

        List<TradingLog> tradingLogList = new ArrayList<>();
        TradingLog tradingLog = new TradingLog();
        tradingLog.setPayType("".equals(payType) ? null : payType);
        tradingLog.setPatientCard("".equals(patientCard) ? null : patientCard);
        PageUtil pageUtil = tradingLogService.selectTradingLogList(pageIndex,pageSize, tradingLog,startTime,endTime);

    }

}
