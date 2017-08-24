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
    <link rel="stylesheet" href="css/page.css"/>
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
                <li class="active">交易日志</li>
            </ul>
        </div>
        <!-- 搜索栏 -->
        <div class="row mB20">
            <div class="searchTitleQ">
                交易日志
            </div>
            <div class="boxQ">
                <div class="col-xs-6">
                    <div class="form-group">
                        <label for="cardId" class="qzq_tab mR10">就诊卡号:</label>
                        <input type="number" class="form-control disInlineB w200" id="cardId" maxlength="10"/>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="form-group">
                        <label for="transactionWay" class="qzq_tab mR10">交易方式:</label>
                        <select name="transactionWay" id="transactionWay" class="form-control disInlineB w200">
                            <option value="0">现金支付</option>
                            <option value="1">支付宝支付</option>
                            <option value="2">微信支付</option>
                            <option value="3">银行卡支付</option>
                        </select>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group"  style="display: inline-block">
                        <label for="qzqInpstart" class="qzq_tab mR10">选择日期:</label>
                        <input class="form-control disInlineB w200" value="" id="qzqInpstart" type="text" placeholder="请选择开始日期" readonly="readonly"/>
                    </div>
                    <div class="form-group" style="display: inline-block">
                        <label for="qzqInpend" class="qzq_tab mR10">至</label>
                        <input class="form-control disInlineB w200" value="" id="qzqInpend" type="text" placeholder="请选择结束日期" readonly="readonly"/>
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
            <!-- 查询列表-->
            <div class="row mT10">
                <div class="table-responsive">
                    <table class='table table-bordered table-hover table-striped qzq_table'>
                        <thead>
                            <th>选择</th>
                            <th>序号</th>
                            <th>交易号</th>
                            <th>就诊卡号</th>
                            <th>住院号</th>
                            <th>终端编号</th>
                            <th>交易方式</th>
                            <th>交易业务</th>
                            <th>交易金额</th>
                            <th>交易时间</th>
                            <th>交易状态</th>
                            <th>错误信息</th>
                        </thead>
                        <tbody id="tableBody">
                            <tr>
                                <td><input type="checkbox" name="transaction" class="checkQ"/></td>
                                <td>1</td>
                                <td>123456789</td>
                                <td>8888888</td>
                                <td>XTcB1243</td>
                                <td>现金</td>
                                <td>住院</td>
                                <td>1298.0</td>
                                <td>2007-08-08</td>
                                <td>完成</td>
                                <td>-</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!--全选按钮-->
                <div class="form-group">
                    <input id="seleAll" type="checkbox"/>
                    <label for="seleAll" class="verticalM">全选</label>
                    <a href="#" class="btn btn-warning mL20"><i class="fa  fa-share-square-o  fa-lg"></i>导出报表</a>
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
    /**搜索框*/
    +function(){
        var sDate,eDate;
        // 日历
        jeDate({
            dateCell : "#qzqInpstart",//isinitVal:true,
            format : "YYYY-MM-DD",//设置日期格式
            isTime : false, //isClear:false,
            minDate : "2014-09-19 00:00:00",//设置最小时间
            choosefun: function(val){
                sDate=val;
                if(eDate!=undefined && sDate>eDate){
                    layer.msg("时间范围有误，请重新选择！",{icon: 2});
                    $("#qzqInpstart").val("");
                    sDate=0;
                    $("#qzqInpstart").focus();
                }
            },
            clearfun:function(val) {
                sDate=0;
            }
        });
        jeDate({
            dateCell : "#qzqInpend",//isinitVal:true,
            format : "YYYY-MM-DD",//设置日期格式
            isTime : false, //isClear:false,
            minDate : "2014-09-19 00:00:00",//设置最小时间
            choosefun: function(val){
                eDate=val;
                console.log(val);
                if(sDate>eDate){
                    layer.msg("时间范围有误，请重新选择！",{icon: 2});
                    $("#qzqInpend").val("");
                    eDate=undefined;
                    $("#qzqInpend").focus();
                }
            },
            clearfun:function(val) {
                eDate=undefined;
            }
        });
    }();




    /* *****************分页****************************** */
    // [请设置请求参数]...
    var pageIndex = "1";
    var pageSize = 5;//每页条数
    var patientCard="";//就诊卡号
    var payType="";//交易类型
    var startTime="";
    var endTime="";
    var pageCount;

    $("#search").click(function(){
        patientCard=$("#cardId").val();
        payType=$("#transactionWay option:selected").val();
        startTime=$("#qzqInpstart").val();
        endTime=$("#qzqInpend").val();
        showall("first");
    })

    // [初始化页面]...
    showall("first");


    // [发送请求请配置好参数和请求地址]...
    function sendAjax() {
        //发送ajax
        $.ajax({//后台搜索所有log信息
            type: 'post',
            dataType: 'json',
            data:{
                "pageIndex":pageIndex,
                "pageSize":pageSize,
                "patientCard":patientCard,
                "payType":payType,
                "startTime":startTime,
                "endTime":endTime
            },
            url:"${pageContext.request.contextPath}/selectTradingLogList.do",
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
            $("#tableBody").append("<tr><td colspan='12'>抱歉，暂无数据！</td></tr>");
        } else if (message == "success") {
            //console.log(list);
            if (list == null || list.length <= 0) {
                $("#tableBody").append("<tr><td colspan='12'>抱歉，暂无数据！</td></tr>");
                return false;
            }
            if (list != null && list.length > 0) {
                var html="";
                for (var i = 0; i < list.length; i++) {
                    console.log(list[i]);
                    // 操作
                    html +="<tr>";
                    html +="<td><input type='checkbox' name='transaction' class='checkQ'/></td>";
                    html +="<td>"+list[i].id+"</td>";
                    html +="<td>"+list[i].transactionId+"</td>";
                    html +="<td>"+list[i].patientCard+"</td>";
                    html +="<td>"+list[i].beInHospitalNum+"</td>";
                    html +="<td>"+list[i].uuid+"</td>";
                    html +="<td>"+list[i].payType+"</td>";
                    html +="<td>"+list[i].trading+"</td>";
                    html +="<td>"+list[i].tradingMoney+"</td>";
                    html +="<td>"+list[i].tradingTime+"</td>";
                    html +="<td>"+list[i].tradingStatus+"</td>";
                    html +="<td>"+list[i].errorInfo+"</td>";
                    html +="</tr>";
                }
                $("#tableBody").html(html);
            }
        }
    }

    /**************************************分页完***********************/


    /********************查看详情******************/
    function deviceDetail(uuid){
        $(".qzqModal").fadeToggle();
        $.ajax({
            type: 'post',
            dataType: 'json',
            data:{
                "uuid":uuid
            },
            url:"${pageContext.request.contextPath}/selectMonitorDetail.do",
            success:function(data){
                console.log(data);
            },
            error:function(){
                console.log("abd");
            }
        })
    }


    /************************查看详情完***************************/


    /****------------------编辑设备-------------------------**/
    function deviceEdit(id){
        $(".qzqModalEdit").fadeToggle();
        cosnole.log(id);
    }


    /**********************************************************/
    function delDevice(id){
        console.log(id);
        layer.confirm('是否要删除'+id+'设备？', {
            btn: ['确认', '取消'] //可以无限个按钮
        }, function(index, layero){
            //确定事件
            console.log("删除成功!");
        }, function(index){
            //取消事件
        });
    }

    //全选事件
    //表格中的
    $("#seleAll").change(function () {
        var checkList=document.getElementsByName("transaction");
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
    });



    //编辑模态框中的
    $("#seleAllEdit").change(function () {
        var checkList=document.getElementsByName("deviceEdit");
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




    //编辑框中的验证
    //编号
    $("#deviceIdEdit").blur(function(){
        if($("#deviceIdEdit").val()==""){
            $(".deviceIdEditReg").html("设备编号不允许为空!");
            $('.deviceIdEditReg').css("display","inline-block");
        }else if(IDReg($("#deviceIdEdit").val())){
            $(".deviceIdEditReg").html("10位英文和数字组合!");
            $('.deviceIdEditReg').css("display","inline-block");
        }else{
            $('.deviceIdEditReg').css("display","none");
        }
    })

    //IP地址
    $("#deviceIpEdit").blur(function(){
        if($("#deviceIpEdit").val()==""){
            $(".deviceIpEditReg").html("请填写IP地址");
            $(".deviceIpEditReg").css("display","inline-block");
        }else if(IPReg($("#deviceIpEdit").val())){
            $(".deviceIpEditReg").html("IP地址格式有误!");
            $(".deviceIpEditReg").css("display","inline-block");
        }else{
            $(".deviceIpEditReg").css("display","none");
        }
    });

    //MAC地址的验证
    $("#deviceMACEdit").blur(function(){
        if($("#deviceMACEdit").val()==""){
            $(".deviceMACEditReg").html("请填写MAC地址！");
            $(".deviceMACEditReg").css("display","inline-block");
        }else{
            $(".deviceMACEditReg").css("display","none");
        }
    });
    //终端地址的验证
    $("#deviceAddrEdit").blur(function(){
        if($("#deviceAddrEdit").val()==""){
            $(".deviceAddrEditReg").html("请填写终端地址！");
            $(".deviceAddrEditReg").css("display","inline-block");
        }else{
            $(".deviceAddrEditReg").css("display","none");
        }
    });
    //联系人验证
    $("#personNameEdit").blur(function(){
        if($("#personNameEdit").val()==""){
            $(".personNameEditReg").html("请填写联系人姓名！");
            $(".personNameEditReg").css("display","inline-block");
        }else{
            $(".personNameEditReg").css("display","none");
        }
    });
    //联系人电话
    $("#personTelEdit").blur(function(){
        if($("#personTelEdit").val()==""){
            $(".personTelEditReg").html("请填写联系人电话！");
            $(".personTelEditReg").css("display","inline-block");
        }else{
            $(".personTelEditReg").css("display","none");
        }
    });

    /************编辑中确认按钮的事件**********/
    $("#submitEdit").click(function(){
        if($("#deviceIdEdit").val()==""||$("#deviceIpEdit").val()==""||$("#deviceMACEdit").val()==""||$("#deviceTypeEdit").val()==""||$("#deviceAddrEdit").val()==""||$("#personNameEdit").val()==""||$("#personTelEdit").val()==""){
            layer.msg("请将内容填写完整！",{icon: 7});
        }else if($(".deviceIdEditReg").css("display")=="inline-block"||$(".deviceIpEditReg").css("display")=="inline-block"||$(".deviceMACEditReg").css("display")=="inline-block"||$(".deviceTypeEditReg").css("display")=="inline-block"||$(".deviceAddrEditReg").css("display")=="inline-block"||$(".personNameEditReg").css("display")=="inline-block"||$(".personTelEditReg").css("display")=="inline-block"){
            layer.msg("请正确填写内容！",{icon: 2});
        }else{
            layer.msg("添加成功！",{icon: 1});
        }
    })



//侧边栏加样式
    sideOn("交易日志");






</script>





</body>
</html>