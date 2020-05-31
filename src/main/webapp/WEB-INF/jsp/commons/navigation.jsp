<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>博客内容</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/me.css">
</head>
<body>

<!--导航-->
<nav class="ui inverted attached segment m-padded-tb-mini">
    <div class="ui container ">
        <div class="ui inverted stackable menu ">
            <c:choose>
                <c:when test="${sessionScope.loginUser !=null}">
                    <h2 class="ui teal header item">
                        ${sessionScope.loginUser}
                    </h2>&nbsp;&nbsp;&nbsp;
                </c:when>
                <c:otherwise>
                    <h2 class="ui teal header item">
                        MyBlog
                    </h2>&nbsp;&nbsp;&nbsp;
                </c:otherwise>
            </c:choose>
            <%--<c:if test="${sessionScope.loginUser==null}">--%>
                <%--<h2 class="ui teal header item">--%>
                    <%--MyBlog--%>
                <%--</h2>&nbsp;&nbsp;&nbsp;--%>
            <%--</c:if>--%>
            <a href="${pageContext.request.contextPath}/user/index.do" class="m-item item m-mobile-hide" ><i class="mini home icon"></i>首页</a>&nbsp;&nbsp;&nbsp;
            <a href="#" class="m-item item m-mobile-hide" ><i class="mini idea icon"></i>分类</a>&nbsp;&nbsp;&nbsp;
            <a href="#" class="m-item item m-mobile-hide" ><i class="mini tags icon"></i>标签</a>&nbsp;&nbsp;&nbsp;
            <c:if test="${sessionScope.loginUser != null}">
                <a href="#" class="m-item item m-mobile-hide" ><i class="mini clone icon"></i>归档</a>&nbsp;&nbsp;&nbsp;
                <a href="#" class="m-item item m-mobile-hide" ><i class="mini info icon"></i>个人中心</a>&nbsp;&nbsp;&nbsp;
            </c:if>
            <div class="m-item right item m-mobile-hide">
                <i class="pencil alternate icon"></i><a href="${pageContext.request.contextPath}/user/toEditBlog.do" class="" >写博客</a>&nbsp;&nbsp;&nbsp;
                <c:choose>
                    <c:when test="${sessionScope.loginUser ==null}">
                        <button class="ui teal button" style="margin-left:50px;" onclick="window.location.href='${pageContext.request.contextPath}/user/toLogin.do'">登陆</button> &nbsp;&nbsp;&nbsp;
                        <button class="ui teal button" onclick="window.location.href='${pageContext.request.contextPath}/user/toRegister.do'">注册</button>
                        <!--<div class="ui icon input focus">
                        <input type="text" placeholder="搜索..." style="border-radius: 10px">
                        <i class="search link icon"></i>
                        </div>-->
                    </c:when>
                    <c:otherwise>
                        <button class="ui teal button" style="margin-left:50px;" onclick="window.location.href='${pageContext.request.contextPath}/user/logout.do'">注销</button> &nbsp;&nbsp;&nbsp;
                    </c:otherwise>
                </c:choose>

            </div>

        </div>
    </div>
    <div class="ui menu toggle black icon button m-right-top m-mobile-show">
        <i class="sidebar icon"></i>
    </div>
</nav>

</body>
</html>
