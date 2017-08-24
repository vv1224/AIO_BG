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
                <li><a href="${pageContext.request.contextPath}/gotoDeviceMonitor.do">设备监控</a></li>
                <li class="active">设备详情</li>
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
                                <th>设备名</th>
                                <th>状态</th>
                                <th>出错时间</th>
                                <th>出错信息</th>
                            </thead>
                            <tbody id="tableBody">
                                <tr>
                                    <td>1</td>
                                    <td>123456789</td>
                                    <td>192.168.0.1</td>
                                    <td>身份证读卡器</td>
                                    <td>正常</td>
                                    <td>-</td>
                                    <td>-</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>123456789</td>
                                    <td>192.168.0.1</td>
                                    <td>密码键盘</td>
                                    <td>异常</td>
                                    <td>2017/6/23 11:22:08</td>
                                    <td>串口打开失败</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>123456789</td>
                                    <td>192.168.0.1</td>
                                    <td>凭条打印</td>
                                    <td>异常</td>
                                    <td>2017/6/23 11:22:08</td>
                                    <td>缺纸</td>
                                </tr>
                            </tbody>
                        </table>
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
            type:"get",
            url:"${pageContext.request.contextPath}/selectMonitorDetail.do?uuid="+uuid,
            dataType:'json',
            success:function(data){
                var html="";
                console.log(data);
                for(var i=0;i<data.length;i++){
                    html +="<tr>";
                    html +="<td>"+(i+1)+"</td>";
                    html +="<td>"+data[i].uuid+"</td>";
                    html +="<td>"+data[i].ip+"</td>";
                    html +="<td>"+data[i].equipmentName+"</td>";
                    html +="<td>"+data[i].status+"</td>";
                    if(data[i].errorTime==null){data[i].errorTime="-"}
                    html +="<td>"+data[i].errorTime+"</td>";
                    if(data[i].errorInfo==null){data[i].errorInfo="-"}
                    html +="<td>"+data[i].errorInfo+"</td>";
                    html +="</tr>";
                }
                $("#tableBody").html(html);
            },
            error:function(){
                layer.msg("数据请求失败！",{icon: 2});
            }

        })
    }();

    //侧边栏加载样式
    sideOn("设备监控");
</script>





</body>
</html>