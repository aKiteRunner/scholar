<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 卡牌小希
  Date: 2018/6/21
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>模板</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>

    <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>

    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body style="background: #f6f6f6">
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
<!--header-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <nav class="navbar navbar-light bg-light">
        <a class="navbar-brand mb-0 h1" href="#">Gryffindor</a>
    </nav>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/repository">仓库<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="/setting">个人信息<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    学科
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/discipline/3">数学</a>
                    <a class="dropdown-item" href="/discipline/4">物理学</a>
                    <a class="dropdown-item" href="/discipline/5">天文学</a>
                    <a class="dropdown-item" href="/discipline/6">工程科技</a>
                    <a class="dropdown-item" href="/discipline/7">化学</a>
                    <a class="dropdown-item" href="/discipline/8">材料科学</a>
                    <a class="dropdown-item" href="/discipline/9">冶金工业</a>
                    <a class="dropdown-item" href="/discipline/10">农业科技</a>
                    <a class="dropdown-item" href="/discipline/11">农业工程</a>
                    <a class="dropdown-item" href="/discipline/12">水产和渔业</a>
                    <a class="dropdown-item" href="/discipline/13">农作物</a>
                    <a class="dropdown-item" href="/discipline/14">医药卫生</a>
                    <a class="dropdown-item" href="/discipline/15">中医药</a>
                    <a class="dropdown-item" href="/discipline/16">妇产科学</a>
                    <a class="dropdown-item" href="/discipline/17">神经病学</a>
                    <a class="dropdown-item" href="/discipline/18">哲学与人文</a>
                    <a class="dropdown-item" href="/discipline/19">地理</a>
                    <a class="dropdown-item" href="/discipline/20">哲学</a>
                    <a class="dropdown-item" href="/discipline/21">美学</a>
                    <a class="dropdown-item" href="/discipline/22">软件工程</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    机构
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
                    <a class="dropdown-item" href="/institute/1">清华</a>
                    <a class="dropdown-item" href="/institute/2">北大</a>
                    <a class="dropdown-item" href="/institute/3">中科院</a>
                    <a class="dropdown-item" href="/institute/4">北航</a>
                    <a class="dropdown-item" href="/institute/5">浙大</a>
                    <a class="dropdown-item" href="/institute/6">哈工大</a>
                    <a class="dropdown-item" href="/institute/7">天津大学</a>
                    <a class="dropdown-item" href="/institute/8">南京大学</a>
                    <a class="dropdown-item" href="/institute/9">湖南大学</a>
                    <a class="dropdown-item" href="/institute/10">山东大学</a>
                </div>
            </li>
            <li class="nav-item ">
                <form class="form-inline my-2 my-lg-0" action="/search" method="post">
                    <input name="query" class="form-control mr-sm-2" type="search" placeholder="输入关键字" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
                </form>
            </li>
        </ul>
        <div href="/login" class="nav-item">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/login">登录/注册<span class="sr-only">(current)</span></a>
                </li>
            </ul>
        </div>

    </div>
</nav>
<p></p>
<p></p>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="row">
                <c:forEach var="paper" items="${list}">
                    <div class="jumbotron" style="background: #FFFFFF">
                        <h5><i class="fas fa-book"></i><a href="/paper/${paper[0].id}" class="btn">${paper[0].name}</a></h5>
                        <p class="lead">${paper[0].abstract1}</p>
                        <hr class="my-4">
                        <div class="row">
                            <div class="col-md-3">
                                <i class="fas fa-address-card"></i>
                                    ${paper[1].username}
                            </div>
                            <div class="col-md-3">
                                <i class="fas fa-calendar-alt"></i>
                                    ${paper[0].time}
                            </div>
                            <div class="col-md-3">
                                <i class="fas fa-fire"></i>
                                热度${paper[0].popularity}
                            </div>
                            <div class="col-md-3">
                                <i class="fas fa-bookmark"></i>
                                id #${paper[0].id}
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="col-md-4 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">最近新闻</span>
            </h4>
            <div class="col-md-4 mb-4">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-muted">最近新闻</span>
                </h4>
                <ul class="list-group mb-3">
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">
                                <a href="https://blog.csdn.net/blockchain_lemon/article/details/80749552" style=" color:black"
                                   target="_blank">刚刚！孟岩区块链通证经济课二期报满，三期报名开启</a>
                            </h6>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">
                                <a href="https://blog.csdn.net/blockchain_lemon/article/details/80749541" style=" color:black" target="_blank">1分钟链圈 | 以太坊再现漏洞！或使Token供应</a>
                            </h6>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">
                                <a href="https://blog.csdn.net/dQCFKyQDXYm3F8rB0/article/details/80730659"  style=" color:black"target="_blank">OpenAI NLP最新进展：通过无监督学习提升语</a>
                            </h6>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">
                                <a href="https://blog.csdn.net/guleileo/article/details/80729775"  style=" color:black"target="_blank">AI从入门到放弃：BP神经网络算法推导及代码实现笔</a>
                            </h6>

                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">
                                <a href="https://blog.csdn.net/csdnnews/article/details/80732787"  style=" color:black"target="_blank">电竞大数据平台 FunData 的系统架构演进</a>
                            </h6>
                            <p class="list-group-item-text"></p>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">
                                <a href="https://blog.csdn.net/csdnnews/article/details/80731188" style=" color:black" target="_blank">程序员如果也能像C罗一样自律和勤奋，必将成为大神！</a>
                            </h6>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">
                                <a href="https://blog.csdn.net/csdnsevenn/article/details/80750502"  style=" color:black"target="_blank">也许你的账号密码就是这样泄露了！</a>
                            </h6>
                            <p class="list-group-item-text"></p>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">
                                <a href="https://edu.csdn.net/huiyiCourse/series_detail/108?utm_source=home4"  style=" color:black"target="_blank">机器学习十二讲（核心算法各个击破）</a>
                            </h6>
                            <p class="list-group-item-text"></p>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">
                                <a href="http://ibmuniversity.csdn.net/"  style=" color:black"target="_blank">人工智能、机器学习和认知计算入门指南</a>
                            </h6>
                            <p class="list-group-item-text"></p>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">
                                <a href="https://blog.csdn.net/csdnsevenn/article/details/80750499"  style=" color:black"  target="_blank">30岁那年转行，离开通信拥抱互联网</a>
                            </h6>
                            <p class="list-group-item-text"></p>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">
                                <a href="http://gitbook.cn/gitchat/geekbook/5b14bc2f18d5d2470992eee1?utm_source=jr18062002"   style=" color:black" target="_blank">你不知道的 JavaScript</a>
                            </h6>
                            <p class="list-group-item-text"></p>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">
                                <a href="http://gitbook.cn/gitchat/column/5a56effae286423809d47f2d?utm_source=jr18062001"  style=" color:black"  target="_blank">程序员向架构师转型之路</a>
                            </h6>
                            <p class="list-group-item-text"></p>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">
                                <a href="https://edu.csdn.net/huiyiCourse/series_detail/102?utm_source=home4"  style=" color:black"  target="_blank">无人驾驶技术如何入门？</a>
                            </h6>
                            <p class="list-group-item-text"></p>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">
                                <a href="http://qualcomm.csdn.net/"   style=" color:black"   target="_blank">5G标准已经完成，下一步是什么</a>
                            </h6>
                            <p class="list-group-item-text"></p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--//header-->
