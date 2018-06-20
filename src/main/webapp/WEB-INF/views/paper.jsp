<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 52460
  Date: 2018/6/18
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Paper</title>
    <link href="static/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="static/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="static/css/style.css?v=1324" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,600,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Ubuntu:400,700,500' rel='stylesheet' type='text/css'>
    <!--flexslider-->
    <link rel="stylesheet" href="static/css/flexslider.css" type="text/css" media="screen" />
    <!--//flexslider-->
    <link rel="stylesheet" href="static/css/lightbox.css">
    <!--JS for animate-->
    <link href="static/css/animate.css" rel="stylesheet" type="text/css" media="all">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!--//end-animate-->
</head>
<body>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--header-->
<div class="header-1">
    <div class="container">
        <!---->
        <div class="header-logo">
            <div class="logo">
                <a href="index.jsp"><img src="static/images/logo.png" alt="" ></a>
            </div>
            <div class="top-nav">
                <span class="icon"><img src="static/images/menu.png" alt=""> </span>
                <ul>
                    <li><a href="index.jsp">首页</a></li>
                    <li><a href="services.html">发现</a></li>
                    <li><a href="projects.html">仓库</a></li>
                    <li><a href="">个人</a> </li>
                    <li><a href="login.jsp">登录</a></li>
                    <li>
                        <form>
                            <button><span class="glyphicon glyphicon-search"></span></button>
                        </form>
                    </li>
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
                <li><a href="index.jsp">首页</a></li>
                <li><a href="services.html">发现</a></li>
                <li><a href="projects.html">仓库</a></li>
                <li><a href="index.jsp"><img src="static/images/logo.png"></a></li>
                <li><a href="quality.html">个人</a> </li>
                <li><a href="login.jsp">登录</a></li>

                <div class="clearfix"></div>
            </ul>
        </div>
    </div>
</div>
<!--//header-->
<!--w3l-->
<div class="main container">
    <div class="paper_dis col-md-9">
        <div  class="checkbox" style="margin-left: 15%;">
            <label>
                <input type="checkbox" checked="checked">查看本人
            </label>
            <label>
                <input type="checkbox" checked="checked">查看购买
            </label>
        </div>
        <%! private  int papernum=0;
        %>
        <c:forEach var="paper" items="${list}">
            <div class="paper" onmouseover="this.style.background='#ffecfc'" onmouseout="this.style.background = '#eeeeee'">
                <div class="paper_title ">
                    ${paper[0].name}
                </div>
                <div class="dropdown col-md-2" style="float:right; margin-right: 5px;">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"
                            style="background-color: inherit; border-width: 0;"
                    >
                        管理
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li><a href="#">转让文献</a></li>
                        <li><a href="#">修改价格</a></li>
                    </ul>
                </div>
                <div class="paper_abstract">
                    <span>${paper[0].abstract1}</span>
                </div>
                <div class="paper_mes">
                    <div class="paper_author col-md-2">
                        <span class="glyphicon glyphicon-user"></span> ${paper[1].username}
                    </div>
                    <div class="paper_time col-md-2">
                             <fmt:formatDate type="date" value="${paper[0].time}" />
                    </div>
                    <div class="paper_right col-md-4 col-md-offset-3">
                        <div class="paper_readnum col-md-6">
                            阅读量 ${paper[0].popularity}
                        </div>
                        <div class="paper_commentnum col-md-6">
                            <span class="glyphicon glyphicon-comment"></span>评论
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="paper_aside sidebar-module col-md-2" style="margin-top: 40px;">
        <h4>用户名</h4>
        <ol class="list-unstyled">
            <li>科林麦克兰莫</li>
        </ol>
        <h4>邮箱</h4>
        <ol class="list-unstyled">
            <li>fuckqq@qq.com</li>
        </ol>
        <h4>手机</h4>
        <ol class="list-unstyled">
            <li>1899999999</li>
        </ol>
        <h4>等级</h4>
        <ol class="list-unstyled">127 </ol>
        <ol class="list-unstyled">距离升级还需要<strong class="text-danger">298</strong>积分</ol>
        <div class="progress" style="width:200px;">
            <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:60%;">
                60%
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="container">
        <div class="col-md-3 latest-proj wow fadeInLeft animated" data-wow-delay=".5s">
            <h3>Gryffindor</h3>
            <img src="static/images/logo.png" class="img-responsive" alt="">
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
<!--//footer-->
</body>
</html>