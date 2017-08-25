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
                <li class="active">终端管理</li>
            </ul>
        </div>
        <!-- 搜索栏 -->
        <div class="row mB20">
            <div class="searchTitleQ">
                终端管理
            </div>
            <div class="boxQ">
                <div class="col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="patientId" class="qzq_tab mR10">终端编号:</label>
                        <input type="number" class="form-control disInlineB w200" id="patientId" maxlength="10"/>
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
            <a href="${pageContext.request.contextPath}/gotoDeviceAdd.do" type="button" class="btn btn-success mB20"> <i class="glyphicon glyphicon glyphicon-plus"></i> 新增</a>
            <!-- 查询列表-->
            <div class="row mT10">
                <div class="table-responsive">
                    <table class='table table-bordered table-hover table-striped qzq_table'>
                        <thead>
                            <th>选择</th>
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
                                <td><input type="checkbox" name="device"/></td>
                                <td>1</td>
                                <td>123456789</td>
                                <td>192.168.0.1</td>
                                <td>XTcB1243</td>
                                <td>门诊大厅</td>
                                <td>停用</td>
                                <td>
                                    <a onclick="qzqCloseModal()">查看</a>
                                    <a onclick="qzqCloseEditModal()">编辑</a>
                                    <a onclick="delDevice(1)">删除</a>
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

<!--查看模态框-->
<div class="qzqModal">
    <div class="pB10 qzq_ModalForm">
        <span class="qzqCloseModal" onclick="qzqCloseModal()">×</span>
        <h5 class="h5">终端信息：</h5>
        <div class="form-horizontal">
            <div class="form-group">
                <label for="deviceState" class="col-sm-3 control-label">终端状态：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="deviceState" readonly value="启用">
                </div>
            </div>
            <div class="form-group">
                <label for="deviceId" class="col-sm-3 control-label">终端编号：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="deviceId" readonly value="111222">
                </div>
            </div>
            <div class="form-group">
                <label for="deviceIp" class="col-sm-3 control-label">终端IP：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="deviceIp" readonly value="192.168.0.1">
                </div>
            </div>
            <div class="form-group">
                <label for="deviceMAC" class="col-sm-3 control-label">MAC地址：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="deviceMAC" readonly value="DADISKijsaidf">
                </div>
            </div>
            <div class="form-group">
                <label for="deviceType" class="col-sm-3 control-label">终端类型：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="deviceType" readonly value="自主挂号缴费机">
                </div>
            </div>
            <div class="form-group">
                <label for="deviceAddr" class="col-sm-3 control-label">终端地址：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="deviceAddr" readonly value="门诊">
                </div>
            </div>
            <div class="form-group">
                <label for="personName" class="col-sm-3 control-label">联系人：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="personName" readonly value="张山">
                </div>
            </div>
            <div class="form-group">
                <label for="personTel" class="col-sm-3 control-label">联系人电话：</label>
                <div class="col-sm-6">
                    <input type="tel" class="form-control" id="personTel" readonly value="15033333333">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">终端功能：</label>
                <div class="col-sm-6 borderL">
                    <div class="row-sm-12">
                        <div class="col-sm-6">
                            <input type="checkbox" id="createCard"/>
                            <label for="createCard">建卡</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="checkbox" id="cashAdd"/>
                            <label for="cashAdd">现金充值</label>
                        </div>
                    </div>

                    <div class="row-sm-12">
                        <div class="col-sm-6">
                            <input type="checkbox" id="backAdd"/>
                            <label for="backAdd">银联充值</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="checkbox" id="todayRegister"/>
                            <label for="todayRegister">当日挂号</label>
                        </div>
                    </div>

                    <div class="row-sm-12">
                        <div class="col-sm-6">
                            <input type="checkbox" id="appointmentRegister"/>
                            <label for="appointmentRegister">预约挂号</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="checkbox" id="appointmentGetNum"/>
                            <label for="appointmentGetNum">预约取号</label>
                        </div>
                    </div>

                    <div class="row-sm-12">
                        <div class="col-sm-6">
                            <input type="checkbox" id="printReport"/>
                            <label for="printReport">打印报告</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="checkbox" id="checkSurplusMoney"/>
                            <label for="checkSurplusMoney">查询余额</label>
                        </div>
                    </div>

                    <div class="row-sm-12">
                        <div class="col-sm-6">
                            <input type="checkbox" id="getMoney"/>
                            <label for="getMoney">缴费</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="checkbox" id="selectAll"/>
                            <label for="selectAll">全选</label>
                        </div>
                    </div>

                </div>
            </div>
            <div class="form-group textC">
                <a href="javascript:;" onclick="qzqCloseModal()"  class="btn btn-success w100">确定</a>
            </div>

        </div>
    </div>
