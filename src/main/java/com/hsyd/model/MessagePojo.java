package com.hsyd.model;

/**
 * Created by vie1224 on 2017/8/24.
 */
public class MessagePojo {

    private String messageContent;
    private String uuid;
    private String ip;
    private String macAddress;
    private String terminalModel;
    private String position;
    private String linkMan;
    private Integer linkPhone;

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
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

    public String getMacAddress() {
        return macAddress;
    }

    public void setMacAddress(String macAddress) {
        this.macAddress = macAddress;
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
