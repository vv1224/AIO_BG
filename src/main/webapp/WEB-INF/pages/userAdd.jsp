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
                <li><a href="userAdmin.jsp">用户管理</a></li>
                <li class="active">用户添加</li>
            </ul>
        </div>
        <!-- 搜索栏 -->
        <div class="row mB20">
            <div class="searchTitleQ">
                用户添加
            </div>
            <div class="boxQ">
                <!--第一部分-->
                <div class="partOne">
                    <p class="titleQ f16 mB30">用户添加</p>
                    <div class="form-group row">
                        <label for="userName" class="col-xs-4 control-label text-right">用户名：</label>
                        <div class="col-xs-8">
                            <input type="text" id="userName" class="form-control disInlineB w300" maxlength="10"/>
                            <span class="userNameReg regQ">用户名格式错误</span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="uPwd" class="col-xs-4 control-label text-right">密码：</label>
                        <div class="col-xs-8">
                            <input type="password" id="uPwd" class="form-control disInlineB w300" maxlength="20"/>
                            <span class="uPwdReg regQ"></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="uPwdOk" class="col-xs-4 control-label text-right">确认密码：</label>
                        <div class="col-xs-8">
                            <input type="password" id="uPwdOk" class="form-control disInlineB w300" maxlength="20"/>
                            <span class="uPwdOkReg regQ"></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="userRole" class="col-xs-4 control-label text-right">角色：</label>
                        <div class="col-xs-8">
                            <select class="form-control disInlineB w300" id="userRole">
                                <option value="-1">--请选择用户类型--</option>
                                <option value="0">管理员</option>
                                <option value="1">普通用户</option>
                            </select>
                            <span class="userRoleReg regQ"></span>
                        </div>
                    </div>

                    <div class="form-group textC row">
                        <a class="btn btn-success w100" id="submit">确定</a>
                        <a href="userAdmin.jsp" class="btn btn-warning w100">取消</a>
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
sideOn("用户管理");

//    姓名的验证
$("#userName").blur(function(){
    if(uNameReg($("#userName").val())){
        $(".userNameReg").html("必须包含2~8位中文和英文字符！");
        $(".userNameReg").css("display","inline-block");
    }else if($("#userName").val()==""){
        $(".userNameReg").html("请填入姓名！");
        $(".userNameReg").css("display","inline-block");
    }else{
        $(".userNameReg").css("display","none");
    }
});
$("#uPwd").blur(function(){
    if($("#uPwd").val().length<6){
        $(".uPwdReg").html("密码长度必须大于6位！");
        $(".uPwdReg").css("display","inline-block");
    }else if($("#uPwd").val()==""){
        $(".uPwdReg").html("请填入密码！");
        $(".uPwdReg").css("display","inline-block");
    }else{
        $(".uPwdReg").css("display","none");
    }
});
$("#uPwdOk").blur(function(){
    if($("#uPwd").val()!==$("#uPwdOk").val()){
        $(".uPwdOkReg").html("密码不一致");
        $(".uPwdOkReg").css("display","inline-block");
    }else if($(this).val()==""){
        $(".uPwdOkReg").html("请再填入密码！");
        $(".uPwdOkReg").css("display","inline-block");
    }else{
        $(".uPwdOkReg").css("display","none");
    }
});
$("#userRole").change(function(){
    if($("#userRole option:selected").val()==-1){
        $(".userRoleReg").html("请选择用户类型！");
        $(".userRoleReg").css("display","inline-block");
    }else{
        $(".userRoleReg").css("display","none");
    }
});

//确定按钮的事件
$("#submit").click(function(){
    if($(".uPwdReg").css("display")=="inline-block"||
            $(".userNameReg").css("display")=="inline-block"
            ||$(".uPwdOkReg").css("display")=="inline-block"||$(".userRoleReg").css("display")=="inline-block"){
        layer.msg("请正确填写内容！",{icon: 2});
    }else if($("#uPwd").val()==""||
            $("#userName").val()==""
            ||$("#uPwdOk").val()==""||$("#userRole option:selected").val()==-1){
        layer.msg("请将内容填写完整！",{icon: 2});
    }else{
        layer.msg("提交成功！",{icon: 1});
        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/insertUser.do',
            data:{
                "name":$("#userName").val(),
                "password":$("#uPwd").val(),
                "rePassword":$("#uPwdOk").val(),
                "roleId":$("#userRole option:selected").val()
            },
            success:function(data){
                console.log(data);
                if(data=="success"){
                    layer.msg("用户添加成功！",{icon: 1});
                    setTimeout(function(){
                        window.location.href="${pageContext.request.contextPath}/gotoUserAdmin.do";
                    },2000);
                }
            },
            error:function(){
                layer.msg("数据库请求失败！",{icon: 2});
            }
        })
    }
})


</script>





</body>
</html>