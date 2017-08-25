package com.hsyd.controller;

import com.hsyd.model.StatisticalManagement;
import com.hsyd.service.StatisticalManagementService;
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
 * Created by vie1224 on 2017/8/25.
 */
@Controller
public class StatisticalManagementController {

    @Autowired
    private StatisticalManagementService statisticalManagementService;

    /**
     * 查询
     * @param response
     * @param pageIndex
     * @param pageSize
     * @param startTime
     */
    @RequestMapping("select")
    public void select(HttpServletResponse response, @RequestParam("pageIndex") Integer pageIndex,
                       @RequestParam("pageSize")Integer pageSize,@RequestParam("startTime") String startTime){

        String message = "";
        List<StatisticalManagement> statisticalManagementList = new ArrayList<>();
        PageUtil pageUtil = new PageUtil();
        try {
            pageUtil = statisticalManagementService.select(pageIndex, pageSize, startTime);
        }catch (Exception e){
            e.printStackTrace();
        }
        try {
            PrintWriter out;
            message = pageUtil==null||pageUtil.getResultList()==null?"nodata":"success";
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
