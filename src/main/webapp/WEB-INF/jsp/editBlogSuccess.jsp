<%--
  Created by IntelliJ IDEA.
  User: ssongwang
  Date: 20-5-6
  Time: 上午11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>博文发布成功</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/me.css">

</head>
<body>
<!--导航-->
<%@include file="commons/navigation.jsp"%>

<div class="">
    <p style="margin-left:530px;padding-top:30px;font-size: 13pt;">博文发布成功,点击下方链接跳转首页</p>
</div>
<div class="ui three column stackable grid m-padded-tb-large">
    <p style="margin-left:530px;padding-top:30px;font-size: 13pt;">
        <a href="${pageContext.request.contextPath}/user/index.do">请点击该链接</a>
    </p>
</div>
<!--底部-->
<div style="position: fixed; bottom: 0; width: 100%;">
<%@include file="commons/bottom.jsp"%>
</div>

</body>
</html>
