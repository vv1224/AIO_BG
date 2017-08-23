package com.hsyd.controller;

import com.hsyd.model.Terminal;
import com.hsyd.model.User;
import com.hsyd.service.UserService;
import com.hsyd.utils.PageUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by vie1224 on 2017/8/23.
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 登录
     * @param name
     * @param password
     */
    @RequestMapping("/login")
    @ResponseBody
    public String login(@RequestParam("name") String name, @RequestParam("password") String password){

        String message = "";
        String password2 = userService.selectUser(name);
        if(password2.equals(password) ){
            message = "success";
        }else {
            message = "您好，您的登录有误，请重新登录";
        }
        return message;
    }

    /**
     * 新增用户
     */
    @RequestMapping("/insertUser")
    @ResponseBody
    public String insertUser(@RequestParam("name") String name, @RequestParam("password") String password,
                             @RequestParam("rePassword") String rePassword, @RequestParam("roleId") Integer roleId){

        String message = "";
        if(!password.equals(rePassword)){
            message = "您输入的两次密码不一样，请重新输入";
            return message;
        }else {
            try {
                userService.insertUser(name,password,roleId);
            }catch (Exception e){
                e.printStackTrace();
            }
            message = "success";
        }
        return message;
    }

    /**
     * 用户列表查询
     */
    @RequestMapping("/selectUserList")
    public void selectUserList(HttpServletResponse response,@RequestParam("pageIndex") Integer pageIndex, @RequestParam("pageSize") Integer pageSize){

        List<User> userList = new ArrayList<>();
        PageUtil pageUtil = userService.selectUserList(pageIndex, pageSize);
        String message = "";
        try {
            message = pageUtil==null||pageUtil.getResultList()==null?"nodata":"success";
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
