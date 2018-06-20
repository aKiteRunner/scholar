<%--
  Created by IntelliJ IDEA.
  User: 52460
  Date: 2018/6/4
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //    以斜线开始，不以斜线结束(例如/crud)
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登录/注册</title>
    <!-- Custom Theme files -->
    <link href="static/css/login.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <!--Google Fonts-->
    <!--Google Fonts-->
</head>
<body>
<div class="login">
    <c:if test="${errorInfo != null}">
        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Warning!</strong> ${errorInfo}
        </div>
    </c:if>
    <div align="center" style="padding-bottom:75px">
        <img src="static/images/logo.png">
    </div>
    <div class="login-top">
        <h2>登录</h2>
        <form  method="post" action="${APP_PATH}/login">
            <input type="text" name="userName" value="用户名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'User Id';}">
            <input type="password" name="password" value="密码" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}">

            
        <div class="forgot">
            <a href="#">忘记密码</a>
            <input type="submit" value="登录" >
        </div>
        </form>
    </div>



    <div class="login-bottom">
        <h3>新用户&nbsp;<a href="${APP_PATH}/registerGet">注册</a></h3>
    </div>
</div>
<div class="copyright">
    <p>Copyright &copy; 2018.Gryffindor Group.</p>
</div>


</body>
</html>
