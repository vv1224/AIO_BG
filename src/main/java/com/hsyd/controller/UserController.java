package com.hsyd.controller;

import com.hsyd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
