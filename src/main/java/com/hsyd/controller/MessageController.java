package com.hsyd.controller;

import com.hsyd.model.Message;
import com.hsyd.model.MessagePojo;
import com.hsyd.service.MessageService;
import com.hsyd.utils.PageUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by vie1224 on 2017/8/24.
 */
@Controller
public class MessageController {

    @Autowired
    private MessageService messageService;

    /**
     * 查询消息列表
     * @param response
     * @param pageIndex
     * @param pageSize
     */
    @RequestMapping("/selectMessageList")
    public void selectMessageList(HttpServletResponse response, @RequestParam("pageIndex") Integer pageIndex,
                                  @RequestParam("pageSize") Integer pageSize){
        List<Message> messageList = new ArrayList<>();
        PageUtil pageUtil = messageService.selectMessageList(pageIndex, pageSize);
        String message = "";
        try {
            message = pageUtil==null||pageUtil.getResultList()==null?"nodata":"success";
            PrintWriter out;
            out = response.getWriter();
            response.setContentType("text/html; charset=UTF-8");
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

    /**
     * 查询详情信息
     * @param uuid
     * @return
     */
    @RequestMapping("/selectMessageInfo")
    @ResponseBody
    public Object selectMessageInfo(@RequestParam("uuid") String uuid){

        MessagePojo messagePojo = new MessagePojo();
        try {
            messagePojo = messageService.selectMessageInfo(uuid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return messagePojo;
    }

    /**
     * 删除消息
     * @param uuid
     * @return
     */
    @RequestMapping("deleteMessageByUuid")
    @ResponseBody
    public String deleteMessageByUuid(@RequestParam("uuid") String uuid){
        String message = "";

            messageService.deleteMessageByUuid(uuid);
            message = "success";
            return message;
    }

}
