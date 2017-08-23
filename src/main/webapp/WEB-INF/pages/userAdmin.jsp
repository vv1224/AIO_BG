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
                <li class="active">用户管理</li>
            </ul>
        </div>
        <div class="row mB20">
            <div class="searchTitleQ">
                用户管理
            </div>
            <div class="boxQ">
                <a href="userAdd.jsp" type="button" class="btn btn-success mB20"> <i class="glyphicon glyphicon glyphicon-plus"></i> 新增</a>
                <!-- 查询列表-->
                <div class="row mT10">
                    <div class="table-responsive">
                        <table class='table table-bordered table-hover table-striped qzq_table'>
                            <thead>
                                <th>选择</th>
                                <th>序号</th>
                                <th>用户名</th>
                                <th>创建时间</th>
                                <th>角色</th>
                                <th>操作</th>
                            </thead>
                            <tbody>
                            <tr>
                                <td><input type="checkbox" name="userSele"/></td>
                                <td>1</td>
                                <td>张三</td>
                                <td>2017/06/12</td>
                                <td>管理员</td>
                                <td>
                                    <a href="javascript:qzqCloseModal();">编辑</a>
                                    <a onclick="delUser(1)">删除</a>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="userSele"/></td>
                                <td>2</td>
                                <td>李四</td>
                                <td>2017/06/23</td>
                                <td>普通用户</td>
                                <td>
                                    <a href="javascript:qzqCloseModal();">编辑</a>
                                    <a onclick="delUser(2)">删除</a>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="userSele"/></td>
                                <td>3</td>
                                <td>王五</td>
                                <td>2017/07/12</td>
                                <td>管理员</td>
                                <td>
                                    <a href="javascript:qzqCloseModal();">编辑</a>
                                    <a onclick="delUser(3)">删除</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--全选按钮-->
                    <div class="form-group">
                        <input id="seleAll" type="checkbox"/>
                        <label for="seleAll" class="verticalM">全选</label>
                        <a href="#" class="btn btn-warning mL20"><i class="fa fa-trash-o fa-lg"></i>批量删除</a>
                    </div>
                </div>




            </div>
        </div>


    </div>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>


<div class="qzqModal">
    <div class="pB10 qzq_ModalForm">
        <span class="qzqCloseModal" onclick="qzqCloseModal()">×</span>
        <h5 class="h5">用户信息：</h5>
        <div class="form-horizontal">
            <div class="form-group">
                <label for="userName" class="col-sm-3 control-label">用户名：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="userName" value="">
                    <span class="userNameReg regQ">用户名格式错误</span>
                </div>
            </div>
            <div class="form-group">
                <label for="uPwd" class="col-sm-3 control-label">密码：</label>
                <div class="col-sm-6">
                    <input type="number" class="form-control" id="uPwd" value="">
                    <span class="uPwdReg regQ"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="uPwdOk" class="col-sm-3 control-label">确认密码：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="uPwdOk" value="">
                    <span class="uPwdOkReg regQ"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="userRole" class="col-sm-3 control-label">角色：</label>
                <div class="col-sm-6">
                    <select class="form-control" id="userRole">
                        <option value="1">管理员</option>
                        <option value="2">普通用户</option>
                    </select>
                    <span class="userRoleReg regQ"></span>
                </div>
            </div>

            <div class="form-group textC">
                <a id="submit" class="btn btn-success w100">确定</a>
                <a href="javascript:;" onclick="qzqCloseModal()" class="btn btn-warning w100">取消</a>
            </div>

        </div>
    </div>
</div>


<script src="js/jquery-2.2.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/layer/layer.js"></script>
<script src="js/jedate/jedate.js"></script>
<script src="js/common.js"></script>


<script>
    function delUser(id){
        console.log(id);
        layer.confirm('是否要删除'+id+'用户？', {
            btn: ['确认', '取消'] //可以无限个按钮
        }, function(index, layero){
            //确定事件
            console.log("删除成功!");
        }, function(index){
            //取消事件
        });
    }

    //全选事件
    $("#seleAll").change(function () {
        var checkList=document.getElementsByName("userSele");
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
        }
    })









    //侧边栏加载样式
    sideOn("用户管理");

</script>





</body>
</html>