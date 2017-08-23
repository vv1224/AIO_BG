<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>hello</title>
    <a href="${pageContext.request.contextPath}/gotoIndex.do">点我</a>
    <a href="${pageContext.request.contextPath}/selectMonitorInfo.do?pageIndex=1">terminal</a>
</head>
<body>

<script>



</script>

</body>
</html>
