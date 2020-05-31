<%--
  Created by IntelliJ IDEA.
  User: ssongwang
  Date: 20-5-6
  Time: 上午8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
    <title>注册</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/me.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/ionicons/2.0.1/css/ionicons.min.css">
</head>
<body>
<!--导航-->
<%@include file="commons/navigation.jsp"%>

<div class="">
    <p style="margin-left:530px;padding-top:30px;font-size: 13pt;">请填写注册信息</p>
</div>
<div class="ui three column stackable grid m-padded-tb-large">
    <div class="column"></div>
    <div class="column">
        <form class="ui fluid teal form segment" action="${pageContext.request.contextPath}/user/register.do" method="post" enctype="multipart/form-data">
            <div class="required  field">
                <label class="">用户昵称</label>
                <div class="ui left icon input">
                    <input type="text" name="userNickname" placeholder="">
                    <i class="user icon"></i>
                </div>
            </div>
            <div class="required  field">
                <label class="">用户名</label>
                <div class="ui left icon input">
                    <input type="text" name="userName" placeholder="">
                    <i class="icon ion-person"></i>

                </div>
            </div>
            <div class="required  field">
                <label class="">密码</label>
                <div class="ui left icon input">
                    <input type="text" name="userPassword" placeholder="">
                    <i class="icon ion-locked"></i>

                </div>
            </div>
            <div class="required  field">
                <label class="">用户头像</label>
                <div class="ui left icon input">
                    <input type="file" name="userPhoto" placeholder="">
                    <i class="icon ion-image"></i>

                </div>
            </div>
            <div class="required  field">
                <label class="">用户生日</label>
                <div class="ui left icon input">
                    <input type="date" name="userBirthday" placeholder="yyyy-MM-dd">
                    <i class="icon ion-calendar"></i>

                </div>
            </div>
            <div class="required  field">
                <label class="">电话号码</label>
                <div class="ui left icon input">
                    <input type="text" name="userTelephoneNumber" placeholder="">
                    <i class="phone icon"></i>
                </div>
            </div>
            <div class="required  field">
                <label class="">电子邮箱</label>
                <div class="ui left icon input">
                    <input type="text" name="userEmail" placeholder="">
                    <i class="icon ion-email"></i>
                </div>
            </div>
            <div class="required inline field">
                <div class="ui checkbox">
                    <a href="">myblog的相关条款以及条件。</a>
                </div>
            </div>
            <div class="inline field">
                <input class="ui teal submit button" type="submit" value="注册"/>
                <input class="ui teal reset button" type="reset" value="重置"/>
            </div>
        </form>
    </div>
    <div class="column"></div>
</div>

<!--底部-->
<%@include file="commons/bottom.jsp"%>

</body>
</html>
