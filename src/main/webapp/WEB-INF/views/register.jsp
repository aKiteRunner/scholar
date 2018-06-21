<%--
  Created by IntelliJ IDEA.
  User: 52460
  Date: 2018/6/4
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Register</title>
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
<!--header-->
<div class="modal" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="infoModalTitle"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="information"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>


<c:if test="${errorInfo != null }">

    <script>alert("注册失败")</script>

</c:if>


<!--//header-->
<form class="flatbox" method="post" action="register">
    <div class="gslogen mb-4"><em>Gryffindor</em></div>
    <h1 class="h3 mb-3 font-weight-normal">注册</h1>
    <label class="sr-only" for="inputun" >用户名</label>
    <input class="form-control"  id="inputun" autofocus="autofocus" required="required" type="text" placeholder="用户名"  name="userName" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '用户名';}"/>
    <p></p>
    <label class="sr-only" for="inputPassword" name="password1">密码</label>
    <input class="form-control" name="password1" id="inputPassword" required="required" type="password" placeholder="密码" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '密码';}"/>
    <p></p>
    <input class="form-control" name="password2" id="reinputPassword" required="required" type="password" placeholder="重复密码" onfocus="this.value = '';" onkeyup="confirmpw()" />
    <p></p>
    <label class="sr-only" for="inputem">电子邮箱</label>
    <input class="form-control" name="email" id="inputem" required="required" type="email" placeholder="电子邮箱" onfocus="this.value='';" />
    <p></p>
    <label class="sr-only" for="inputpn">手机号</label>
    <input class="form-control" name="phone" id="inputpn" required="required" type="text" placeholder="手机号" onfocus="this.value='';"/>
    <button class="btn btn-lg btn-primary btn-block mt-4 mb-2" type="submit">注册</button>
</form>
<script>
    function confirmpw() {
        var pw1 = document.getElementById("pw1").value;
        var pw2 = document.getElementById("pw2").value;
        if(pw1 == pw2) {
            document.getElementById("message").innerHTML="<span class=' glyphicon glyphicon-ok' ></span>";
            document.getElementById("submit").disabled = false;
        }
        else {
            document.getElementById("message").innerHTML="<span class='glyphicon glyphicon-remove'></span>";
            document.getElementById("submit").disabled = true;
        }
    }

    function infomation(error, info) {
        $('#infoModal').modal('show');
        if (error) {
            document.getElementById('infoModalTitle').innerText = '警告';
        } else {
            document.getElementById('infoModalTitle').innerText = '提示';
        }
        document.getElementById('information').innerText = info;
    }


</script>


</body>

</html>
