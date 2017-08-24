package com.hsyd.controller;

import com.hsyd.model.Terminal;
import com.hsyd.service.TerminalService;
import com.hsyd.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.spec.ECField;

/**
 * Created by vie1224 on 2017/8/24.
 */
@Controller
public class TerminalController {

    @Autowired
    private TerminalService terminalService;

    /**
     * 修改终端
     * @param uuid
     * @return
     */
    @RequestMapping("/updateTerminal")
    @ResponseBody
    public String updateTerminal(@RequestParam("uuid") String uuid, @RequestParam("ip") String ip,
                                 @RequestParam("terminalModel") String terminalModel,@RequestParam("position") String position){

        String message = "";
        Terminal terminal = new Terminal();
        terminal.setIp(ip);
        terminal.setTerminalModel(terminalModel);
        terminal.setPosition(position);
        terminal.setUuid(uuid);
        try {
            terminalService.updateTerminal(terminal);
            message = "success";
        }catch (Exception e){
            message = "error";
            return message;
        }
        return message;
    }

    /**
     * 新增终端
     * @param ip
     * @param terminalModel
     * @param position
     * @param status
     * @param macAddress
     * @param linkMan
     * @param linkPhone
     * @return
     */
    @RequestMapping("/insertTerminal")
    @ResponseBody
    public String insertTerminal(@RequestParam("ip") String ip,@RequestParam("terminalModel") String terminalModel,
                                 @RequestParam("position") String position, @RequestParam("status") Integer status,
                                 @RequestParam("macAddress") String macAddress,@RequestParam("linkMan") String linkMan,
                                 @RequestParam("linkPhone") Integer linkPhone
                                 ){
        Terminal terminal = new Terminal();
        terminal.setUuid(CommonUtils.getUUID().toString());
        terminal.setIp(ip);
        terminal.setTerminalModel(terminalModel);
        terminal.setPosition(position);
        terminal.setStatus(status);
        terminal.setMacAddress(macAddress);
        terminal.setLinkMan(linkMan);
        terminal.setLinkPhone(linkPhone);
        String message = "";
        try {
            terminalService.insertTerminal(terminal);
            message = "success";
        }catch (Exception e){
            message = "error";
            e.printStackTrace();
            return message;
        }

        return message;
    }

    /**
     * 删除
     * @param uuid
     * @return
     */
    @RequestMapping("/deleteTerminal")
    @ResponseBody
    public String deleteTerminal(@RequestParam("uuid") String uuid){

        String message = "";
        try {
            terminalService.deleteTerminal(uuid);
            message = "success";
        } catch (Exception e){
            message = "error";
            return message;
        }
        return message;
    }
}
