<%--
  Created by IntelliJ IDEA.
  User: ssongwang
  Date: 20-5-7
  Time: 下午4:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        ul li{
            float:left;
            list-style:none;
            margin-left: 20px;

        }
        div input{
            float: left;
            margin-left: 20px;
            width: 70px;
            height: 30px;
        }
    </style>
</head>
<body>
<!--导航-->
<%@include file="commons/navigation.jsp"%>

<%--中部--%>
<div class="m-padded-tb-big">
    <div class="ui container">
        <%--${pageContext.request.contextPath}/user/blog.do--%>
        <form class="ui fluid teal form segment" action="${pageContext.request.contextPath}/user/editBlog.do" method="post" enctype="multipart/form-data">
            <div>
                <div class="required  field">
                    <input type="text" id="blogTitle" name="blogTitle" placeholder="博客标题">
                </div>
            </div>
            <div>
                <div class="required  field">
                    <%--使用ajax从数据库中读取分类--%>
                    <select id="sorts" name="sorts" >

                    </select>
                </div>
            </div>
            <div class="required  field">
                <!--<label class="">博客内容</label>-->
                <div>
                    <textarea id="blogContent" name="blogContent" placeholder="请输入博客内容"></textarea>


                </div>
            </div>
            <div class="required  field">
                <div>
                    <%--后台单独取，name属性值要和后台的blog实体类的图片属性名不一致--%>
                    请选择博文图片：
                    <input type="file" name="pic" id="pic" style="height: 45px;">

                </div>
            </div>
            <div class="required  field">
                <div id="d2">
                    <input type="text" name="label" style="width: 100px;height: 30px;margin-left: 20px; border:rgba(42,37,37,0.39) 3px solid" placeholder="添加标签">
                    <input type="text" name="label" style="width: 100px;height: 30px;margin-left: 20px; border:rgba(42,37,37,0.39) 3px solid" placeholder="添加标签">
                    <input type="text" name="label" style="width: 100px;height: 30px;margin-left: 20px; border:rgba(42,37,37,0.39) 3px solid" placeholder="添加标签">
                </div>
            </div>
            <%--<div class="required inline field">--%>
                <%--<div class="ui checkbox">--%>
                    <%--&lt;%&ndash;<input type="hidden"  name="original_article" value="0">&ndash;%&gt;--%>
                    <%--<input type="checkbox" name="original_article">--%>
                    <%--<!--<input type="checkbox" id="original_article" name="original_article" tabindex="0" class="hidden">-->--%>
                    <%--<label>是否原创？</label>--%>
                <%--</div>--%>
            <%--</div>--%>
            <div class="inline field" style="position: absolute; left: 50%;bottom: 10px;">
                <input class="ui teal submit button" type="submit" value="提交"/>
                <input class="ui teal reset button" type="reset" value="重置"/>
            </div>

        </form>
    </div>
</div>

<!--底部-->
<%@include file="commons/bottom.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script>
    $(function () {
        showSorts();
    });
    function showSorts() {
        $.ajax({
            url:"${pageContext.request.contextPath}/user/indexShow2.do",
            type:"get",
            success:function(sorts) {
                var a ="";
                $.each(sorts,function (i, sort) {
                    a += '<option >'+sort.sortName+'</option>';

                });
                $("#sorts").html(a);
            }
        })
    }
</script>
</body>
</html>
