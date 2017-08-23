//关闭模态框的事件
function qzqCloseModal(){
    $(".qzqModal").fadeToggle();
}
function qzqCloseEditModal() {
    $(".qzqModalEdit").fadeToggle();
}

//侧边栏
+function(){
    var asideData={
        "result": "success",
        "list": [
            {
                "name": "终端管理",
                "url": "index.jsp",
                "child": []
            },
            {
                "name": "终端配置",
                "url": "deviceConfigure.jsp",
                "child": []
            },
            {
                "name": "设备监控",
                "url": "deviceMonitor.jsp",
                "child": []
            },
            {
                "name": "统计管理",
                "url": "countAdmin.jsp",
                "child": []
            },
            {
                "name": "用户管理",
                "url": "userAdmin.jsp",
                "child": []
            },
            {
                "name": "消息管理",
                "url": "messageAdmin.jsp",
                "child": []
            }
        ]
    }
    $("#aside").append("<ul class='nav navQ' id='asideUL'></ul>");
    for(var i=0;i<asideData.list.length;i++) {
        //console.log(asideData.list[i]);
        if (asideData.list[i].name == "终端管理") {
            html = "<i class='fa fa-television fa-lg'></i>终端管理"
        } else if (asideData.list[i].name == "终端配置") {
            html = "<i class='fa fa-codiepie fa-lg'></i>终端配置"
        } else if (asideData.list[i].name == "设备监控") {
            html = "<i class='fa fa-cloud fa-lg'></i>设备监控"
        } else if (asideData.list[i].name == "统计管理") {
            html = "<i class='fa fa-bar-chart fa-lg'></i>统计管理"
        } else if (asideData.list[i].name == "用户管理") {
            html = "<i class='fa fa-user-circle-o fa-lg'></i>用户管理"
        } else if (asideData.list[i].name == "消息管理") {
            html = "<i class='fa fa-twitch fa-lg'></i>消息管理"
        }
        $("#asideUL").append("<li role='presentation' class='textC'><a class='' href='" + asideData.list[i].url + "'>" + html + "</a></li>");
    }
}();

//侧边栏加样式
function sideOn(text){
    var arrList=$("#aside").find("a");
    //console.log(arrList);
    var len=arrList.length;
    for(var i=0;i<len;i++){
        if(arrList[i].text==text){
            arrList.eq(i).addClass("active");
            return
        }
    }
}









/////////////////////////验证////////////////////////////////////////////
//姓名的正则(只可包含中文英文2~8位)
function uNameReg(uN) {
    reg = /^([A-Za-z]|[\u4E00-\u9FA5]){2,8}$/;
    if (!reg.test(uN)) {
        return true;//格式不正确
    } else {
        return false;//格式正确
    }
}


//IP地址验证
function IPReg(ip){
    reg=/^(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)$/;
    if(!reg.test(ip)){
        return true;
    }else{
        return false;
    }
}
//终端编号验证
function IDReg(id){
    reg=/^[0-9A-Za-z]{10}$/;
    if(!reg.test(id)){
        return true;
    }else{
        return false;
    }
}





