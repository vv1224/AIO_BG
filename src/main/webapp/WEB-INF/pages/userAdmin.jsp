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
                <a href="${pageContext.request.contextPath}/gotoUserAdd.do" type="button" class="btn btn-success mB20"> <i class="glyphicon glyphicon glyphicon-plus"></i> 新增</a>
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
                            <tbody id="tableBody">
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
            data:{
                "pageIndex":pageIndex,
                "pageSize":pageSize
            },
            url:"${pageContext.request.contextPath}/selectUserList.do",
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
                    html +="<td><input type='checkbox' name='userSele' class='checkQ'/></td>";
                    html +="<td>"+list[i].id+"</td>";
                    html +="<td>"+list[i].name+"</td>";
                    html +="<td>"+list[i].createTime+"</td>";
                    html +="<td>"+list[i].roleId+"</td>";
                    html +="<td><a onclick='userEdit("+list[i].id+")'>编辑</a>&nbsp;&nbsp<a onclick='delUser("+list[i].id+")'>删除</a></td>";
                    html +="</tr>";
                }
                $("#tableBody").html(html);
            }
        }
    }

/**************************************分页完***********************/


/********************************
 * 删除用户事件
 * **************************************/
    function delUser(id){
        console.log(id);
        layer.confirm('是否要删除'+id+'用户？', {
            btn: ['确认', '取消'] //可以无限个按钮
        }, function(index, layero){
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/deleteUserByOne.do?id="+id,
                success:function(data){
                    console.log(data);
                    if(data=="success"){
                        layer.closeAll();
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
    //*******************************表格中的全选事件***********************************/
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


    /**********************************验证*******************************************/
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
    /**********************************************************************************/




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



//***********************编辑事件******************************/
    function userEdit(id){
        $(".qzqModal").fadeToggle();
        console.log("qzq");
        console.log(id);
    }





    //侧边栏加载样式
    sideOn("用户管理");

</script>





</body>
</html>