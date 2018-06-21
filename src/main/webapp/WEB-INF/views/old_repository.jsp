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
    <%--！！！！！！！！！！！！！！！！！！！前面5条不要删！！！！！！！！！！！！！！！！--%>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>

    <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>

    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="/static/css/style.css?v=1324" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--flexslider-->
    <link rel="stylesheet" href="/static/css/flexslider.css" type="text/css" media="screen" />
    <!--//flexslider-->
    <link rel="stylesheet" href="/static/css/lightbox.css">
    <!--JS for animate-->
    <link href="/static/css/animate.css" rel="stylesheet" type="text/css" media="all">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="/static/js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!--//end-animate-->
</head>
<body>
<div class="modal" id="giftModal" tabindex="-1" role="dialog" aria-labelledby="giftModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="giftModalTitle">转让文献</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group col-lg-offset-2 col-lg-12">
                        <input class="form-control" type="text" id="receiver" placeholder="用户名">
                    </div>
                    <div class="form-group col-lg-offset-2 col-lg-12">
                        <input class="form-control" type="number" id="paperId" placeholder="文献编号">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary" onclick="giftPaper()">确认</button>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="priceModal" tabindex="-1" role="dialog" aria-labelledby="priceModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="priceModalTitle">修改价格</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group col-lg-offset-2 col-lg-12">
                        <input class="form-control" type="number" id="price" placeholder="价格">
                    </div>
                    <div class="form-group col-lg-offset-2 col-lg-12">
                        <input class="form-control" type="number" id="paperId2" placeholder="文献编号">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="changePrice()">确认</button>
            </div>
        </div>
    </div>
</div>

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
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

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
                <li><a href="old_index.jsp">首页</a></li>
                <li><a href="services.html">发现</a></li>
                <li><a href="projects.html">仓库</a></li>
                <li><a href="old_index.jsp"><img src="/static/images/logo.png"></a></li>
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
                        <li><a href="#" data-toggle="modal" data-target="#giftModal">转让文献</a></li>
                        <li><a href="#" data-toggle="modal" data-target="#priceModal">修改价格</a></li>
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
            <li>${user.username}</li>
        </ol>
        <h4>邮箱</h4>
        <ol class="list-unstyled">
            <li>${user.email}</li>
        </ol>
        <h4>手机</h4>
        <ol class="list-unstyled">
            <li>${user.phone}</li>
        </ol>
        <h4>等级</h4>
        <ol class="list-unstyled">${user.degree}</ol>
        <ol class="list-unstyled">距离升级还需要<strong class="text-danger">${curExp}</strong>积分</ol>
        <div class="progress" style="width:200px;">
            <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:60%;">
                60%
            </div>
        </div>
    </div>
</div>

<script>
    function giftPaper() {
        var receiverName = document.getElementById("receiver").value;
        var paperId = document.getElementById("paperId").value;
        $('#giftModal').modal('hide');
        $.ajax({
            url : '/giftpaper/',
            type : 'POST',
            data : JSON.stringify({"receiver" : receiverName, "paperId": paperId}), // Request body
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            success : function(response) {
                //请求成功
                if(response["errorInfo"] == null){
                    infomation(false, response["info"])
                }else{
                    infomation(true, response["errorInfo"])
                }
            },
            error : function(msg) {
            }
        });
    }

    function changePrice() {
        var price = document.getElementById("price").value;
        var paperId = document.getElementById("paperId2").value;
        $('#priceModal').modal('hide');
        $.ajax({
            url : '/changeprice/',
            type : 'POST',
            data : JSON.stringify({"price" : price, "paperId": paperId}), // Request body
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            success : function(response) {
                //请求成功
                if(response["errorInfo"] == null){
                    infomation(false, response["info"])
                }else{
                    infomation(true, response["errorInfo"])
                }
            },
            error : function(msg) {
            }
        });
    }

    // 如果错误，第一个参数传true,否则false.第二个参数为信息
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