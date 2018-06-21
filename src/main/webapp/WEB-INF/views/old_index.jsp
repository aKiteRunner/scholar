<%--
  Created by IntelliJ IDEA.
  User: marco sun
  Date: 2017/12/7
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
    //    以斜线开始，不以斜线结束(例如/crud)
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>首页</title>
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
    <link href="/static/css/animate.css" rel="stylesheet" type="text/css" media="all">
    <script src="/static/js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!--//end-animate-->
</head>
<body>
<!--header-->
<div class="header">
    <div class="container">
        <!---->
        <div class="header-logo">
            <div class="logo">
                <a href="old_index.jsp"><img src="/static/images/logo.png" alt="" ></a>
            </div>
            <div class="top-nav">
                <span class="icon"><img src="/static/images/menu.png" alt=""> </span>
                <ul>
                    <li><a href="/index">首页</a></li>
                    <li><a href="/discover">发现</a></li>
                    <li><a href="/repository">仓库</a></li>
                    <li><a href="/index"><img src="/static/images/logo.png"></a></li>
                    <li><a href="/setting">个人</a> </li>
                    <li><a href="/login">登录</a></li>
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
                <li><a href="/index">首页</a></li>
                <li><a href="/discover">发现</a></li>
                <li><a href="/repository">仓库</a></li>
                <li><a href="/index"><img src="/static/images/logo.png"></a></li>
                <li><a href="/setting">个人</a> </li>
                <li><a href="/login">登录</a></li>
                <li class="">
                    <button class="" onclick="search_show(this,event)"><span class="glyphicon glyphicon-search"></span></button>
                </li>
                <div class="clearfix"></div>
            </ul>
        </div>
        <!--script-->
        <div class="banner">

            <section class="slider">
                <div class="flexslider">
                    <ul class="slides">
                        <li>
                            <div class="banner-matter">

                                <div class="ban-top">
                                    <div class="standard-top1">
                                        <h4>Only This Month</h4>
                                        <h5>Save UpTo <span>25%</span></h5>
                                        <h6>On Residential Projects</h6>
                                        <div class="soc">
                                            <ul>
                                                <li><a href="#"><span class="fa"> </span></a></li>
                                                <li><a href="#"><span class="tw"> </span></a></li>
                                                <li><a href="#"><span class="g"> </span></a></li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                                <h1>High Quality Building Design</h1>
                            </div>
                        </li>
                        <li>
                            <div class="banner-matter">

                                <div class="ban-top">
                                    <div class="standard-top1">
                                        <h4>Only This Month</h4>
                                        <h5>Save UpTo <span>25%</span></h5>
                                        <h6>On Residential Projects</h6>
                                        <div class="soc">
                                            <ul>
                                                <li><a href="#"><span class="fa"> </span></a></li>
                                                <li><a href="#"><span class="tw"> </span></a></li>
                                                <li><a href="#"><span class="g"> </span></a></li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                                <h1>We Build The Feature For You </h1>
                            </div>
                        </li>
                        <li>
                            <div class="banner-matter">

                                <div class="ban-top">
                                    <div class="standard-top1">
                                        <h4>Only This Month</h4>
                                        <h5>Save UpTo <span>25%</span></h5>
                                        <h6>On Residential Projects</h6>
                                        <div class="soc">
                                            <ul>
                                                <li><a href="#"><span class="fa"> </span></a></li>
                                                <li><a href="#"><span class="tw"> </span></a></li>
                                                <li><a href="#"><span class="g"> </span></a></li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                                <h1>Commited To Best Quality</h1>
                            </div>
                        </li>
                    </ul>
                </div>
            </section>
            <script>window.jQuery || document.write('<script src="/static/js/jquery-3.2.1.min.js">\x3C/script>')</script>
            <!--FlexSlider-->
            <script defer src="/static/js/jquery.flexslider.js"></script>
            <script type="text/javascript">
                $(function(){
                    SyntaxHighlighter.all();
                });
                $(window).load(function(){
                    $('.flexslider').flexslider({
                        animation: "slide",
                        start: function(slider){
                            $('body').removeClass('loading');
                        }
                    });
                });
            </script>

        </div>
    </div>
</div>
<!--//header-->
<!--w3l-->
<div class="w3l">
    <div class="container">
        <div class="col-md-3 plan-left wow fadeInLeft animated" data-wow-delay=".5s">
            <div class="plan-top">
                <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                <h3>Planning</h3>
                <p>Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
            </div>
        </div>
        <div class="col-md-3 plan-left wow fadeInLeft animated" data-wow-delay=".5s">
            <div class="plan-top">
                <span class="glyphicon glyphicon-object-align-right" aria-hidden="true"></span>
                <h3>Modeling</h3>
                <p>Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
            </div>
        </div>
        <div class="col-md-3 plan-left wow fadeInRight animated" data-wow-delay=".5s">
            <div class="plan-top">
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                <h3>Design</h3>
                <p>Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
            </div>
        </div>
        <div class="col-md-3 plan-left wow fadeInRight animated" data-wow-delay=".5s">
            <div class="plan-top">
                <span class="glyphicon glyphicon-equalizer" aria-hidden="true"></span>
                <h3>Analysis</h3>
                <p>Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--//w3l-->