<!--w3l-->
<!--//footer-->
<!-- Footer -->
<footer class="page-footer font-small unique-color-dark mt-4">

    <div style="background-color: #888888;">
        <div class="container">

            <!-- Grid row-->
            <div class="row py-4 d-flex align-items-center">

                <!-- Grid column -->
                <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
                    <h6 class="mb-0">欢迎加入我们！</h6>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-6 col-lg-7 text-center text-md-right">

                    <!-- Facebook -->
                    <a class="fb-ic">
                        <i class="fa fa-facebook white-text mr-4"> </i>
                    </a>
                    <!-- Twitter -->
                    <a class="tw-ic">
                        <i class="fa fa-twitter white-text mr-4"> </i>
                    </a>
                    <!-- Google +-->
                    <a class="gplus-ic">
                        <i class="fa fa-google-plus white-text mr-4"> </i>
                    </a>
                    <!--Linkedin -->
                    <a class="li-ic">
                        <i class="fa fa-linkedin white-text mr-4"> </i>
                    </a>
                    <!--Instagram-->
                    <a class="ins-ic">
                        <i class="fa fa-instagram white-text"> </i>
                    </a>

                </div>
                <!-- Grid column -->

            </div>
            <!-- Grid row-->

        </div>
    </div>

    <!-- Footer Links -->
    <div class="container text-center text-md-left mt-5">

        <!-- Grid row -->
        <div class="row mt-3">

            <!-- Grid column -->
            <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">

                <!-- Content -->
                <h6 class="text-uppercase font-weight-bold">科技专家资源共享</h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>我们提供最全面的，最权威的论文下载,在这里你可以享受知识分享的乐趣  </p>

            </div>
            <!-- Grid column -->

            <!-- Grid column -->
            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">

                <!-- Links -->
                <h6 class="text-uppercase font-weight-bold">我们所在</h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p> 学院路 37号，海淀区</p>
                <p> 北京航空航天大学</p>
                <p>  软件学院</p>

            </div>
            <!-- Grid column -->

            <!-- Grid column -->
            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

                <!-- Links -->
                <h6 class="text-uppercase font-weight-bold">友情链接</h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>
                    <a href="http://epub.cnki.net/kns/default.htm">中国知网</a>
                </p>
                <p>
                    <a href="https://www.csdn.net/">CSDN</a>
                </p>
                <p>
                    <a href="https://www.openacademic.ai/oag/">Open Academic</a>
                </p>
                <p>
                    <a href="http://219.224.166.3:8011/">在线协作平台</a>
                </p>

            </div>
            <!-- Grid column -->

            <!-- Grid column -->
            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

                <!-- Links -->
                <h6 class="text-uppercase font-weight-bold">联系我们</h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>
                    <i class="fa fa-home mr-3"></i>  北京航空航天大学</p>
                <p>
                    <i class="fa fa-envelope mr-3"></i> info@example.com</p>
                <p>
                    <i class="fa fa-phone mr-3"></i> 12345678</p>
                <p>
                    <i class="fa fa-print mr-3"></i>123577818</p>

            </div>
            <!-- Grid column -->

        </div>
        <!-- Grid row -->

    </div>
    <!-- Footer Links -->

    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">Copyright &copy; Gryffindor Group 2018.</div>
    <!-- Copyright -->

</footer>
<!-- Footer -->
<script>
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

