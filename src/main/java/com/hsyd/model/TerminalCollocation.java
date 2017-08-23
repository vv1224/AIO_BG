package com.hsyd.model;

/**
 * Created by vie1224 on 2017/8/22.
 */
public class TerminalCollocation {

    private Integer id;
    private String uuid;
    private String hospitalName;
    private String hospitalLog;
    private String hospitalGround;
    private Integer windowCount;        //窗口倒计时                  默认60s
    private Integer moneyCount;         //纸币收钞倒计时               默认90s
    private Integer screenSaver;        //屏保倒计时                   默认120s
    private Integer listStampCount;     //化验单允许打印次数            默认1
    private Integer listInHospitalCount;//住院清单允许打印次数          默认1
    private String openTime;            //开机时间
    private String closeTime;           //关机时间

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

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    public String getHospitalLog() {
        return hospitalLog;
    }

    public void setHospitalLog(String hospitalLog) {
        this.hospitalLog = hospitalLog;
    }

    public String getHospitalGround() {
        return hospitalGround;
    }

    public void setHospitalGround(String hospitalGround) {
        this.hospitalGround = hospitalGround;
    }

    public Integer getWindowCount() {
        return windowCount;
    }

    public void setWindowCount(Integer windowCount) {
        this.windowCount = windowCount;
    }

    public Integer getMoneyCount() {
        return moneyCount;
    }

    public void setMoneyCount(Integer moneyCount) {
        this.moneyCount = moneyCount;
    }

    public Integer getScreenSaver() {
        return screenSaver;
    }

    public void setScreenSaver(Integer screenSaver) {
        this.screenSaver = screenSaver;
    }

    public Integer getListStampCount() {
        return listStampCount;
    }

    public void setListStampCount(Integer listStampCount) {
        this.listStampCount = listStampCount;
    }

    public Integer getListInHospitalCount() {
        return listInHospitalCount;
    }

    public void setListInHospitalCount(Integer listInHospitalCount) {
        this.listInHospitalCount = listInHospitalCount;
    }

    public String getOpenTime() {
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }

    public String getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(String closeTime) {
        this.closeTime = closeTime;
    }
}
