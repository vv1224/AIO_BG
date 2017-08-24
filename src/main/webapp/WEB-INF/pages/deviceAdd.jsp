<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="zh-CN">
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>医院自助服务管理系统</title>
    <link rel="stylesheet" href="css/bootstrap3.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/base.css" >
    <link rel="stylesheet" href="css/common.css"/>
</head>
<body>





<header class="headerQ">
    <jsp:include page="header.jsp"></jsp:include>
</header>


<section class="container mT70">
    <!--侧边栏-->
    <aside id="aside" class="col-sm-2 col-xs-12">

    </aside>
    <!--主要内容-->
    <div id="content" class="col-sm-10 col-xs-12">
        <!-- 面包屑 -->
        <div class="mB0 row">
            <i class="glyphicon glyphicon-home"></i>&nbsp;
            <ul class="breadcrumb breadcrumbQ">
                <li><a href="${pageContext.request.contextPath}/gotoIndex.do">终端管理</a></li>
                <li class="active">新增终端</li>
            </ul>
        </div>
        <div class="row mB20">
            <div class="searchTitleQ">
                终端管理
            </div>
            <div class="boxQ">
                    <div class="form-group row">
                        <label for="deviceState" class="col-sm-3 control-label text-right">终端状态：</label>
                        <div class="col-sm-9">
                            <select class="form-control disInlineB w300" id="deviceState">
                                <option value="1">启用</option>
                                <option value="2">停用</option>
                            </select>
                            <span class="regQ deviceStateReg"></span>
                        </div>
                    </div>
                    <div class="form-group row mT20">
                        <label for="deviceId" class="col-sm-3 control-label text-right">终端编号：</label>
                        <div class="col-sm-9">
                            <input type="text" maxlength="10" class="form-control disInlineB w300" id="deviceId" value="">
                            <span class="regQ deviceIdReg"></span>
                        </div>
                    </div>
                    <div class="form-group row mT20">
                        <label for="deviceIp" class="col-sm-3 control-label text-right">终端IP：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control disInlineB w300" id="deviceIp"  value="">
                            <span class="regQ deviceIpReg"></span>
                        </div>
                    </div>
                    <div class="form-group row mT20">
                        <label for="deviceMAC" class="col-sm-3 control-label text-right">MAC地址：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control disInlineB w300" id="deviceMAC" value="">
                            <span class="regQ deviceMACReg"></span>
                        </div>
                    </div>
                    <div class="form-group row mT20">
                        <label for="deviceType" class="col-sm-3 control-label text-right">终端类型：</label>
                        <div class="col-sm-9">
                            <select class="form-control disInlineB w300" id="deviceType">
                                <option value="1">自助挂号缴费机</option>
                                <option value="1">自助打印机</option>
                            </select>
                            <span class="regQ deviceTypeReg"></span>
                        </div>
                    </div>
                    <div class="form-group row mT20">
                        <label for="deviceAddr" class="col-sm-3 control-label text-right">终端地址：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control disInlineB w300" id="deviceAddr" value="">
                            <span class="regQ deviceAddrReg"></span>
                        </div>
                    </div>
                    <div class="form-group row mT20">
                        <label for="personName" class="col-sm-3 control-label text-right">联系人：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control disInlineB w300" id="personName" value="">
                            <span class="regQ personNameReg"></span>
                        </div>
                    </div>
                    <div class="form-group row mT20">
                        <label for="personTel" class="col-sm-3 control-label text-right">联系人电话：</label>
                        <div class="col-sm-9">
                            <input type="tel" class="form-control disInlineB w300" id="personTel" value="">
                            <span class="regQ personTelReg"></span>
                        </div>
                    </div>
                    <div class="form-group row mT20">
                        <label for="" class="col-sm-3 control-label text-right">终端功能：</label>
                        <div class="col-sm-6 borderL">
                            <div class="row-sm-12">
                                <div class="col-sm-6">
                                    <input type="checkbox" id="createCard" name="terminalFunction"/>
                                    <label for="createCard">建卡</label>
                                </div>
                                <div class="col-sm-6">
                                    <input type="checkbox" id="cashAdd" name="terminalFunction"/>
                                    <label for="cashAdd">现金充值</label>
                                </div>
                            </div>

                            <div class="row-sm-12">
                                <div class="col-sm-6">
                                    <input type="checkbox" id="backAdd" name="terminalFunction"/>
                                    <label for="backAdd">银联充值</label>
                                </div>
                                <div class="col-sm-6">
                                    <input type="checkbox" id="todayRegister" name="terminalFunction"/>
                                    <label for="todayRegister">当日挂号</label>
                                </div>
                            </div>

                            <div class="row-sm-12">
                                <div class="col-sm-6">
                                    <input type="checkbox" id="appointmentRegister" name="terminalFunction"/>
                                    <label for="appointmentRegister">预约挂号</label>
                                </div>
                                <div class="col-sm-6">
                                    <input type="checkbox" id="appointmentGetNum" name="terminalFunction"/>
                                    <label for="appointmentGetNum">预约取号</label>
                                </div>
                            </div>

                            <div class="row-sm-12">
                                <div class="col-sm-6">
                                    <input type="checkbox" id="printReport" name="terminalFunction"/>
                                    <label for="printReport">打印报告</label>
                                </div>
                                <div class="col-sm-6">
                                    <input type="checkbox" id="checkSurplusMoney" name="terminalFunction"/>
                                    <label for="checkSurplusMoney">查询余额</label>
                                </div>
                            </div>

                            <div class="row-sm-12">
                                <div class="col-sm-6">
                                    <input type="checkbox" id="getMoney" name="terminalFunction"/>
                                    <label for="getMoney">缴费</label>
                                </div>
                                <div class="col-sm-6">
                                    <input type="checkbox" id="seleAll"/>
                                    <label for="seleAll">全选</label>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="form-group textC mT30">
                        <a id="submit" class="btn btn-success w100">确定</a>
                        <a href="${pageContext.request.contextPath}/gotoIndex.do" class="btn btn-warning w100">取消</a>
                    </div>
                </div>
        </div>



    </div>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>


