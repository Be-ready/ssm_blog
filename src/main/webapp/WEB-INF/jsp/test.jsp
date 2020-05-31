<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: ssongwang
  Date: 20-5-7
  Time: 下午8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script>
        $(function () {
            getSorts();
        });
        function getSorts() {
            $.ajax({
                url:"${pageContext.request.contextPath}/user/indexShow2.do",
                type:"get",
                success:function(sorts) {
                    var href ="";
                    // alert(sorts);
                    $.each(sorts,function (i, sort) {
                        // alert(sort.sortName);
                        href += "<li>姓名："+sort.sortName+"</li>";

                    });
                    $("#d1").html(href);
                }
            })
        }
        
        
    </script>
</head>
<body>
<p>这是测试页面</p>
<p>2222</p>
<ul id="d1"></ul>

<hr>
<form action="${pageContext.request.contextPath}/user/test2.do">

    <input type="text" name="label" style="width: 100px;height: 30px;margin-left: 20px; border:rgba(42,37,37,0.39) 3px solid" placeholder="添加标签">
    <input type="text" name="label" style="width: 100px;height: 30px;margin-left: 20px; border:rgba(42,37,37,0.39) 3px solid" placeholder="添加标签">
    <input type="text" name="label" style="width: 100px;height: 30px;margin-left: 20px; border:rgba(42,37,37,0.39) 3px solid" placeholder="添加标签">
    <<input type="submit" name="" id="" value="提交">
</form>

<hr>
<p>${sessionScope.pageNum}</p>
</body>
</html>
