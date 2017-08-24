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
                            <tbody id="tableBody">
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
                            </tbody>
                        </table>
                    </div>
                </div>


                <!--new分页-->
                <div id="qzq_fy" id="pagination-sv">
                    <ul class="pagination">
                        <li id="firstPage" class="qzq_firstPage">首页</li>
                        <li id="upPage">上一页</li>
                        <li id="currentPage" class="active">1</li>
                        <li id="nextPage">下一页 </li>
                        <li id="lastPage">尾页</li>
                        <li id="allPageNumber" class="qzq_totalPage sjm_widthPage">共1页</li>
                        <li id="inputPart" class="qzq_fy_search">
                            <input type="tel" id="wherePage" min="1" class="form-control qzq_input">
                            <button class="gobtn btn qzq_gobtn" id="goToPage">跳转</button>
                        </li>
                    </ul>
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
<script src="js/page/page.js"></script>

<script>
    /* *****************分页****************************** */
    // [请设置请求参数]...
    var pageIndex = "1";
    var pageSize = 5;//每页条数
    var pageCount;

    // [初始化页面]...
    showall("first");


    // [发送请求请配置好参数和请求地址]...
    function sendAjax() {
        //发送ajax
        $.ajax({//后台搜索所有log信息
            type: 'post',
            dataType: 'json',
//            data:{
//                "pageIndex":pageIndex,
//                "pageSize":pageSize
//            },
            data:"&pageIndex="+pageIndex +"&pageSize="+pageSize,
            url:"${pageContext.request.contextPath}/selectMonitorInfo.do",
            success: show,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                //var actionName = "/user/selectRegisterUser.do";
                //excepinfoShow(XMLHttpRequest, textStatus, errorThrown,actionName);
                console.log("数据库连接失败!");
            }
        });//end ajax

    }

    // [请处理响应数据]...
    function show(json) {
        $("#tableBody").html("");
        $(".otherPage").remove();
        $("#currentPage").remove();
        console.log(json);
        var pageUtil = json.pageUtil;
        pageUtil = pageUtil[0];
        var list = pageUtil.resultList;
        var message = json.message;
        pageCount = pageUtil.pageCount;
        pageIndex = pageUtil.pageIndex;
        pageSize=pageUtil.pageSize;
        $(getStr(createPageBtn(pageIndex, pageCount), pageIndex)).insertAfter($("#upPage"));
        $("#allPageNumber").html("共" + pageCount + "页");
        $("#currentPage").html("").append(pageIndex);
        if (message == "nodata") {
            $("#tableBody").append("<tr><td colspan='8'>抱歉，暂无数据！</td></tr>");
        } else if (message == "success") {
            //console.log(list);
            if (list == null || list.length <= 0) {
                $("#tableBody").append("<tr><td colspan='8'>抱歉，暂无数据！</td></tr>");
                return false;
            }
            if (list != null && list.length > 0) {
                var html="";
                for (var i = 0; i < list.length; i++) {
                    console.log(list[i]);
                    // 操作
                     html +="<tr>";
                     html +="<td>"+list[i].id+"</td>";
                     html +="<td>"+list[i].uuid+"</td>";
                     html +="<td>"+list[i].ip+"</td>";
                     html +="<td>"+list[i].terminalModel+"</td>";
                     html +="<td>"+list[i].position+"</td>";
                     html +="<td>"+list[i].status+"</td>";
                     html +="<td><a href='${pageContext.request.contextPath}/gotoDeviceMonitorDetail.do?uuid="+list[i].uuid+"'>查看详情</td>";
                     html +="</tr>";
                }
                $("#tableBody").html(html);
            }
        }
    }



//侧边栏加载样式
    sideOn("设备监控");
</script>





</body>
</html>