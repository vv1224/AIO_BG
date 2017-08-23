package com.hsyd.controller;

import com.hsyd.model.Terminal;
import com.hsyd.service.MonitorService;
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
 * Created by vie1224 on 2017/8/22.
 */

@Controller
public class MonitorController {

    @Autowired
    private MonitorService monitorService;

    /**
     * 查询设备监控列表
     * @param response
     * @param pageIndex
     * @param pageSize
     * @param uuid
     */
    @RequestMapping("/selectMonitorInfo")
    public void selectMonitorInfo(HttpServletResponse response, @RequestParam("pageIndex")Integer pageIndex, @RequestParam("pageSize") Integer pageSize, @RequestParam(value = "uuid", defaultValue = "", required = false) String uuid){

        List<Terminal> terminalList = new ArrayList<>();
        PageUtil pageUtil = monitorService.selectMonitorInfo(pageIndex, pageSize, uuid);

        try {
            String message = pageUtil==null||pageUtil.getResultList()==null?"nodata":"success";
            PrintWriter out;
            response.setContentType("text/html; charset=UTF-8");
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
