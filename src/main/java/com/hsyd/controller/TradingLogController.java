package com.hsyd.controller;

import com.hsyd.model.Terminal;
import com.hsyd.model.TradingLog;
import com.hsyd.service.TradingLogService;
import com.hsyd.utils.PageUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by vie1224 on 2017/8/23.
 */
@Controller
public class TradingLogController {

    @Autowired
    private TradingLogService tradingLogService;

    /**
     * 查询交易日志
     * @param response
     * @param pageIndex
     * @param pageSize
     * @param patientCard
     * @param payType
     * @param startTime
     * @param endTime
     */
    @RequestMapping("selectTradingLogList")
    public void selectTradingLogList(HttpServletResponse response, @RequestParam("pageIndex") Integer pageIndex,
                                     @RequestParam("pageSize") Integer pageSize,@RequestParam(value = "patientCard", required = false) Integer patientCard,
                                     @RequestParam(value = "payType", required = false) Integer payType,
                                     @RequestParam(value = "startTime", required = false) String startTime,
                                     @RequestParam(value = "endTime",required = false) String endTime){

        List<TradingLog> tradingLogList = new ArrayList<>();
        TradingLog tradingLog = new TradingLog();
        tradingLog.setPayType("".equals(payType) ? null : payType);
        tradingLog.setPatientCard("".equals(patientCard) ? null : patientCard);
        PageUtil pageUtil = tradingLogService.selectTradingLogList(pageIndex,pageSize, tradingLog,startTime,endTime);

        String message = null;
        try {
            message = pageUtil==null||pageUtil.getResultList()==null?"nodata":"success";
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out;
            out = response.getWriter();
            JSONObject resultJSON = new JSONObject();
            resultJSON.put("message", message);
            JSONArray jsonArray = JSONArray.fromObject(pageUtil);
            resultJSON.put("pageUtil", jsonArray);
            out.println(resultJSON.toString());
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
