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
        <ul class="nav navQ">
            <li role='presentation' class='textC'>
                <a href="index.jsp"><i class="fa fa-television fa-lg"></i>终端管理</a>
            </li>
            <li role='presentation' class='textC'>
                <a href="deviceConfigure.jsp" class="active"><i class="fa fa-codiepie fa-lg"></i>终端配置</a>
            </li>
            <li role='presentation' class='textC'>
                <a href="deviceMonitor.jsp"><i class="fa fa-cloud fa-lg"></i>设备监控</a>
            </li>
            <li role='presentation' class='textC'>
                <a href="countAdmin.jsp"><i class="fa fa-bar-chart fa-lg"></i>统计管理</a>
            </li>
            <li role='presentation' class='textC'>
                <a href="userAdmin.jsp"><i class="fa fa-user-circle-o fa-lg"></i>用户管理</a>
            </li>
            <li role='presentation' class='textC'>
                <a href="messageAdmin.jsp"><i class="fa fa-twitch fa-lg"></i>消息管理</a>
            </li>
        </ul>
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
                <div class="col-xs-6">
                    <div class="form-group">
                        <label for="patientId" class="qzq_tab mR10">终端编号:</label>
                        <input type="number" class="form-control disInlineB w200" id="patientId" maxlength="10"/>
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
            <a href="deviceAdd.jsp" type="button" class="btn btn-warning mB20"> <i class="glyphicon glyphicon glyphicon-plus"></i> 新增</a>
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
                        <tbody>
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
                            <tr>
                                <td><input type="checkbox" name="device"/></td>
                                <td>2</td>
                                <td>123456789</td>
                                <td>192.168.0.1</td>
                                <td>XTcB1243</td>
                                <td>门诊大厅</td>
                                <td>停用</td>
                                <td>
                                    <a onclick="qzqCloseModal()">查看</a>
                                    <a onclick="qzqCloseEditModal()">编辑</a>
                                    <a onclick="delDevice(2)">删除</a>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="device"/></td>
                                <td>3</td>
                                <td>123456789</td>
                                <td>192.168.0.1</td>
                                <td>XTcB1243</td>
                                <td>门诊大厅</td>
                                <td>停用</td>
                                <td>
                                    <a onclick="qzqCloseModal()">查看</a>
                                    <a onclick="qzqCloseEditModal()">编辑</a>
                                    <a onclick="delDevice(3)">删除</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!--全选按钮-->
                <div class="form-group">
                    <input id="seleAll" type="checkbox"/>
                    <label for="seleAll" class="verticalM">全选</label>
                    <a href="#" class="btn btn-success mL20">批量删除</a>
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

<!--查看模态框-->
<div class="qzqModal">
    <div class="pB10 qzq_ModalForm">
        <span class="qzqCloseModal" onclick="qzqCloseModal()">×</span>
        <h5 class="h5">终端信息：</h5>
        <div class="form-horizontal">
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">终端状态：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" readonly value="启用">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">终端编号：</label>
                <div class="col-sm-6">
                    <input type="number" class="form-control" id="" readonly value="111222">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">终端IP：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" readonly value="192.168.0.1">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">MAC地址：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" readonly value="DADISKijsaidf">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">终端类型：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" readonly value="自主挂号缴费机">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">终端地址：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" readonly value="门诊">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">联系人：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" readonly value="张山">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">联系人电话：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" readonly value="15033333333">
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
                <a href="#" class="btn btn-success w100">确定</a>
                <a href="javascript:;" onclick="qzqCloseModal()" class="btn btn-warning w100">取消</a>
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
                <label for="" class="col-sm-3 control-label">终端状态：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" value="启用">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">终端编号：</label>
                <div class="col-sm-6">
                    <input type="number" class="form-control" id="" value="111222">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">终端IP：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" value="192.168.0.1">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">MAC地址：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" value="DADISKijsaidf">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">终端类型：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" value="自主挂号缴费机">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">终端地址：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" value="门诊">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">联系人：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" value="张山">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-3 control-label">联系人电话：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="" value="15033333333">
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
                <a href="#" class="btn btn-success w100">确定</a>
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


<script>
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

</script>





</body>
</html>