</div>
<!--编辑模态框-->
<div class="qzqModalEdit">
    <div class="pB10 qzq_ModalForm">
        <span class="qzqCloseModal" onclick="qzqCloseEditModal()">×</span>
        <h5 class="h5">终端信息：</h5>
        <div class="form-horizontal">
            <div class="form-group">
                <label for="deviceStateEdit" class="col-sm-3 control-label">终端状态：</label>
                <div class="col-sm-9">
                    <select class="form-control w250 disInlineB" id="deviceStateEdit">
                        <option value="1">启用</option>
                        <option value="2">停用</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="deviceIdEdit" class="col-sm-3 control-label">终端编号：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control w250 disInlineB" id="deviceIdEdit" maxlength="10" value="111222" readonly>
                    <span class="regQ deviceIdEditReg"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="deviceIpEdit" class="col-sm-3 control-label">终端IP：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control w250 disInlineB" id="deviceIpEdit" value="192.168.0.1">
                    <span class="regQ deviceIpEditReg"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="deviceMACEdit" class="col-sm-3 control-label">MAC地址：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control w250 disInlineB" id="deviceMACEdit" value="DADISKijsaidf">
                    <span class="regQ deviceMACEditReg"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="deviceTypeEdit" class="col-sm-3 control-label">终端类型：</label>
                <div class="col-sm-9">
                    <select class="form-control w250 disInlineB" id="deviceTypeEdit">
                        <option value="1">自助挂号缴费机</option>
                        <option value="2">自助打印机</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="deviceAddrEdit" class="col-sm-3 control-label">终端地址：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control w250 disInlineB" id="deviceAddrEdit" value="门诊">
                    <span class="regQ deviceAddrEditReg"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="personNameEdit" class="col-sm-3 control-label">联系人：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control w250 disInlineB" id="personNameEdit" value="张山">
                    <span class="regQ personNameEditReg"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="personTelEdit" class="col-sm-3 control-label">联系人电话：</label>
                <div class="col-sm-9">
                    <input type="tel" class="form-control w250 disInlineB" id="personTelEdit" value="15033333333">
                    <span class="regQ personTelEditReg"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">终端功能：</label>
                <div class="col-sm-6 borderL">
                    <div class="row-sm-12">
                        <div class="col-sm-6">
                            <input type="checkbox" id="createCardEdit" name="deviceEdit"/>
                            <label for="createCardEdit">建卡</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="checkbox" id="cashAddEdit" name="deviceEdit"/>
                            <label for="cashAddEdit">现金充值</label>
                        </div>
                    </div>

                    <div class="row-sm-12">
                        <div class="col-sm-6">
                            <input type="checkbox" id="backAddEdit" name="deviceEdit"/>
                            <label for="backAddEdit">银联充值</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="checkbox" id="todayRegisterEdit" name="deviceEdit"/>
                            <label for="todayRegisterEdit">当日挂号</label>
                        </div>
                    </div>

                    <div class="row-sm-12">
                        <div class="col-sm-6">
                            <input type="checkbox" id="appointmentRegisterEdit" name="deviceEdit"/>
                            <label for="appointmentRegisterEdit">预约挂号</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="checkbox" id="appointmentGetNumEdit" name="deviceEdit"/>
                            <label for="appointmentGetNumEdit">预约取号</label>
                        </div>
                    </div>

                    <div class="row-sm-12">
                        <div class="col-sm-6">
                            <input type="checkbox" id="printReportEdit" name="deviceEdit"/>
                            <label for="printReportEdit">打印报告</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="checkbox" id="checkSurplusMoneyEdit" name="deviceEdit"/>
                            <label for="checkSurplusMoneyEdit">查询余额</label>
                        </div>
                    </div>

                    <div class="row-sm-12">
                        <div class="col-sm-6">
                            <input type="checkbox" id="getMoneyEdit" name="deviceEdit"/>
                            <label for="getMoneyEdit">缴费</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="checkbox" id="seleAllEdit"/>
                            <label for="seleAllEdit">全选</label>
                        </div>
                    </div>

                </div>
            </div>
            <div class="form-group textC">
                <a id="submitEdit" class="btn btn-success w100">确定</a>
                <a href="javascript:;" onclick="qzqCloseEditModal()" class="btn btn-warning w100">取消</a>
            </div>

        </div>
    </div>
