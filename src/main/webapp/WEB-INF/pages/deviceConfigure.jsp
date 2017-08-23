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
    <link rel="stylesheet" href="css/deviceConfigure.css"/>
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
                <li class="active">终端配置</li>
            </ul>
        </div>
        <!-- 搜索栏 -->
        <div class="row mB20">
            <div class="searchTitleQ">
                终端配置
            </div>
            <div class="boxQ">
                <!--第一部分-->
                <div class="partOne">
                    <p class="titleQ f16 mB30">医院基本信息</p>
                    <div class="form-group row">
                        <label for="" class="col-sm-2 control-label text-right">医院名称：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" maxlength="20"/>
                        </div>
                    </div>
                    <div class="form-group row mT20">
                        <div class="col-xs-6 imgParent">
                            <label for="" class="col-md-4 col-xs-6 control-label text-right">医院LOGO：</label>
                            <input type="file" class="col-md-8 col-xs-6 file1 mB10" placeholder="选择文件" value=""/>
                            <div class="imgBox logoBox">
                                <!--<img src=""/>-->
                            </div>
                        </div>
                        <div class="col-xs-6 imgParent">
                            <label for="" class="col-md-4 col-xs-6 control-label text-right">背景图：</label>
                            <input type="file" class="col-md-8 col-xs-6 file2 mB10" placeholder="选择文件" value=""/>
                            <div class="imgBox">
                                <img src=""/>
                            </div>
                        </div>
                    </div>
                </div>

                <!--第二部分-->
                <div class="partOne mT30">
                    <p class="titleQ f16 mB30">终端参数配置</p>
                    <div class="form-group row mB10 pL30">
                        <label for="" class="col-md-4 col-xs-12 control-label text-left">普通窗体倒计时：</label>
                        <div class="col-md-8 col-xs-12">
                            <input type="number" id="" class="form-control disInlineB w150" maxlength="6"/>&nbsp;秒
                        </div>
                    </div>
                    <div class="form-group row mB10 pL30">
                        <label for="" class="col-md-4 col-xs-12 control-label text-left">纸币收钞窗体倒计时：</label>
                        <div class="col-md-8 col-xs-12">
                            <input type="number" id="" class="form-control disInlineB w150" maxlength="6"/>&nbsp;秒
                        </div>
                    </div>
                    <div class="form-group row mB10 pL30">
                        <label for="" class="col-md-4 col-xs-12 control-label text-left">界面无操作时，出现屏保的间隔时间：</label>
                        <div class="col-md-8 col-xs-12">
                            <input type="number" id="" class="form-control disInlineB w150" maxlength="6"/>&nbsp;秒
                        </div>
                    </div>
                    <div class="form-group row mB10 pL30">
                        <label for="" class="col-md-4 col-xs-12 control-label text-left">个人单张化验单允许的打印次数：</label>
                        <div class="col-md-8 col-xs-12">
                            <input type="number" id="" class="form-control disInlineB w150" maxlength="6"/>&nbsp;次
                        </div>
                    </div>
                    <div class="form-group row mB10 pL30">
                        <label for="" class="col-md-4 col-xs-12 control-label text-left">个人当日住院清单允许的打印次数：</label>
                        <div class="col-md-8 col-xs-12">
                            <input type="number" id="" class="form-control disInlineB w150" maxlength="6"/>&nbsp;次
                        </div>
                    </div>
                    <div class="form-group row mB10 pL30">
                        <label for="" class="col-md-4 col-xs-12 control-label text-left">现金充值允许投入的纸币面额：</label>
                        <div class="col-md-8 col-xs-12">
                            <input type="text" id="" class="form-control disInlineB w150" />&nbsp;注：不同面额之用半角“，”隔开
                        </div>
                    </div>
                    <div class="form-group row mB10 pL30">
                        <label for="" class="col-md-4 col-xs-12 control-label text-left">开机时间：</label>
                        <div class="col-md-8 col-xs-12">
                            <input type="text" id="" class="form-control disInlineB w150" maxlength="6"/>
                        </div>
                    </div>
                    <div class="form-group row mB10 pL30">
                        <label for="" class="col-md-4 col-xs-12 control-label text-left">关机时间：</label>
                        <div class="col-md-8 col-xs-12">
                            <input type="text" id="" class="form-control disInlineB w150" maxlength="6"/>
                        </div>
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
$(".file1").change(function(){
    console.log($(this).val());
    var html="<img src='"+$(this).val()+"' alt='没有图片'/>";
    $(".logoBox").html(html);
});

//侧边栏加载样式
sideOn("终端配置");
</script>





</body>
</html>