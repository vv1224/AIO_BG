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
    <div class="row">
        <div class="col-xs-6">
            <h2 class="fl f18 lineH40 mL20">医院自助服务管理系统</h2>
        </div>

        <div class="col-xs-6">

            <div class="btn-group fr">
                <a  class="dropdown-toggle menuPersonQ lineH40" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="glyphicon glyphicon-user"></i>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu user_menuQ">
                    <li><a href="#">修改密码</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="#">退出登录</a></li>
                </ul>
            </div>
            <p class="lineH40 fr mR10">您好：<span class="headerUserName">Admin</span></p>
        </div>
    </div>
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
                <li class="active">设备监控</li>
            </ul>
        </div>
        <div class="row mB20">
            <div class="searchTitleQ">
                设备监控
            </div>
            <div class="boxQ">
                <div class="row mT10">
                    <div class="table-responsive">
                        <table class='table table-bordered table-hover table-striped qzq_table'>
                            <thead>
                            <th>序号</th>
                            <th>终端编号</th>
                            <th>终端IP</th>
                            <th>终端型号</th>
                            <th>物理位置</th>
                            <th>状态</th>
                            <th>操作</th>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>123456789</td>
                                <td>192.168.0.1</td>
                                <td>XTcB1243</td>
                                <td>门诊大厅</td>
                                <td>正常</td>
                                <td>
                                    <a href="deviceMonitorDetail.jsp">查看详情</a>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>123456789</td>
                                <td>192.168.0.1</td>
                                <td>XTcB1243</td>
                                <td>门诊大厅</td>
                                <td>异常</td>
                                <td>
                                    <a href="deviceMonitorDetail.jsp">查看详情</a>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>123456789</td>
                                <td>192.168.0.1</td>
                                <td>XTcB1243</td>
                                <td>门诊大厅</td>
                                <td>异常</td>
                                <td>
                                    <a href="deviceMonitorDetail.jsp">查看详情</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>



    </div>
</section>
<footer class="">
    <div class="footer">
        <img src="img/195-60.png"/>
        <p class="mT10">&copy;北京华生医叮版权所有 2017 | 京ICP备17034868-2 copyright</p>
    </div>
</footer>


<script src="js/jquery-2.2.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/layer/layer.js"></script>
<script src="js/jedate/jedate.js"></script>
<script src="js/common.js"></script>


<script>

    //侧边栏加载样式
    sideOn("设备监控");
</script>





</body>
</html>