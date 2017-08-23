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
                <li class="active">统计管理</li>
            </ul>
        </div>
        <!-- 搜索栏 -->
        <div class="row mB20">
            <div class="searchTitleQ">
                统计管理
            </div>
            <div class="boxQ">
                <div class="col-xs-6">
                    <div class="form-group">
                        <label for="qzqInpstart" class="qzq_tab mR10">选择日期:</label>
                        <input class="form-control disInlineB w200" value="" id="qzqInpstart" type="text" placeholder="请选择开始日期" readonly="readonly"/>
                    </div>
                </div>

                <div class="col-xs-6">
                    <!-- 查询重置按钮 -->
                    <a id="search" type="button" class="btn btn-success"> <i class="glyphicon glyphicon-search"></i> 查询</a>
                    <a class="btn btn-warning mL10" href="javascript:window.location.reload();"> <i class="glyphicon glyphicon-refresh"></i>重置</a>
                </div>

            </div>
        </div>
        <!--搜索栏完-->
        <div class="boxQ row">
            <div class="row mT10">
                <div class="table-responsive">
                    <table class='table table-bordered table-hover table-striped qzq_table'>
                        <thead>
                            <th>选择</th>
                            <th>序号</th>
                            <th>日期</th>
                            <th>现金总额</th>
                            <th>银联总额</th>
                            <th>办卡总额</th>
                            <th>挂号总数</th>
                            <th>缴费总额</th>
                            <th>打印报告总数</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox" name="message"/></td>
                                <td>1</td>
                                <td>2017/7/4</td>
                                <td>12222</td>
                                <td>10000</td>
                                <td>5</td>
                                <td>6</td>
                                <td>63099</td>
                                <td>63212</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="message"/></td>
                                <td>2</td>
                                <td>2017/7/5</td>
                                <td>12332</td>
                                <td>10300</td>
                                <td>5</td>
                                <td>6</td>
                                <td>66799</td>
                                <td>63902</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="message"/></td>
                                <td>3</td>
                                <td>2017/7/6</td>
                                <td>12348</td>
                                <td>23484</td>
                                <td>4</td>
                                <td>7</td>
                                <td>23793</td>
                                <td>63312</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!--全选按钮-->
                <div class="form-group">
                    <input id="seleAll" type="checkbox"/>
                    <label for="seleAll" class="verticalM">全选</label>
                    <a href="#" class="btn btn-success mL20"><i class="fa fa-cloud-download fa-lg"></i>导出报表</a>
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
+function(){
    // 日历
    jeDate({
        dateCell : "#qzqInpstart",//isinitVal:true,
        format : "YYYY-MM-DD",//设置日期格式
        isTime : false, //isClear:false,
        minDate : "2014-09-19 00:00:00",//设置最小时间
    });
}();

//全选事件
$("#seleAll").change(function () {
    var checkList=document.getElementsByName("message");
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

//侧边栏加载样式
sideOn("统计管理");
</script>





</body>
</html>