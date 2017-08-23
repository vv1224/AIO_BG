package com.hsyd.model;

/**
 * Created by vie1224 on 2017/8/22.
 */
public class StatisticalManagement {

    private Integer id;
    private String date;
    private String cashTotal;       //现金总额
    private String unionPay;        //银联总额
    private Integer cardTotal;      //办卡总数
    private Integer registerTotal;  //挂号总数
    private Integer paymentTotal;   //缴费金额
    private Integer reportTotal;    //打印报告总数

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCashTotal() {
        return cashTotal;
    }

    public void setCashTotal(String cashTotal) {
        this.cashTotal = cashTotal;
    }

    public String getUnionPay() {
        return unionPay;
    }

    public void setUnionPay(String unionPay) {
        this.unionPay = unionPay;
    }

    public Integer getCardTotal() {
        return cardTotal;
    }

    public void setCardTotal(Integer cardTotal) {
        this.cardTotal = cardTotal;
    }

    public Integer getRegisterTotal() {
        return registerTotal;
    }

    public void setRegisterTotal(Integer registerTotal) {
        this.registerTotal = registerTotal;
    }

    public Integer getPaymentTotal() {
        return paymentTotal;
    }

    public void setPaymentTotal(Integer paymentTotal) {
        this.paymentTotal = paymentTotal;
    }

    public Integer getReportTotal() {
        return reportTotal;
    }

    public void setReportTotal(Integer reportTotal) {
        this.reportTotal = reportTotal;
    }
}
