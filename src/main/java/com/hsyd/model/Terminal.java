package com.hsyd.model;

/**
 * Created by vie1224 on 2017/8/22.
 */
public class Terminal {

    private Integer id;
    private String uuid;
    private String ip;
    private String terminalModel;   //终端型号
    private String position;        //终端所在位置
    private Integer status;          //终端使用状态
    private String macAddress;      //mac地址
    private String linkMan;         //联系人
    private Integer linkPhone;      //联系电话

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getTerminalModel() {
        return terminalModel;
    }

    public void setTerminalModel(String terminalModel) {
        this.terminalModel = terminalModel;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMacAddress() {
        return macAddress;
    }

    public void setMacAddress(String macAddress) {
        this.macAddress = macAddress;
    }

    public String getLinkMan() {
        return linkMan;
    }

    public void setLinkMan(String linkMan) {
        this.linkMan = linkMan;
    }

    public Integer getLinkPhone() {
        return linkPhone;
    }

    public void setLinkPhone(Integer linkPhone) {
        this.linkPhone = linkPhone;
    }
}
