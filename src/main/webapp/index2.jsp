<%--
  Created by IntelliJ IDEA.
  User: ssongwang
  Date: 20-5-5
  Time: 下午11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/me.css">
</head>
<body>

<!--导航-->
<%@include file="WEB-INF/jsp/commons/navigation.jsp"%>

<!--中间内容-->
<div class="m-padded-tb-big">
    <div class="ui container">
        <div class="ui  grid">
            <div class="eleven wide column">
                <!--正文头部-->
                <div class="ui top attached secondary segment">
                    <div class="ui three column grid">
                        <div class="column">
                            <a href="#" class="ui teal header">最新的</a>
                            <a href="#" class="ui teal header ">最热的</a>
                        </div>
                        <div class="column">

                        </div>
                        <div class="right aligned column">
                            共<h3 class="ui orange header m-inline-block m-text-thin">${sessionScope.get("blogCounts")}</h3>篇
                        </div>
                    </div>
                </div>

                <!--正文中间-->
                <div class="ui attached segment" id="blogShow">
                    <%--博客首页展示内容--%>
                </div>

                <!--页码-->
                <div class="ui bottom attached segment m-padded-tb-large">
                    <div class="ui middle aligned two column grid">
                        <div class="colum">
                            <%--判断当前页是否是第一页--%>
                            <c:if test="${sessionScope.pageTag > 1}">
                                <a id="pagePre" onclick="pagePreAndNext(0)" class="ui mini teal basic button">上一页</a>
                                <c:set var="pageTag" value="${sessionScope.pageTag+1}" scope="session" />
                            </c:if>
                        </div>
                        <div class="right aligned colum">
                                        <%--判断当前页码是否等于总页数--%>
                            <c:if test="${sessionScope.pageTag < sessionScope.pageNum}">
                                <a id="pageNext" onclick="pagePreAndNext(1)" class="ui mini teal basic button">下一页</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>

            <!--右边头部-->
            <div class="five wide column">
                <div class="ui segments">
                    <div class="ui secondary segment">
                        <div class="ui two column grid">
                            <div class="column">
                                <i class="idea icon"></i>分类
                            </div>
                            <div class="right aligned column">
                                <a href="#">more <i class="angle double right icon"></i></a>
                            </div>
                        </div>
                    </div>
                    <%--分类内容，由ajax动态获取--%>
                    <div class="ui teal segment">
                        <div class="ui fluid vertical menu" id="sort">
                            <%--<a href="" class="item">--%>
                                <%--分类--%>
                                <%--<div class="ui teal basic left pointing label">13</div>--%>
                            <%--</a>--%>
                        </div>
                    </div>

                </div>

                <div class="five wide column">
                    <div class="ui segments">
                        <div class="ui secondary segment">
                            <div class="ui two column grid">
                                <div class="column">
                                    <i class="tag icon"></i>标签
                                </div>
                                <div class="right aligned column">
                                    <a href="#">more <i class="angle double right icon"></i></a>
                                </div>
                            </div>
                        </div>
                        <%--标签内容--%>
                        <div class="ui teal segment" id="label">
                        </div>
                    </div>
                    <div class="five wide column">
                        <div class="ui segments">
                            <div class="ui secondary segment">
                                <div class="ui two column grid">
                                    <div class="column">
                                        <i class="bookmark icon"></i>最新推荐
                                    </div>
                                    <div class="right aligned column">
                                        <a href="#">more <i class="angle double right icon"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="ui teal segment">
                                <a href="" target="_blank" class="text-black">
                                    你的朋友圈有多少人了解？
                                </a>
                            </div>
                            <div class="ui segment">
                                <a href="" target="_blank" class="text-black">
                                    如何安装和配置Tomcat8？
                                </a>
                            </div>
                            <div class="ui segment">
                                <a href="" target="_blank" class="text-black">
                                    JavaScript
                                </a>
                            </div>
                            <div class="ui segment">
                                <a href="" target="_blank" class="text-black">
                                    学习日志
                                </a>
                            </div>
                            <div class="ui segment">
                                <a href="" target="_blank" class="text-black">
                                    创业故事
                                </a>
                            </div>
                            <div class="ui segment">
                                <a href="" target="_blank" class="text-black">
                                    认知升级
                                </a>
                            </div>
                        </div>
                        <!--二维码-->
                        <h4 class="ui horizontal divider header">扫码关注我</h4>
                        <div class="ui centered card"  style="width: 150px">
                            <img class="ui rounded image" src="${pageContext.request.contextPath}/static/images/weChat.jpg" alt="">
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>

