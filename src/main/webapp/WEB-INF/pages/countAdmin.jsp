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
                <li class="active">统计管理</li>
            </ul>
        </div>
        <!-- 搜索栏 -->
        <div class="row mB20">
            <div class="searchTitleQ">
                统计管理
            </div>
            <div class="boxQ">
                <div class="col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="qzqInpstart" class="qzq_tab mR10">选择日期:</label>
                        <input class="form-control disInlineB w200" value="" id="qzqInpstart" type="text" placeholder="请选择开始日期" readonly="readonly"/>
                    </div>
                </div>

                <div class="col-sm-6 col-xs-12">
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
                        <tbody id="tableBody">
                        <tr>
                            <td><input type="checkbox" class="checkQ"  name="count"/></td>
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
                            <td><input type="checkbox" class="checkQ" name="count"/></td>
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
                            <td><input type="checkbox" class="checkQ" name="count"/></td>
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
    +function(){
        // 日历
        jeDate({
            dateCell : "#qzqInpstart",//isinitVal:true,
            format : "YYYY-MM-DD",//设置日期格式
            isTime : false, //isClear:false,
            minDate : "2014-09-19 00:00:00",//设置最小时间
        });
    }();

    /* *****************分页****************************** */
    // [请设置请求参数]...
    var pageIndex = "1";
    var pageSize = 5;//每页条数
    var startTime="";//搜索的传的值
    var pageCount;

    // [初始化页面]...
    showall("first");


    $("#search").click(function(){
        startTime=$("#qzqInpstart").val();
        showall("first");
    });

    // [发送请求请配置好参数和请求地址]...
    function sendAjax() {
        //发送ajax
        $.ajax({//后台搜索所有log信息
            type: 'post',
            dataType: 'json',
            data:{
                "pageIndex":pageIndex,
                "pageSize":pageSize,
                "startTime":startTime
            },
            url:"${pageContext.request.contextPath}/select.do",
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

                    /*
                     <tr>
                     <td><input type="checkbox" class="checkQ" name="count"/></td>
                     <td>3</td>
                     <td>2017/7/6</td>
                     <td>12348</td>
                     <td>23484</td>
                     <td>4</td>
                     <td>7</td>
                     <td>23793</td>
                     <td>63312</td>
                     </tr>
                     */

                    html +="<tr>";
                    html +="<td><input type='checkbox' name='count' class='checkQ'/></td>";
                    html +="<td>"+list[i].id+"</td>";
                    html +="<td>"+list[i].date+"</td>";
                    html +="<td>"+list[i].cashTotal+"</td>";
                    html +="<td>"+list[i].unionPay+"</td>";
                    html +="<td>"+list[i].cardTotal+"</td>";
                    html +="<td>"+list[i].registerTotal+"</td>";
                    html +="<td>"+list[i].paymentTotal+"</td>";
                    html +="<td>"+list[i].reportTotal+"</td>";
                    html +="</tr>";
                }
                $("#tableBody").html(html);
            }
        }
    }

    /**************************************分页完***********************/







//全选事件
    $("#seleAll").change(function() {
        var checkList=document.getElementsByName("count");
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
    //表格中的全选事件
    +function(){
        $("#tableBody").on('click','.checkQ',function(){
            var checkArr=$(".checkQ");
            var flag=0;//标记：标记是否全选，如果全选为0，没有全选为1
            for(var i=0;i<checkArr.length;i++){
                console.log(checkArr[i].checked);
                if(!checkArr[i].checked){
                    flag=1;
                }
            }
            //判断标记：是否为全选来控制全选按钮的选择
            if(flag==1){
                $("#seleAll").prop("checked",false);
            }else if(flag==0){
                $("#seleAll").prop("checked",true);
            }
        })
    }();



    //侧边栏加载样式
    sideOn("统计管理");
</script>





</body>
</html>