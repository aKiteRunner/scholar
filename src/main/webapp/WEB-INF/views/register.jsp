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
<head>
    <title>注册</title>
    <link href="/static/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/static/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="/static/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,600,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Ubuntu:400,700,500' rel='stylesheet' type='text/css'>
    <!--flexslider-->
    <link rel="stylesheet" href="/static/css/flexslider.css" type="text/css" media="screen" />
    <!--//flexslider-->
    <link rel="stylesheet" href="/static/css/lightbox.css">
    <!--JS for animate-->
    <link href="/css/animate.css" rel="stylesheet" type="text/css" media="all">
    <script src="/static/js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!--//end-animate-->
</head>
<body>
<!--header-->
<div class="header-1">
    <div class="container">
        <!---->
        <div class="header-logo">
            <div class="logo">
                <a href="old_index.jsp"><img src="/static/images/logo.png" alt="" ></a>
            </div>
            <div class="top-nav">
                <span class="icon"><img src="/static/images/menu.png" alt=""> </span>
                <ul>
                    <li><a href="old_index.jsp">首页</a></li>
                    <li><a href="services.html">发现</a></li>
                    <li><a href="projects.html">仓库</a></li>
                    <li><a href="typo.html">帮助</a> </li>
                    <li><a href="quality.html">个人</a> </li>
                    <li><a href="login.jsp">登录</a></li>
                </ul>
                <!--script-->
                <script>
                    $("span.icon").click(function(){
                        $(".top-nav ul").slideToggle(500, function(){
                        });
                    });
                </script>
            </div>
            <div class="clearfix"> </div>
        </div>
        <!---->
        <div class="top-menu wow fadeInLeft animated" data-wow-delay=".5s">

            <ul>
                <li><a href="old_index.jsp">首页</a></li>
                <li><a href="services.html">发现</a></li>
                <li><a href="projects.html">仓库</a></li>
                <li><a href="old_index.jsp"><img src="/static/images/logo.png"></a></li>
                <li><a href="typo.html">帮助</a> </li>
                <li><a href="quality.html">个人</a> </li>
                <li><a href="login.jsp">登录</a></li>
                <div class="clearfix"></div>
            </ul>
        </div>
    </div>
</div>
<!--//header-->
<!--w3l-->
<div class="register">
    <c:if test="${errorInfo != null}">
        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Warning!</strong> ${errorInfo}
        </div>
    </c:if>
    <div class="register-top">
        <h2>注册</h2>
        <form action="register" method="post">
            <input type="text" value="用户名" name="userName" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'User Id';}">
            <input type="password" id="pw1" name="password1" value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}">
            <input type="password" id="pw2" name="password2" value="password" onfocus="this.value = '';" onkeyup="confirmpw()" ><span id="message"></span>
            <input type="text" value="email.com" name="email" onfocus="this.value='';" >
            <input type="text" value="0123-456789" name="phone" onfocus="this.value='';">
            <input type="submit" value="注册">
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
        </script>
    </div>
</div>
<div class="footer">
    <div class="container">
        <div class="col-md-3 latest-proj wow fadeInLeft animated" data-wow-delay=".5s">
            <h3>Gryffindor</h3>
            <img src="/static/images/logo.png" class="img-responsive" alt="">
            <div class="clearfix"></div>
        </div>
        <div class="col-md-3 location wow fadeInRight animated" data-wow-delay=".5s">
            <h3>科技专家资源共享</h3>
            <address>
                我们提供最全面的，最权威的论文下载,在这里你可以享受知识分享的乐趣           </address>
            <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
            <p class="mai">欢迎加入我们</p>
        </div>
        <div class="col-md-3 location wow fadeInRight animated" data-wow-delay=".5s">
            <h3>所在</h3>
            <address>
                北京航空航天大学<br>
                软件学院<br>
                <abbr title="Phone">电话：</abbr> 0123456789
            </address>
            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
            <p class="mai">Email : <a class="email-link" href="mailto:info@example.com">xxxxxxxx.com</a></p>
        </div>
        <div class="col-md-3 cont wow fadeInRight animated" data-wow-delay=".5s">
            <h3>联系我们</h3>

            <h4><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>电话</h4>
            <p>+1-234-567-8900</p>
            <div class="copy-rights">
                <ul>
                    <li><a href="#"><span class="fa"> </span></a></li>
                    <li><a href="#"><span class="tw"> </span></a></li>
                    <li><a href="#"><span class="g"> </span></a></li>
                </ul>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="foot-bt animated wow fadeInUp animated animated" data-wow-duration="1200ms" data-wow-delay="500ms">
        <p>Copyright &copy; 2018.Gryffindor Group.</p>
    </div>
</div>

</body>

</html>