<!--底部-->
<%@include file="WEB-INF/jsp/commons/bottom.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script>
    $('.menu.toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-hide');
    });
    $(function () {
        showSorts();  // 首页自动刷新sort内容
        showLabels(); // 首页自动刷新label内容
        var id = '<%=request.getSession().getAttribute("pageTag")%>';  // 获取session中的属性
        showBlogs(id);  // 首页自动刷新blog内容
    });

    function pagePreAndNext(tag){
        alert("传入参数tag:"+tag);
        var id = '<%=request.getSession().getAttribute("pageTag")%>';  // 获取session中的属性
        alert("当前pageTag:"+id);
        if(tag=1){
            // 下一页
            var id2 = '<%=request.setAttribute("pageTag", (int)request.getSession().getAttribute("pageTag")+1)%>';
            alert("下一页pageTag:"+id2);
            <%--var id3 = '<%=request.getSession().getAttribute("pageTag")%>';  // 获取session中的属性--%>
            // alert("id3:"+id3);

            showBlogs(Number(id)+1);
            alert(typeof(Number(id)))
        }else {
            showBlogs()
        }

    }
    function showBlogs(id) {
        <%--var id = '<%=request.getSession().getAttribute("pageTag")%>';  // 获取session中的属性--%>
        // alert(value);
        $.ajax({
            url:"${pageContext.request.contextPath}/user/indexShowBlog.do?id="+id,
            type:"get",
            success:function(blogs) {
                var a ="";
                $.each(blogs,function (i, blog) {
                    // alert(blog);
                    // blog.blogContent.split("。")[0]+"..."
                    // alert(blog.blogContent.split("。")[0])
                    a += '<div class="ui padded vertical segment"><div class="ui mobile reversed stackable grid"><div class="eleven wide column">' +
                        '<a href="${pageContext.request.contextPath}/user/toBlog.do?blogId='+blog.blogId+'" target="_blank" class="m-margin-tb-mini"><h3 class="ui header" id="blogTitle">'+
                        blog.blogTitle+'</h3></a><p>'+blog.blogContent.substring(0,100)+'...</p><div class="ui stackable grid"><div class="eleven wide column"><div class="ui horizontal  link list"><div class="item">'+
                        '<img src="${pageContext.request.contextPath}/static/images/defaultUserPhoto.jpeg" alt="" class="ui avatar image"><div class="content"><a href="#" class="header">'
                        +blog.user+'</a></div></div><div class="item"><i class="calendar icon"></i>'+blog.blogCreateDate+
                        '</div><div class="item"><i class="eye icon"></i>'+blog.blogViews+'</div></div></div><div class="right aligned five wide column">\n' +
                        '<a href="#" target="_blank" class="ui teal basic label m-padded-mini m-text-thin">'+blog.sorts+'</a></div>\n' +
                        '</div></div><div class="five wide column"><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/uploads/'+blog.blogImage+'" class="ui rounded image">\n' +
                        '</a></div></div></div>'

                });
                $("#blogShow").html(a);
            }
        })
    }
    function showSorts() {
        $.ajax({
            url:"${pageContext.request.contextPath}/user/indexShow2.do",
            type:"get",
            success:function(sorts) {
                var a ="";
                $.each(sorts,function (i, sort) {
                    a += '<a href="" class="item">'+sort.sortName+'<div class="ui teal basic left pointing label">'+13
                        +'</div></a>';

                });
                $("#sort").html(a);
            }
        })
    }
    function showLabels() {
        $.ajax({
            url:"${pageContext.request.contextPath}/user/indexShowLabel.do",
            type:"get",
            success:function(labels) {
                var a ="";
                var _href="#";
                $.each(labels,function (i, label) {
                    a += '<a href="'+_href+'" target="_blank" class="ui teal basic left pointing label m-margin-tb-tiny">'
                      +label.labelName+'<div class="detail">'+23+'</div></a>';

                });
                $("#label").html(a);
            }
        })
    }
    
</script>
</body>
</html>
