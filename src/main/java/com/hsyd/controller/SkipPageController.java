package com.hsyd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by vie1224 on 2017/8/22.
 */
@Controller
public class SkipPageController {

    /**
     * 设备监控
     * @param modelAndView
     * @return
     */
    @RequestMapping("/gotoDeviceMonitor")
    public Object gotoDeviceMonitor(ModelAndView modelAndView){
        modelAndView.setViewName("deviceMonitor");
        return modelAndView;
    }

    /**
     * 设备详情
     * @param modelAndView
     * @return
     */
    @RequestMapping("/gotoDeviceMonitorDetail")
    public Object gotoDeviceMonitorDetail(ModelAndView modelAndView){
        modelAndView.setViewName("deviceMonitorDetail");
        return modelAndView;
    }

    /**
     * 终端管理
     * @param modelAndView
     * @return
     */
    @RequestMapping("/gotoIndex")
    public Object gotoIndex(ModelAndView modelAndView){
        modelAndView.setViewName("index");
        return modelAndView;
    }

    /**
     * 终端配置
     * @param modelAndView
     * @return
     */
    @RequestMapping("/gotoDeviceConfigure")
    public Object gotoDeviceConfigure(ModelAndView modelAndView){
        modelAndView.setViewName("deviceConfigure");
        return modelAndView;
    }

    /**
     * 统计管理
     * @param modelAndView
     * @return
     */
    @RequestMapping("/gotoCountAdmin")
    public Object gotoCountAdmin(ModelAndView modelAndView){
        modelAndView.setViewName("countAdmin");
        return modelAndView;
    }

    /**
     * 用户管理
     * @param modelAndView
     * @return
     */
    @RequestMapping("/gotoUserAdmin")
    public Object gotoUserAdmin(ModelAndView modelAndView){
        modelAndView.setViewName("userAdmin");
        return modelAndView;
    }

    /**
     * 用户添加
     * @param modelAndView
     * @return
     */
    @RequestMapping("/gotoUserAdd")
    public Object gotoUserAdd(ModelAndView modelAndView){
        modelAndView.setViewName("userAdd");
        return modelAndView;
    }

    /**
     * 消息管理
     * @param modelAndView
     * @return
     */
    @RequestMapping("/gotoMessageAdmin")
    public Object gotoMessageAdmin(ModelAndView modelAndView){
        modelAndView.setViewName("messageAdmin");
        return modelAndView;
    }

    /**
     * 消息详情
     * @param modelAndView
     * @return
     */
    @RequestMapping("/gotoMessageDetail")
    public Object gotoMessageDetail(ModelAndView modelAndView){
        modelAndView.setViewName("messageDetail");
        return modelAndView;
    }

}