</div>

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
    var uuid="";//搜索的传的值
    var pageCount;

    // [初始化页面]...
    showall("first");


    $("#search").click(function(){
        uuid=$("#patientId").val();
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
                "uuid":uuid
            },
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

//                <tr>
//                    <td><input type="checkbox" name="device"/></td>
//                        <td>3</td>
//                        <td>123456789</td>
//                        <td>192.168.0.1</td>
//                    <td>XTcB1243</td>
//                    <td>门诊大厅</td>
//                    <td>停用</td>
//                    <td>
//                    <a onclick="qzqCloseModal()">查看</a>
//                        <a onclick="qzqCloseEditModal()">编辑</a>
//                        <a onclick="delDevice(3)">删除</a>
//                    </td>
//                    </tr>


                    html +="<tr>";
                    html +="<td><input type='checkbox' name='device' class='checkQ'/></td>";
                    html +="<td>"+list[i].id+"</td>";
                    html +="<td>"+list[i].uuid+"</td>";
                    html +="<td>"+list[i].ip+"</td>";
                    html +="<td>"+list[i].terminalModel+"</td>";
                    html +="<td>"+list[i].position+"</td>";
                    html +="<td>"+list[i].status+"</td>";
                    html +="<td><a onclick='deviceDetail("+list[i].uuid+")'>查看</a>&nbsp;&nbsp;<a onclick='deviceEdit("+list[i].uuid+")'>编辑</a>&nbsp;&nbsp<a onclick='delDevice("+list[i].uuid+")'>删除</a></td>";
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
                data=data[0];
                if(data.status=="1"){
                    $("#deviceState").val("启用");
                }else if(data.status=="2"){
                    $("#deviceState").val("停用");
                }
                $("#deviceId").val(data.uuid);
                $("#deviceIp").val(data.ip);
                $("#deviceMAC").val("AjafasoifierISJ2154");
                $("#deviceType").val(0);
                $("#deviceAddr").val("大厅");
                $("#personName").val("张三");
                $("#personTel").val("1503655555");
            },
            error:function(){
                layer.msg("数据请求失败！",{icon: 2});
            }
        })
    }


    /************************查看详情完***************************/


    /****------------------编辑设备-------------------------**/
    /**验证在下面*/
    /**请求页面数据*/
    function deviceEdit(uuId){
        $(".qzqModalEdit").fadeToggle();
        console.log(uuId);
        $.ajax({
            type: 'post',
            dataType: 'json',
            data:{
                "uuid":uuId
            },
            url:"${pageContext.request.contextPath}/selectMonitorDetail.do",
            success:function(data){
                console.log(data);
                if(data!=""){
                    data=data[0];
                    if(data.status=="1"){
                        $("#deviceStateEdit").val(1);
                    }else if(data.status=="2"){
                        $("#deviceState").val(2);
                    }
                    $("#deviceIdEdit").val(data.uuid);
                    $("#deviceIpEdit").val(data.ip);
                    $("#deviceMACEdit").val("AjafasoifierISJ2154");
                    $("#deviceTypeEdit").val(0);
                    $("#deviceAddrEdit").val("大厅");
                    $("#personNameEdit").val("张三");
                    $("#personTelEdit").val("1503655555");
                    /************编辑中确认按钮的事件**********/
                    $("#submitEdit").click(function(){
                        submitEdit(uuId);
                    })
                }
            },
            error:function(){
                layer.msg("数据请求失败！",{icon: 1});
            }
        });
    }
    /**编辑模态框中的确认按钮事件**/
    function submitEdit(uuId){
        if($("#deviceIdEdit").val()==""||$("#deviceIpEdit").val()==""||$("#deviceMACEdit").val()==""||$("#deviceTypeEdit").val()==""||$("#deviceAddrEdit").val()==""||$("#personNameEdit").val()==""||$("#personTelEdit").val()==""){
            layer.msg("请将内容填写完整！",{icon: 7});
        }else if($(".deviceIdEditReg").css("display")=="inline-block"||$(".deviceIpEditReg").css("display")=="inline-block"||$(".deviceMACEditReg").css("display")=="inline-block"||$(".deviceTypeEditReg").css("display")=="inline-block"||$(".deviceAddrEditReg").css("display")=="inline-block"||$(".personNameEditReg").css("display")=="inline-block"||$(".personTelEditReg").css("display")=="inline-block"){
            layer.msg("请正确填写内容！",{icon: 2});
        }else{
            //layer.msg("添加成功！",{icon: 1});
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/updateTerminal.do",
                data:{
                    "uuid":uuId,
                    "ip":$("#deviceIpEdit").val(),
                    "terminalModel":$("#deviceTypeEdit option:selected").val(),
                    "position":$("#deviceAddrEdit").val()
                },
                dataType:"json",
                success:function(data){
                    console.log(data);
                    if(data=="success"){
                        layer.msg("数据修改成功！",{icon: 1});
                        setTimeout(function(){
                            window.location.reload();
                        },2000);
                    }
                },
                error:function(){
                    layer.msg("数据修改失败！",{icon: 2});
                }
            })
        }

    }


    /**********************************************************/
    function delDevice(id){
        console.log(id);
        layer.confirm('是否要删除'+id+'设备？', {
            btn: ['确认', '取消'] //可以无限个按钮
        }, function(index, layero){
            //确定事件
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/deleteTerminal.do",
                data:{
                    uuid:id,
                },
                success:function(data){
                    console.log(data);
                    if(data=="success"){
                        layer.close(index);
                        window.location.reload();
                    }
                },
                error:function(){
                    layer.msg("删除失败！",{icon: 2});
                }
            })
            console.log("删除成功!");
        }, function(index){
            //取消事件
        });
    }

    //全选事件
    //表格中的
    $("#seleAll").change(function () {
        var checkList=document.getElementsByName("device");
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





//侧边栏加样式
    sideOn("终端管理");






</script>





</body>
</html>