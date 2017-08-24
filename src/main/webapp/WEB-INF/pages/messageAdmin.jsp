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
                <li class="active">消息管理</li>
            </ul>
        </div>
        <div class="row mB20">
            <div class="searchTitleQ">
                消息管理
            </div>
            <div class="boxQ">
                <div class="row mT10">
                    <div class="table-responsive">
                        <table class='table table-bordered table-hover table-striped qzq_table'>
                            <thead>
                                <th>选择</th>
                                <th>序号</th>
                                <th>消息内容</th>
                                <th>时间</th>
                                <th>操作</th>
                            </thead>
                            <tbody>
                            <tr>
                                <td><input type="checkbox" name="message"/></td>
                                <td>1</td>
                                <td>设备故障！</td>
                                <td>2017/06/12</td>
                                <td>
                                    <a href="messageDetail.jsp">查看详情</a>
                                    <a onclick="delMessage(1)">删除</a>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="message"/></td>
                                <td>2</td>
                                <td>设备故障！</td>
                                <td>2017/06/23</td>
                                <td>
                                    <a href="messageDetail.jsp">查看详情</a>
                                    <a onclick="delMessage(2)">删除</a>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="message"/></td>
                                <td>3</td>
                                <td>设备故障！</td>
                                <td>2017/07/12</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/gotoMessageDetail.do">查看详情</a>
                                    <a onclick="delMessage(3)">删除</a>
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


<script src="js/jquery-2.2.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/layer/layer.js"></script>
<script src="js/jedate/jedate.js"></script>
<script src="js/common.js"></script>


<script>
    function delMessage(id){
        console.log(id);
        layer.confirm('是否要删除'+id+'消息？', {
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
    sideOn("消息管理");
</script>





</body>
</html>