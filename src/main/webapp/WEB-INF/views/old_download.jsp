<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 52460
  Date: 2018/6/19
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>模板</title>
    <link href="/static/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/static/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="/static/css/style.css?v=12343" rel="stylesheet" type="text/css" media="all" />
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

<body onload="page(1,10)">
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
                    <li><a href="paper.jsp">发现</a></li>
                    <li><a href="projects.html">仓库</a></li>
                    <li><a href="template.jsp">个人</a> </li>
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
                <li><a href="paper.jsp">发现</a></li>
                <li><a href="projects.html">仓库</a></li>
                <li><a href="old_index.jsp"><img src="/static/images/logo.png"></a></li>
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
<div class="comment_main container" >
    <div class="detail_main col-md-7 ">
        <div class="detail_title">
            ${paper.name}
        </div>
        <div class="detail_docum">
            <div class="abstract_author">
                ${paper.time}<br>
                <span class="glyphicon glyphicon-user"></span>作者
            </div>
            <div class="detail_abstract">
                <div class="abstract_title">
                    摘要
                </div>
                <hr style="height:2px;width: 100%;color: #040402;font-weight: bold;background-color: black;margin-top: 0.5em; " >
                <p>${paper.abstract1}</p>
            </div>
        </div>
        <div class="display_down">
            <div class="comment col-md-9">
                <div class="top_of_comment">
                    <div class="dis_comment">评论</div>
                    <button class="submit_comment" onclick="comment()">评论</button>
                </div>
                <div class="write_conment">
                    <textarea placeholder="写下你的评论..." id="content"></textarea>
                </div>
            </div>
            <div class="download_box col-md-3">
                <div class="download_icon col-md-5">
                    <span class="glyphicon glyphicon-download"></span>
                </div>
                <div class="download_font col-md-7">下载</div>
            </div>
        </div>
    </div>
    <div class="comment_aside col-md-4 ">
        <div class="comment_hot">
            <span class="glyphicon glyphicon-comment"></span>
            <h2>有关评论</h2>
        </div>
        <c:forEach var="comment" items="${comments}">
            <div class="comment_content">
                <div class="comment_user ">
                    <span class="glyphicon glyphicon-user"></span>
                    <h2>${comment.user}</h2>
                </div>
                <div class="comment_word ">
                    ${comment.content}
                </div>
            </div>
        </c:forEach>

        <ul id="page_test" class="pagination page_test2" >
        </ul>
        <script>
            function page(nowpage,allpage)
            {
                var callBack =function (nowpage,allpage) {
                    alert('当前页 ：'+nowpage +'总共页：'+allpage);
                }
                var obj=document.getElementById("page_test");
                if(nowpage>4&&allpage>=6)
                {
                    obj.innerHTML+='<li><a href="#1">首页</a></li>';
                }
                if(nowpage>=2)
                {
                    var h=nowpage-1;
                    obj.innerHTML+='<li><a href="#'+ h +'">上一页</a></li>';
                }
                if(allpage<=5)
                {
                    for(var i=1;i<=allpage;i++)
                    {
                        if(nowpage==i)
                            obj.innerHTML+='<li class="active"><a href="#'+ i +'">'+ i +'</a></li>';
                        else
                            obj.innerHTML+='<li><a href="#'+ i +'">'+ i +'</a></li>';
                    }
                }
                else{
                    for(var i=1;i<=5;i++)
                    {
                        if(nowpage==1||nowpage==2)
                        {
                            if(nowpage==i)
                                obj.innerHTML+='<li class="active"><a href="#'+ i +'">'+ i +'</a></li>';
                            else
                                obj.innerHTML+='<li><a href="#'+ i +'">'+ i +'</a></li>';
                        }
                        else if(allpage-nowpage==0||allpage-nowpage==1)
                        {
                            var h=allpage-5+i;
                            if(allpage-nowpage==0&&i==5)
                                obj.innerHTML+='<li class="active"><a href="#'+h+'">'+ h+'</a></li>';
                            else if(allpage-nowpage==1&&i==4)
                                obj.innerHTML+='<li class="active"><a href="#'+h+'">'+ h+'</a></li>';
                            else
                                obj.innerHTML+='<li><a href="#'+h+'">'+ h+'</a></li>';
                        }
                        else{
                            var h=nowpage-3+i;
                            if(i==3)
                                obj.innerHTML+='<li  class="active"><a href="#'+h+'">'+ h+'</a></li>';
                            else
                                obj.innerHTML+='<li><a href="#'+h+'">'+ h+'</a></li>';
                        }
                    }
                }
                if(allpage-nowpage>=1)
                {
                    var h=nowpage+1;
                    obj.innerHTML+='<li><a href="#'+ h +'">下一页</a></li>';
                }
                if(allpage-nowpage>=3&&allpage>=6)
                {
                    obj.innerHTML+='<li><a href="#'+ allpage +'">尾页</a></li>';
                }
                var aA=obj.getElementsByTagName('a');
                for(var i=0;i<aA.length;i++)
                {
                    aA[i].onclick=function () {
                        var nowNum=parseInt(this.getAttribute('href').substring(1));
                        obj.innerHTML='';
                        console.log(nowNum);
                        page(nowNum,allpage);
                        callBack(nowNum,allpage);
                        return false;
                    }
                }
            }
        </script>
    </div>
</div>

<script>
    function comment() {
        var paperId = ${paper.id}
        var content = document.getElementById("content").value;
        alert("!!")
        $.ajax({
            url : '/comment/',
            type : 'POST',
            data : JSON.stringify({"content" : content, "paperId": paperId}), // Request body
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            success : function(response) {
                //请求成功
                alert("!!!")
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
<!--w3l-->
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
