<%--
  Created by IntelliJ IDEA.
  User: marco sun
  Date: 2017/12/7
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
    //    以斜线开始，不以斜线结束(例如/crud)
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
fuck you
<head>
    <%--不以斜杠开始的相对路径，找资源，以当前资源路径为标准，容易出问题。--%>
    <%--以/开始的相对路径，找资源，以服务器的路径为标准(http://127.0.0.1:80),需要加入项目名--%>
        <title>员工列表</title>
        <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <script src="//cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
        <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
<body>
<div class="container">

    <div class="row">
        <form  class="form col-md-12 center-block" method="post" action="${APP_PATH}/login">
            <div class="row">
            <textarea style="margin: 0px; width: 630px; height: 410px;" name="text" id="text">
            </textarea>
            </div>
            <div class="row">
                <button id="submit">提交</button>
            </div>
        </form>
    </div>


</div>

</body>

</body>
</html>
