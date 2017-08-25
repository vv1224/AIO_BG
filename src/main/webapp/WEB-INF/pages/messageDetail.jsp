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
    <link rel="stylesheet" href="css/deviceConfigure.css"/>
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
                <li><a href="${pageContext.request.contextPath}/gotoMessageAdmin.do">消息管理</a></li>
                <li class="active">消息详情</li>
            </ul>
        </div>
        <!-- 搜索栏 -->
        <div class="row mB20">
            <div class="searchTitleQ">
                消息详情
            </div>
            <div class="boxQ">
                <!--第一部分-->
                <div class="partOne">
                    <p class="titleQ f16 mB30">详情</p>
                    <div class="form-group row">
                        <label for="uuId" class="col-xs-4 control-label text-right">终端编号：</label>
                        <div class="col-xs-6">
                            <input id="uuId" type="text" class="form-control w300" readonly value="123123" maxlength="20"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="devIp" class="col-xs-4 control-label text-right">终端IP：</label>
                        <div class="col-xs-6">
                            <input id="devIp" type="text" class="form-control w300" readonly value="192.168.1.1" maxlength="20"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="devMacAddr" class="col-xs-4 control-label text-right">MAC地址：</label>
                        <div class="col-xs-6">
                            <input id="devMacAddr" type="text" class="form-control w300" readonly value="ADdikjialasdijaD434" maxlength="20"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="devType" class="col-xs-4 control-label text-right">终端类型：</label>
                        <div class="col-xs-6">
                            <input id="devType" type="text" class="form-control w300" readonly value="缴费机器" maxlength="20"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="devPosition" class="col-xs-4 control-label text-right">终端地址：</label>
                        <div class="col-xs-6">
                            <input id="devPosition" type="text" class="form-control w300" readonly value="门诊大厅" maxlength="20"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="linkMan" class="col-xs-4 control-label text-right">联系人：</label>
                        <div class="col-xs-6">
                            <input id="linkMan" type="text" class="form-control w300" readonly value="二强" maxlength="20"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="linkPhone" class="col-xs-4 control-label text-right">联系人电话：</label>
                        <div class="col-xs-6">
                            <input id="linkPhone" type="text" class="form-control w300" readonly value="15033333333" maxlength="20"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="devMessage" class="col-xs-4 control-label text-right">故障信息：</label>
                        <div class="col-xs-6">
                            <input id="devMessage" type="text" class="form-control w300" readonly value="卡纸状态" maxlength="20"/>
                        </div>
                    </div>

                    <div class="form-group textC row">
                        <a href="${pageContext.request.contextPath}/gotoMessageAdmin.do" class="btn btn-success w100">返回</a>
                    </div>

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
<script src="js/jedate/jedate.js"></script>
<script src="js/common.js"></script>


<script>
    +function(){
        var search=window.location.search;//?uuid=1001;
        var uuid=search.split("=")[1];//1001;
        $.ajax({
            type:'get',
            url:"${pageContext.request.contextPath}/selectMessageInfo.do?uuid="+uuid,
            success:function(data){
                console.log(data);
                //layer.msg("数据请求成功！",{icon: 1});
                $("#uuId").val(data.uuid);
                $("#devIp").val(data.ip);
                $("#devMacAddr").val(data.macAddress);
                $("#devType").val(data.terminalModel);
                $("#devPosition").val(data.position);
                $("#linkMan").val(data.linkMan);
                $("#linkPhone").val(data.linkPhone);
                $("#devMessage").val(data.messageContent);
            },
            error:function(){
                layer.msg("数据请求失败！",{icon: 2});
            }
        });
    }();

    //侧边栏加载样式
    sideOn("消息管理");
</script>





</body>
</html>