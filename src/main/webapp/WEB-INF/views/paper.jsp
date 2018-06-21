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
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>

    <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>

    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="/static/css/style.css?v=1425" rel="stylesheet" type="text/css" media="all" />
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
    <link href="/static/css/animate.css" rel="stylesheet" type="text/css" media="all">
    <script src="/static/js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!--//end-animate-->
</head>
<body >
<!--header-->
<div class="header-1">
    <div class="container">
        <!---->
        <div class="header-logo">
            <div class="logo">
                <a href="index.jsp"><img src="/static/images/logo.png" alt="" ></a>
            </div>
            <div class="top-nav">
                <span class="icon"><img src="/static/images/menu.png" alt=""> </span>
                <ul>
                    <li><a href="index.jsp">首页</a></li>
                    <li><a href="paper.jsp">发现</a></li>
                    <li><a href="projects.html">仓库</a></li>
                    <li><a href="quality.html">个人</a> </li>
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
                <li><a href="paper.jsp">发现</a></li>
                <li><a href="projects.html">仓库</a></li>
                <li><a href="index.jsp"><img src="/static/images/logo.png"></a></li>
                <li><a href="quality.html">个人</a> </li>
                <li><a href="login.jsp">登录</a></li>
                <li>
                    <form class="search_button">
                        <button><span class="glyphicon glyphicon-search"></span></button>
                        <input type="text" placeholder="请输入搜索关键词">
                    </form>
                </li>
                <div class="clearfix"></div>
            </ul>
        </div>
    </div>
</div>
<!--//header-->
<!--w3l-->
<div class="main container">
   <div class="paper_dis col-md-9">
       <c:forEach var="paper" items="${list}">
           <div class="paper" onmouseover="this.style.background='#ffecfc'" onmouseout="this.style.background = '#eeeeee'">
               <div class="paper_title ">

               </div>
               <div class="dropdown col-md-2" style="float:right; margin-right: 5px;">
                   <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                       <li><a href="#">转让文献</a></li>
                       <li><a href="#">修改价格</a></li>
                   </ul>
               </div>
               <div class="paper_abstract">
                   <span></span>
               </div>
               <div class="paper_mes">
                   <div class="paper_author col-md-2">
                       <span class="glyphicon glyphicon-user"></span>
                   </div>
                   <div class="paper_time col-md-2">
                       <fmt:formatDate type="date" value="" />
                   </div>
                   <div class="paper_right col-md-4 col-md-offset-3">
                       <div class="paper_readnum col-md-6">
                           阅读量
                       </div>
                       <div class="paper_commentnum col-md-6">
                           <span class="glyphicon glyphicon-comment"></span>评论
                       </div>
                   </div>
               </div>
           </div>
       </c:forEach>
    </div>
    <div class="paper_aside col-md-2 col-md-offset-1">
        <div class="news_hot">
            <span class="glyphicon glyphicon-list"></span> 最近新闻
        </div>
        <%! private  int newsnum=0;
        %>
        <% for (newsnum=1;newsnum<=10;newsnum++)%><%{%>
            <div class="news_content">
                    <div class="news_img col-md-4">
                <img src="/static/images/logo.png" style="width:auto; height:auto; max-width:100%; max-height:100%;">
                </div>
                <div class="news_title col-md-8">
                   新闻标题
                </div>
            </div>
        <%}%>
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
<!--//footer-->
</body>
</html>