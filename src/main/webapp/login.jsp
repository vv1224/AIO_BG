<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>医院自助服务管理系统</title>
    <link rel="stylesheet" href="css/bootstrap3.min.css"/>
    <link rel="stylesheet" href="css/base.css" >
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <style>
        .frame{
            width:100%;
            height:100%;
            position: absolute;
            top:0;left:0;
            z-index: 100;
            background-image: url("./img/07.png");
            background-repeat: no-repeat;
            background-position: center;
            background-size:cover;

        }
        .box{
            width:450px;
            height:auto;
            background-color:rgba(255,255,255,0.4);
            box-shadow: 0px 0px 10px 8px rgba(255,255,255,0.7);
            border-radius: 20px;
            position: absolute;
            top:50%;
            left:50%;
            transform: translate(-50%,-50%);
            z-index: 3;
            padding: 40px;
        }
        .title{
            color: #fff;
            font-size: 25px;
            font-weight: bolder;
            font-family: Arial;
            text-shadow: -8px -8px 10px 2px rgba(97,174,14,0.5);
            -webkit-text-stroke: 1px rgba(97,174,14,0.5);
            text-stroke: 1px rgba(97,174,14,0.5);

        }
        .btn{
            background-color: #5AAA03;
            color: #fff;
        }
        .btn:hover,.btn:active{
            background-color: #488308;
            color: #fff;
        }
        footer{
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div class="frame">
    <div class="box">
        <div class="row"><h2 class="m0 textC title">医院自助服务管理系统</h2></div>
        <div class="form-group has-success has-feedback mT20">
            <label class="control-label" for="uName">用户名:</label>
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user fa-lg"></i></span>
                <input type="text" class="form-control" id="uName" maxlength="10">
            </div>
        </div>
        <div class="form-group has-success has-feedback mT20">
            <label class="control-label" for="uPwd">密码:</label>
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-key"></i></span>
                <input type="password" class="form-control" id="uPwd" maxlength="25">
            </div>
            <a id="submit" class="btn disBlock mT30 f16">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
        </div>

        <footer>
            <img src="img/195-60.png"/>
            <p class="mT10">&copy;北京华生医叮版权所有 2017 | 京ICP备17034868-2 copyright</p>
        </footer>
    </div>


</div>
<script src="js/jquery-2.2.3.js"></script>
<script src="js/layer/layer.js"></script>
<script>

$("#submit").click(function(){
    if($("#uName").val()==""||$("#uPwd").val()==""){
        layer.msg("请将信息填写完整！",{icon: 7});
    }else{
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/login.do",
            data:{
                "name":$("#uName").val(),
                "password":$("#uPwd").val(),
            },
            dataType:"json",
            success:function(data){
                console.log(data);
                if(data=="success"){
                    window.location.href="${pageContext.request.contextPath}/gotoIndex.do";
                }else{
                    layer.msg("密码错误，请查阅！",{icon: 2});
                }
            },
            error:function(){
                console.log("数据库请求失败！");
            }
        });
    }
})



//    这是一个测试数

</script>
</body>
</html>