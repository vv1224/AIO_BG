// 数组筛选 去除多余部分

function checkNumber(number,all,arr) {
    (number > all) ? number = number - 5 : number;
    (number <= 0) ? number = number + 5 : number;
    if (number <= all) {
        arr.push(number);

    }
}

//排序条件
function sortNumber(a,b)
{
    return a - b
}


// 编译数字转 html str
//编译数字转 html str
function getStr(arr,pagaNumber){
    var str="";
    var len=arr.length||0;
    if(len==0){
        return
    }
    for(var i=0;i<len;i++){
        if(arr[i]==(pagaNumber-0)){
            str+="<li id='currentPage' class='active'>"+pagaNumber+"</li>";
        }else{
            str+="<li  class='otherPage' onclick=showall('otherPage',event) style='margin: 0'>"+arr[i]+"</li>";
        }
    }
    return str;
}
function createPageBtn(number,all){
    var arr=[];
    checkNumber(number-2,all,arr);
    checkNumber(number-1,all,arr);
    checkNumber(number,all,arr);
    checkNumber(number+1,all,arr);
    checkNumber(number+2,all,arr);
    arr.sort(sortNumber);
    return arr
}


/**
 * 首页
 */
$("#firstPage").eq(0).click(function () {
    pageIndex = 1;
    showall("first");
});


/**
 * 末页
 */
$("#lastPage").click(function () {
    showall("last")
});

/**
 *上一页
 */
$("#upPage").click(function () {
    pageIndex = $("#currentPage").html();
    if (pageIndex == 1) {
        return;
    }
    showall("upPage");
});

/**
 * 下一页
 */
$("#nextPage").click(function () {
    pageIndex = $("#currentPage").html();
    if (pageIndex == pageCount) {
        return;
    }
    showall("nextPage");
});

/**
 * 直接选择跳转的页
 */
$("#goToPage").click(function () {
    var pageNum = $("#wherePage").val();
    if (pageNum > pageCount || pageNum <= 0) {
        alert('请输入正确的页码');
        return;
    }
    showall("toPage");
});

//搜索功能
//检索按钮
// $("#search").eq(0).on("click",function () {
//     phone = $("#phone").eq(0).val();
//     showall("first");
// });


function formatDate(now)   {
    now =new Date(now);
    var year=now.getFullYear();
    var month=now.getMonth()+1;
    var date=now.getDate();
    var hour=now.getHours();
    var minute=now.getMinutes();
    var second=now.getSeconds();
    return   year+"-"+month+"-"+date+"   "+hour+":"+minute+":"+second;
    // return year+"-"+month+"-"+date;
}

// var   d=new   Date(1491840000000);
//alert(formatDate(1491840000000),"time");

//页面回显
function showall(type,event){
    // var endFlag = 0;
    if (type == "first") {
        pageIndex = 1;
    } else if (type == "last") {
        pageIndex = pageCount;
        //      endFlag = 1;
    } else if (type == "upPage") {
        pageIndex--;
    } else if (type == "nextPage") {
        pageIndex++;
    } else if (type == "toPage") {
        pageIndex = $("#wherePage").val();
    } else if(type == "otherPage"){
    	
      //  event = event? event: window.event;
    	
     //   text = event.srcElement.innerText ? event.srcElement.innerText:event.target.innerText;
    	if(event.srcElement){
    		text=event.srcElement.innerText;
    	}else{
    		 text= event.target.innerText;
    	}
       
       
        pageIndex=text;
    }else {
        pageIndex = $("#currentPage").html();
        if (pageIndex == 0) {
            pageIndex = 1;
        }
    }

    sendAjax();
}