<!--w3ls-->
<div class="w3ls">
    <div class="container">
        <div class="col-md-6 standards-left wow fadeInLeft animated" data-wow-delay=".5s">
            <h2>We Have A Passion In Creating New And Unique Spaces</h2>
            <p>Aenean nonummy hendrerit mauris. Cum sociis natoque penatibus et magnis dis parturient montes ascetur ridiculus mus. Nulla dui. Fusce feugiat malesuada odio. Morbi nunc odio gravida at cursus nec luctus a lorem.</p>
            <p> Maecenas tristique orci ac sem. Duis ultricies pharetra magna. Duis ultricies pharetra ultricies pharetra magna magna. Donec accumsan malesuada orci  Donec accumsan malesuada orci.</p>
        </div>
        <div class="col-md-3 standards-middle wow fadeInRight animated" data-wow-delay=".5s">
            <h3>Quality Standards :</h3>
            <ul>
                <li><a href="#">Quam andomised words.</a></li>
                <li><a href="#">Volutpa andomised words</a></li>
                <li><a href="#">Varius domised words.</a></li>
                <li><a href="#">Morbi nunc odio gravida</a></li>
                <li><a href="#">Sociis natoque penatibus</a></li>
                <li><a href="#">Volutpa andomised words</a></li>
            </ul>
        </div>
        <div class="col-md-3 standards-right wow fadeInRight animated" data-wow-delay=".5s">
            <div class="standard-top">
                <h4>Only This Month</h4>
                <h5>Save UpTo <span>25%</span></h5>
                <h6>On Residential Projects</h6>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--//standards-->
<!--wthree-->
<div class="wthree">
    <div class="container">
        <div class="col-md-6 welcome-left wow fadeInLeft animated" data-wow-delay=".5s">
            <h3>Welcome</h3>
            <p>Donec alsuadrcnc sit amet eros. Lorem ips dolor sit at consc tetuer aiing elituris fermentum tumagna. Sed laoreet aliquam leot te dt elentu vel leifed elit.enean auctor wrnai.</p>
            <p>Oua volutpat. Duis ac turpisteger rutrum ante eu lacuest um liberoisl porta vel sceleisque eget malesuada at neque. Vivam nibhus leo vel metus.</p>
            <p>Nulla facilisi. Aenean nec eros. Vestibulum ante ipsumr imis in faucibus orci luctus et trices posu.</p>
        </div>
        <div class="col-md-6 welcome-left wow fadeInRight animated" data-wow-delay=".5s">
            <h3>NewsLetter</h3>
            <p>Oua volutpat. Duis ac turpisteger rutrum ante eu lacuest um liberoisl porta vel sceleisque eget males.</p>
            <div class="news">
                <form action="#" method="post">
                    <input type="text" name="email" placeholder="Enter your email to update" required=" ">
                    <input type="submit" value="Submit">
                </form>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--//wthree-->
<!--agile-->
<div class="agile">
    <div class="container">
        <div class="col-md-3 services-left2 wow fadeInLeft animated" data-wow-delay=".5s">
            <div class="view1 fifth-effect">
                <a href="#" title="Full Image"><img src="/static/images/4.jpg" class="img-responsive" alt=""></a>
                <div class="mask1"></div>
            </div>
            <div class="s-btm">
                <h4>Luxury</h4>
                <p>Donec convallis vitae mi sodales varius</p>
            </div>
        </div>
        <div class="col-md-3 services-left2 wow fadeInLeft animated" data-wow-delay=".5s">
            <div class="view1 fifth-effect">
                <a href="#" title="Full Image"><img src="/static/images/5.jpg" class="img-responsive" alt=""></a>
                <div class="mask1"></div>
            </div>
            <div class="s-btm">
                <h4>Residential</h4>
                <p>Donec convallis vitae mi sodales varius</p>
            </div>
        </div>
        <div class="col-md-3 services-left2 wow fadeInRight animated" data-wow-delay=".5s">
            <div class="view1 fifth-effect">
                <a href="#" title="Full Image"><img src="/static/images/6.jpg" class="img-responsive" alt=""></a>
                <div class="mask1"></div>
            </div>
            <div class="s-btm">
                <h4>Industrial</h4>
                <p>Donec convallis vitae mi sodales varius</p>
            </div>
        </div>
        <div class="col-md-3 services-left2 wow fadeInRight animated" data-wow-delay=".5s">
            <div class="view1 fifth-effect">
                <a href="#" title="Full Image"><img src="/static/images/7.jpg" class="img-responsive" alt=""></a>
                <div class="mask1"></div>
            </div>
            <div class="s-btm">
                <h4>Commercial</h4>
                <p>Donec convallis vitae mi sodales varius</p>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--//agile-->
<!--footer-->
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
