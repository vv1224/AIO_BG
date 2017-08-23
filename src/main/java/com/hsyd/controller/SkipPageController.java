package com.hsyd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by vie1224 on 2017/8/22.
 */
@Controller
public class SkipPageController {

    @RequestMapping("/gotoIndex")
    public Object gotoIndex(ModelAndView modelAndView){
        modelAndView.setViewName("countAdmin");
        return modelAndView;
    }

}
