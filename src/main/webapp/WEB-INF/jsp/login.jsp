<%--
  Created by IntelliJ IDEA.
  User: ssongwang
  Date: 20-5-6
  Time: 上午8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/me.css">
</head>
<body>
<!--导航-->
<%@include file="commons/navigation.jsp"%>
<div class="">
    <p style="margin-left:530px;padding-top:30px;font-size: 13pt;">请填写登录信息</p>
    <p style="margin-left:530px;font-size: 13pt;color: #FF0A13;">${msg}</p>
</div>
<div class="ui three column stackable grid m-padded-tb-large">
    <div class="column"></div>
    <div class="column">
        <form class="ui fluid teal form segment" method="post" action="${pageContext.request.contextPath}/user/login.do">
            <div class=" field">
                <label class="">用户名</label>
                <div class="ui left icon input">
                    <input type="text" name="username" placeholder="">
                    <i class="user icon"></i>

                </div>
            </div>
            <div class=" field">
                <label class="">密码</label>
                <div class="ui left icon input">
                    <input type="password" name="password" placeholder="">
                    <i class="lock icon"></i>
                </div>
            </div>
            <div class="inline field">
                <div class="ui checkbox checked">
                    <input type="checkbox" tabindex="0" name="checked">
                    <label>记住密码</label>
                </div>
                <a href="">忘记密码？</a>
            </div>
            <div class="inline field">
                <input class="ui teal submit button" type="submit" value="登陆" />
                <input class="ui teal reset button" type="reset" value="重置"/>
            </div>
        </form>
    </div>
    <div class="column"></div>
</div>

<!--底部-->
<%@include file="commons/bottom.jsp"%></body>
</html>
