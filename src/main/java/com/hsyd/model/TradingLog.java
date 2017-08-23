package com.hsyd.model;

/**
 * Created by vie1224 on 2017/8/22.
 */
public class TradingLog {

    private Integer id;
    private Integer transactionId;          //交易序列号
    private Integer patientCard;            //就诊卡号
    private Integer beInHospital;           //住院号
    private String uuid;
    private Integer payType;                //交易方式 0：现金 1：支付宝 2：微信 3：医保卡 4：就诊卡 5：银联
    private String trading;                 //交易业务
    private String tradingMoney;            //交易金额
    private String tradingTime;             //交易时间
    private Integer tradingStatus;          //交易状态 0：成功 1：失败
    private String errorInfo;               //错误信息

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(Integer transactionId) {
        this.transactionId = transactionId;
    }

    public Integer getPatientCard() {
        return patientCard;
    }

    public void setPatientCard(Integer patientCard) {
        this.patientCard = patientCard;
    }

    public Integer getBeInHospital() {
        return beInHospital;
    }

    public void setBeInHospital(Integer beInHospital) {
        this.beInHospital = beInHospital;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public String getTrading() {
        return trading;
    }

    public void setTrading(String trading) {
        this.trading = trading;
    }

    public String getTradingMoney() {
        return tradingMoney;
    }

    public void setTradingMoney(String tradingMoney) {
        this.tradingMoney = tradingMoney;
    }

    public String getTradingTime() {
        return tradingTime;
    }

    public void setTradingTime(String tradingTime) {
        this.tradingTime = tradingTime;
    }

    public Integer getTradingStatus() {
        return tradingStatus;
    }

    public void setTradingStatus(Integer tradingStatus) {
        this.tradingStatus = tradingStatus;
    }

    public String getErrorInfo() {
        return errorInfo;
    }

    public void setErrorInfo(String errorInfo) {
        this.errorInfo = errorInfo;
    }
}
