<%--
  Created by IntelliJ IDEA.
  User: 52460
  Date: 2018/6/4
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link href='http://fonts.useso.com/css?family=Roboto:500,900italic,900,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <!--Google Fonts-->
</head>
<body>
<div class="login">
    <div align="center" style="padding-bottom:75px">
        <img src="static/images/logo.png">
    </div>
    <div class="login-top">
        <h2>登录</h2>
        <form>
            <input type="text" value="用户名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'User Id';}">
            <input type="password" value="密码" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}">
        </form>
        <div class="forgot">
            <a href="#">忘记密码</a>
            <input type="submit" value="登录" >
        </div>
    </div>
    <div class="login-bottom">
        <h3>新用户&nbsp;<a href="register.jsp">注册</a></h3>
    </div>
</div>
<div class="copyright">
    <p>Copyright &copy; 2018.Gryffindor Group.</p>
</div>


</body>
</html>