<script src="js/jquery-2.2.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/layer/layer.js"></script>
<script src="js/common.js"></script>


<script>
//全选事件
$("#seleAll").change(function () {
    var checkList=document.getElementsByName("terminalFunction");
    console.log(checkList);
    if($(this).is(':checked')){
        console.log("选中了");
        for(var i=0;i<checkList.length;i++)
        {
            checkList[i].checked = 1;
        }
    }else{
        console.log("没选中");
        for(var i=0;i<checkList.length;i++)
        {
            checkList[i].checked = 0;
        }
    }
});

//************************验证***********************************/
//编号
$("#deviceId").blur(function(){
    if($("#deviceId").val()==""){
        $(".deviceIdReg").html("设备编号不允许为空!");
        $('.deviceIdReg').css("display","inline-block");
    }else if(IDReg($("#deviceId").val())){
        $(".deviceIdReg").html("10位英文和数字组合!");
        $('.deviceIdReg').css("display","inline-block");
    }else{
        $('.deviceIdReg').css("display","none");
    }
})

//IP地址
$("#deviceIp").blur(function(){
    if($("#deviceIp").val()==""){
        $(".deviceIpReg").html("请填写IP地址");
        $(".deviceIpReg").css("display","inline-block");
    }else if(IPReg($("#deviceIp").val())){
        $(".deviceIpReg").html("IP地址格式有误!");
        $(".deviceIpReg").css("display","inline-block");
    }else{
        $(".deviceIpReg").css("display","none");
    }
});

//MAC地址的验证
$("#deviceMAC").blur(function(){
    if($("#deviceMAC").val()==""){
        $(".deviceMACReg").html("请填写MAC地址！");
        $(".deviceMACReg").css("display","inline-block");
    }else{
        $(".deviceMACReg").css("display","none");
    }
});
//终端地址的验证
$("#deviceAddr").blur(function(){
    if($("#deviceAddr").val()==""){
        $(".deviceAddrReg").html("请填写终端地址！");
        $(".deviceAddrReg").css("display","inline-block");
    }else{
        $(".deviceAddrReg").css("display","none");
    }
});
//联系人验证
$("#personName").blur(function(){
    if($("#personName").val()==""){
        $(".personNameReg").html("请填写联系人姓名！");
        $(".personNameReg").css("display","inline-block");
    }else{
        $(".personNameReg").css("display","none");
    }
});
//联系人电话
$("#personTel").blur(function(){
    if($("#personTel").val()==""){
        $(".personTelReg").html("请填写联系人电话！");
        $(".personTelReg").css("display","inline-block");
    }else{
        $(".personTelReg").css("display","none");
    }
});


/************确认按钮的事件**********/
$("#submit").click(function(){
    if($("#deviceId").val()==""||$("#deviceIp").val()==""||$("#deviceMAC").val()==""||$("#deviceType").val()==""||$("#deviceAddr").val()==""||$("#personName").val()==""||$("#personTel").val()==""){
        layer.msg("请将内容填写完整！",{icon: 7});
    }else if($(".deviceIdReg").css("display")=="inline-block"||$(".deviceIpReg").css("display")=="inline-block"||$(".deviceMACReg").css("display")=="inline-block"||$(".deviceTypeReg").css("display")=="inline-block"||$(".deviceAddrReg").css("display")=="inline-block"||$(".personNameReg").css("display")=="inline-block"||$(".personTelReg").css("display")=="inline-block"){
        layer.msg("请正确填写内容！",{icon: 2});
    }else{
        layer.msg("添加成功！",{icon: 1});
    }
})


















//侧边栏加载样式
sideOn("终端管理");
</script>





</body>
</html>