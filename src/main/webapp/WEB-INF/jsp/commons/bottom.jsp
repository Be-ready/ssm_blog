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

<!--底部-->
<footer class="ui inverted vertical segment m-padded-tb-large">
    <div class="ui center aligned  container">
        <div class="ui inverted divided grid">
            <div class="three wide column">
                <img class="ui rounded image" src="${pageContext.request.contextPath}/static/images/weChat.jpg" alt="" style="width: 100px">
                <div style="margin-left:-80px">
                    <p class="m-text-thin m-text-spaced m-opacity-mini"> 扫码加我微信呀~</p>
                </div>
            </div>
            <div class="three wide column">
                <h4 class="ui inverted header m-opacity-mini">最新博文</h4>
                <div class="ui inverted link list">
                    <a href="#" class="item">用户故事</a>
                    <a href="#" class="item">用户故事</a>
                    <a href="#" class="item">用户故事</a>
                </div>
            </div>
            <div class="three wide column">
                <h4 class="ui inverted header m-opacity-mini">联系我</h4>
                <div class="ui inverted link list">
                    <a href="#" class="item">email：ssogwang@163.com</a>
                    <a href="#" class="item">github：Be-ready</a>
                </div>
            </div>
            <div class="seven wide column">
                <h4 class="ui inverted header m-opacity-mini">个人简介</h4>
                <p class="m-text-thin m-text-spaced m-opacity-mini m-text-small">这是我的个人博客，会在这分享我的心情、编程、思考等内容,希望可以帮助到有需要的人....</p>
            </div>
        </div>
        <div class="ui inverted section divider"></div>
        <p class="m-text-thin m-text-spaced m-opacity-mini">Copyright©2019-2016 myblog Designed by zhouhuan</p>
    </div>
</footer>

</body>
</html>
