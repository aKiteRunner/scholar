
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    //    以斜线开始，不以斜线结束(例如/crud)
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<style>
    *, ::after, ::before {
        box-sizing: border-box;
    }
    html {
        height: 100%;
    }
    body {
        text-align: center !important;
        height: 100%;
        display:flex;
        padding-top: 40px;
        padding-bottom: 40px;
        background: url("/static/images/img4.jpg") no-repeat center;
        background-size: cover;
    }
    .flatbox {
        width: 100%;
        max-width: 350px;
        background-color: white;
        padding-left: 20px;
        padding-right: 20px;
        padding-top: 40px;
        padding-bottom: 40px;
        margin: auto;
        box-shadow: 4px 4px 6px #aaaaaa;
    }
    .gslogen {
        font-family: Consolas;
        font-size: 2rem;
        font-weight: bold;
    }
    .lbot {
        background-color: #eeeeee;
        height: 50px;
        line-height: 50px;
    }
</style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>

    <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>

    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
<c:if test="${errorInfo != null }">

<script>alert("登陆失败")</script>

</c:if>
<form class="flatbox"  method="post" action="/login">
    <div class="gslogen mb-4"><em>Gryffindor</em></div>
    <h1 class="h3 mb-3 font-weight-normal">登录</h1>
    <label class="sr-only" for="inputun">用户名</label>
    <input class="form-control" name="userName" id="inputun" autofocus="autofocus" required="required" type="text" placeholder="用户名" />
    <label class="sr-only" for="inputPassword">密码</label>
    <input class="form-control" name="password" id="inputPassword" required="required" type="password" placeholder="密码" />
    <button class="btn btn-lg btn-primary btn-block mt-4 mb-2" type="submit">登录</button>
    <a href="#">忘记密码</a>
    <div class="lbot mb-2 mt-2">新用户？<a href="/registerGet">注册</a></div>
</form>
</body>
</html>