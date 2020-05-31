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
<%@include file="commons/navigation.jsp"%>

<!--中间内容-->
<div class="m-container m-padded-tb-big">
    <div class="ui container">
        <!--头部-->
        <div class="ui top attached segment">
            <div class="ui horizontal  link list">
                <div class="item">
                    <img src="${pageContext.request.contextPath}/static/images/defaultUserPhoto.jpeg" alt="" class="ui avatar image">
                    <div class="content"><a href="#" class="header">${blog.user}</a></div>
                </div>
                <div class="item">
                    <i class="calendar icon"></i>${blog.blogCreateDate}
                </div>
                <div class="item">
                    <i class="eye icon"></i>${blog.blogViews}
                </div>
            </div>
        </div>
        <!--图片收藏-->
        <div class="ui attached segment">
            <img class="ui rounded image" src="${pageContext.request.contextPath}/uploads/${blog.blogImage}">
        </div>
        <!--内容-->
        <div class="ui attached segment">
            <div class="ui right aligned basic segment">
                <div class="ui orange basic label">原创</div>
            </div>
            <h2 class="ui center aligned header m-text-thin">${blog.blogTitle}</h2>
            <div id="wordsView" class="markdown-body editormd-html-preview" lg-uid="lg0" deep="8" lg-event-uid="">
                <p>${blog.blogContent}</p>
            </div>
            <!--标签-->
            <div class="m-padded-tb">
                <div class="ui basic teal left pointing label ">${blog.sorts}</div>
                <c:forEach items="${blog.label.toString().split(',')}" var="label">
                    <div class="ui basic teal left pointing label ">${label}</div>
                </c:forEach>
                <%--<div class="ui basic teal left pointing label ">分类</div>--%>
                <%--<div class="ui basic teal left pointing label ">标签1</div>--%>
                <%--<div class="ui basic teal left pointing label ">标签2</div>--%>
                <%--<div class="ui basic teal left pointing label ">标签3</div>--%>
            </div>
            <!--赞赏-->
            <div class="ui center aligned basic segment">
                <button id="payButton" class="ui red basic circular button ">赞赏</button>
            </div>
            <div class="ui payQ flowing popup transition hidden">
                <div class="ui teal basic label">
                    <div class="ui images" style="font-size: inherit !important;">
                        <div class="image" style="width: 150px">
                            <img src="${pageContext.request.contextPath}/static/images/aliPay.jpg" alt="" class="ui rounded bordered image" >
                            <div>支付宝</div>
                        </div>
                        <div class="image" style="width: 150px">
                            <img src="${pageContext.request.contextPath}/static/images/weChatPay.jpg" alt="" class="ui rounded bordered image">
                            <div>微信</div>
                        </div>

                    </div>
                </div>
            </div>
            <!--博客信息-->
            <div class="ui attached positive message">
                <div class="ui grid">
                    <div class="eleven wide column">
                        <ui class="list">
                            <li>本文作者：${blog.user} </li>
                            <li>原文链接：https://www.zhyocean.cn/article/1545457296</li>
                            <li> 版权声明： 本博客所有文章除特别声明外，均采用 CC BY 3.0 CN协议进行许可。转载请署名作者且注明文章出处。</li>
                        </ui>
                    </div>
                    <div class="five wide column">
                        <img src="${pageContext.request.contextPath}/static/images/weChat.jpg" alt="" class="ui rounded bordered images" style="width: 120px;">
                    </div>
                </div>
            </div>
            <!--留言区-->
            <div class="ui attached segment">

            </div>
        </div>
    </div>
</div>
<!--底部-->
<%@include file="commons/bottom.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script>
    $('.menu.toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-hide');
    });

    $('#payButton').popup({
        popup:$('.payQ.popup'),
        on: 'click',
        position:'bottom center'
    });
</script>
</body>
</html>
