package com.hsyd.model;

/**
 * 设备
 * Created by vie1224 on 2017/8/22.
 */
public class Equipment {

    private Integer id;
    private String uuid;
    private String equipmentName;
    private Integer status;             //设备状态 0：正常 1：错误
    private String errorTime;
    private String errorInfo;

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

    public String getEquipmentName() {
        return equipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getErrorTime() {
        return errorTime;
    }

    public void setErrorTime(String errorTime) {
        this.errorTime = errorTime;
    }

    public String getErrorInfo() {
        return errorInfo;
    }

    public void setErrorInfo(String errorInfo) {
        this.errorInfo = errorInfo;
    }
}
