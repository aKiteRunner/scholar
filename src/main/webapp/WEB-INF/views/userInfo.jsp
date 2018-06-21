<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 52460
  Date: 2018/6/19
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Main</title>
    <link rel="stylesheet" type="text/css" href="/static/css/style-v4.css">
    <!-- Bootstrap -->

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>

    <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>

    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>


    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
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
        <a class="navbar-brand mb-0 h1" href="/">Gryffindor</a>
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

<h1></h1>

<ul class="nav flex-column" id="Navibar" style="float: left; width: 8%;">
    <a href="#a" class="nav-link active" onclick="userInfo()">个人信息</a>
    <a href="#b" class="nav-link" onclick="updateInfo()">修改信息</a>
    <a href="#c" class="nav-link">积分充值</a>
    <a href="#d" class="nav-link">站内信</a>
    <a href="#f" class="nav-link">申请专家</a>
    <a href="#g" class="nav-link">上传论文</a>
    <!-- <li role="presentation" class="active"><a href="#a" >个人信息</a></li> -->
</ul>
<div class="container" id="a">

    <div class="page-header" style="margin-top: 0px;">
        <h1 style="margin-top: 0px;">个人信息</h1>
    </div>

    <p id="Hello">你好，<strong class="text-danger" id="username">${username}</strong></p>

    <h3 class="infoTitle">邮箱</h3>
    <p class="infoDetail" id="email">${email}</p>

    <h3 class="infoTitle">手机</h3>
    <p class="infoDetail" id="phone">${phone}</p>

    <h3 class="infoTitle">积分</h3>
    <p class="infoDetail" id="credit">${credit}</p>

    <h3 class="infoTitle">等级</h3>
    <p class="infoDetail" id="degree">${degree}</p>
    <div class="progress infoDetail" style="width:200px;">
        <div id="bar" class="progress-bar" role="progressbar" aria-valuenow="${exp}" aria-valuemin="0" aria-valuemax="${maxExp}"
             style="width:60%;">
            60%
        </div>
    </div>

</div> <!-- /container -->
<div class="container" id="b">
    <div class="page-header" style="margin-top: 0px;">
        <h1 style="margin-top: 0px;">修改信息</h1>
    </div>
    <form class="form-horizontal">
        <div class="form-group row">
            <label for="updateUserName" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-3">
                <input class="form-control" id="updateUserName">
            </div>
            <div class="col-sm-3">
                <button class="btn btn-primary" onclick="updateUserNameF()">更改昵称</button>
            </div>
        </div>
        <div class="form-group row">
            <label for="updateEmail" class="col-sm-2 control-label">Email</label>
            <div class="col-sm-3">
                <input type="email" class="form-control" id="updateEmail">
            </div>
            <div class="col-sm-2">
                <button type="submit" class="btn btn-primary" data-dismiss="alert" onclick="updateEmailF()">更改邮箱</button>
            </div>
        </div>
        <div class="form-group row">
            <label for="oldPw" class="col-sm-2 control-label">原密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="oldPw">
            </div>
        </div>
        <div class="form-group row">
            <label for="newPw" class="col-sm-2 control-label">新密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="newPw">
            </div>
        </div>
        <div class="form-group row">
            <label for="newPwConf" class="col-sm-2 control-label">确认新密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="newPwConf">
            </div>
            <div class="col-sm-offset-2 col-sm-4">
                <button type="submit" class="btn btn-primary" data-dismiss="alert" onclick="updatePasswordF()">更改密码</button>
            </div>
        </div>
    </form>


</div> <!-- /container -->
<div class="container" id="c">
    <div class="page-header" style="margin-top: 0px;">
      <h1 style="margin-top: 0px;">积分充值</h1>
    </div>
    <div class="card-deck mb-3 text-center">
      <div class="card mb-4 box-shadow">
        <div class="card-header">
          <h4 class="my-0 font-weight-normal">套餐一</h4>
        </div>
        <div class="card-body">
          <h1 class="card-title pricing-card-title">$10 <small class="text-muted">/ 10 credits</small></h1>
          <ul class="list-unstyled mt-3 mb-4">
            <li>温馨提示</li>
            <li>知识就是力量</li>
            <li>版权需要购买</li>
            <li>尊重正版</li>
          </ul>
          <button type="button" class="btn btn-lg btn-block btn-outline-primary" onclick="topUp(10)">10</button>
        </div>
      </div>
      <div class="card mb-4 box-shadow">
        <div class="card-header">
          <h4 class="my-0 font-weight-normal">套餐二</h4>
        </div>
        <div class="card-body">
          <h1 class="card-title pricing-card-title">$50 <small class="text-muted">/ 50 credits</small></h1>
          <ul class="list-unstyled mt-3 mb-4">
              <li>温馨提示</li>
              <li>知识就是力量</li>
              <li>版权需要购买</li>
              <li>尊重正版</li>
          </ul>
          <button type="button" class="btn btn-lg btn-block btn-outline-primary" onclick="topUp(20)">20</button>
        </div>
      </div>
    </div>
    <div class="card-deck mb-3 text-center">
      <div class="card mb-4 box-shadow">
        <div class="card-header">
          <h4 class="my-0 font-weight-normal">套餐三</h4>
        </div>
        <div class="card-body">
          <h1 class="card-title pricing-card-title">$100 <small class="text-muted">/ 100 credits</small></h1>
          <ul class="list-unstyled mt-3 mb-4">
              <li>温馨提示</li>
              <li>知识就是力量</li>
              <li>版权需要购买</li>
              <li>尊重正版</li>
          </ul>
          <button type="button" class="btn btn-lg btn-block btn-outline-primary" onclick="topUp(50)">50</button>
        </div>
      </div>
      <div class="card mb-4 box-shadow">
        <div class="card-header">
          <h4 class="my-0 font-weight-normal">自定义</h4>
        </div>
        <div class="card-body">
          <h1 class="card-title pricing-card-title">$1 <small class="text-muted">/ 1 credits</small></h1>
          <ul class="list-unstyled mt-3 mb-4">
            <li>充值<input type="number"  placeholder="100" style="width: 80px;" id="number">元</li>
          </ul>
          <button type="button" class="btn btn-lg btn-block btn-outline-primary" onclick="topUPDiy()">充值</button>
        </div>
      </div>
    </div>
  </div> <!-- /container -->

<div class="container" id="d">
    <div class="page-header" style="margin-top: 0px;">
        <h1 style="margin-top: 0px;">站内信</h1>
    </div>
    <ul class="nav nav-tabs">
        <li role="presentation" class="active" id="rlButton">收件箱</li>
        <li role="presentation" id="plButton">已发送</li>
        <li role="presentation" id="wlButton">写信</li>
    </ul>
    <div class="panel panel-default" id="receivedLetter">
        <!-- Default panel contents -->
        <p class="panel-heading" style="font-size: 13px;">共<strong class="text-danger" id="receiveMessageNum"></strong>封站内信</p>

        <!-- Table -->
        <table class="table" id="receivedTable">
            <tr>
                <td>#</td>
                <td>内容</td>
                <td>发件人</td>
                <td>发件时间</td>
            </tr>
        </table>
    </div>

    <div class="panel panel-default" id="postedLetter">
        <!-- Default panel contents -->
        <p class="panel-heading" style="font-size: 13px;">已发送<strong class="text-danger" id="sentMessageNum"></strong>封站内信</p>

        <!-- Table -->
        <table class="table" id="sentTable">
            <tr>
                <td>#</td>
                <td>内容</td>
                <td>收件人</td>
                <td>发件时间</td>
            </tr>
        </table>
    </div>

    <div class="panel panel-default" id="writeLetter" >
      <form class="form-inline" style="margin-top: 10px; margin-bottom: 10px;">
          <div class="form-group wLetter">
            <label for="receiver">收件人</label>
            <input type="text" class="form-control" id="receiver">
          </div>
          <div class="form-group wLetter">
            <label for="messageTitle">标题</label>
            <input type="text" class="form-control" id="messageTitle">
          </div>
          <button type="submit" class="btn btn-primary">发送</button>
        </form>
      <textarea class="form-control" rows="10"></textarea>
  </div>

</div> <!-- /container -->

<div class="container" id="f">
    <div class="page-header" style="margin-top: 0px;">
        <h1 style="margin-top: 0px;">申请专家</h1>
    </div>
    <form class="form-horizontal">
        <div class="form-group">
            <label  class="col-sm-2 control-label" >选择机构</label>
            <select  class="form-control col-sm-5" style="margin-left:8%;"  id="instituteId">
                <option value ="1">清华</option>
                <option value ="2">北大</option>
                <option value="3">中科院</option>
                <option value="4">北航</option>
            </select>
        </div>
        <div class="form-group">
            <label for="title" class="col-sm-2 control-label">填写头衔</label>
            <input type="text" class="form-control col-sm-5" style="margin-left:8%;" id="title">

        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">填写内容</label>
        </div>
        <textarea class="form-control col-sm-5" style="margin-left:8%;" rows="8" cols="20" id="identity"></textarea>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-4" style="margin-top: 20px; margin-left:8%;">
                <button type="submit" class="btn btn-primary" data-dismiss="alert" onclick="apply()">提交申请</button>
            </div>
        </div>

    </form>


</div> <!-- /container -->
<div class="container" id="g">
    <div class="page-header" style="margin-top: 0px;">
        <h1 style="margin-top: 0px;">发表论文</h1>
    </div>
    <form class="form-horizontal"  enctype="multipart/form-data" method="post" action="/setting/uploadfile">
        选取文件: <input type="file" name="file" name="file" >
        <div class="form-group row" style="margin-top: 30px; margin-left:2px;">
            学科
          <select class="form-control col-sm-3" name="discipline" style="margin-left:15px;">
              <option value="3">数学</option>
              <option value="4">物理学</option>
              <option value="5">天文学</option>
              <option value="7">化学</option>
              <option value="8">材料科学</option>
              <option value="9">冶金工业</option>
              <option value="8">农业工程</option>
              <option value="8">水产和渔业</option>
              <option value="8">农作物</option>
              <option value="8">中医药</option>
              <option value="8">妇产科学</option>
              <option value="8">神经病学</option>
              <option value="19">地理</option>
              <option value="20">哲学</option>
              <option value="21">美学</option>
              <option value="1">其他</option>
          </select>
          <input class="form-control col-sm-3"  type="text" id="price" name="price" style="margin-left:15px;">
          <input class="btn btn-primary"  type="submit" value="上传" style="margin-left:15px;">
        </div>
        
    </form>


</div> <!-- /container -->

</body>
<script>
    var nav = document.getElementById('Navibar')
    nav.onclick = function (e) {
        var children = nav.children
        for (var i = 0; i < 6; i++) {
            children[i].className = 'nav-link'
        }
        e.target.className = 'nav-link active'
    }
    var rl = document.getElementById('rlButton')
    var pl = document.getElementById('plButton')
    var wl = document.getElementById('wlButton')
    var rdiv = document.getElementById('receivedLetter')
    var pdiv = document.getElementById('postedLetter')
    var wdiv = document.getElementById('writeLetter')
    rl.className = 'active'
    pl.className = ''
    wl.className = ''
    rdiv.style.display = 'block'
    pdiv.style.display = 'none'
    wdiv.style.display = 'none'
    function receiveMessage () {
        rl.className = 'active'
        pl.className = ''
        wl.className = ''
        rdiv.style.display = 'block'
        pdiv.style.display = 'none'
        wdiv.style.display = 'none'
        $.ajax({
            url : '/setting/receivedmessage',
            type : 'GET',
            data : null, // Request body
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            success : function(response) {
                //请求成功
                var table = document.getElementById("receivedTable");
                table.innerHTML = "<tr>\n" +
                    "                <td>#</td>\n" +
                    "                <td>内容</td>\n" +
                    "                <td>发件人</td>\n" +
                    "                <td>发件时间</td>\n" +
                    "            </tr>"
                for (x = 0; x < response["receivedMessage"].length; x++) {
                    message = response["receivedMessage"][x];
                    console.log(message);
                    table.innerHTML += "<tr><td>" + (x + 1) +"</td>" +
                        "<td>" + message["content"] +"</td>" +
                        "<td>" + message["sender"] + "</td>" +
                        "<td>" + message["time"] + "</td>" +
                        "</tr>";
                }
                document.getElementById("receiveMessageNum").innerText = x;
            },
            error : function(msg) {
            }
        });
    }

    function sendMessage() {
        rl.className = ''
        pl.className = 'active'
        wl.className = ''
        rdiv.style.display = 'none'
        pdiv.style.display = 'block'
        wdiv.style.display = 'none'
        $.ajax({
            url : '/setting/sentmessage',
            type : 'GET',
            data : null, // Request body
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            success : function(response) {
                //请求成功
                var table = document.getElementById("sentTable");
                table.innerHTML = "<tr>\n" +
                    "                <td>#</td>\n" +
                    "                <td>内容</td>\n" +
                    "                <td>收件人</td>\n" +
                    "                <td>发件时间</td>\n" +
                    "            </tr>"
                for (x = 0; x < response["sentMessage"].length; x++) {
                    message = response["sentMessage"][x];
                    console.log(message);
                    table.innerHTML += "<tr><td>" + (x + 1) +"</td>" +
                        "<td>" + message["content"] +"</td>" +
                        "<td>" + message["receiver"] + "</td>" +
                        "<td>" + message["time"] + "</td>" +
                        "</tr>";
                }
                document.getElementById("sentMessageNum").innerText = x;
            },
            error : function(msg) {
            }
        });
    }

    receiveMessage();

    rl.onclick = receiveMessage
    pl.onclick = sendMessage
    wl.onclick = function (e) {
        rl.className = ''
        pl.className = ''
        wl.className = 'active'
        rdiv.style.display = 'none'
        pdiv.style.display = 'none'
        wdiv.style.display = 'block'
    }
</script>

<script type="text/javascript">

    function userInfo() {
        $.ajax({
            url : '/setting/userInfo',
            type : 'GET',
            data : null, // Request body
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            success : function(response) {
                //请求成功
                document.getElementById("username").innerHTML = response["username"];
                document.getElementById("email").innerHTML = response["email"];
                document.getElementById("phone").innerHTML = response["phone"];
                document.getElementById("credit").innerHTML = response["credit"];
                document.getElementById("degree").innerHTML = response["degree"];
                document.getElementById("bar").setAttribute("aria-valuenow", response["exp"]);
                document.getElementById("bar").setAttribute("aria-valuemax", response["maxExp"]);
            },
            error : function(msg) {
            }
        });
    }

    function updateInfo() {
        $.ajax({
            url : '/setting/updateInfo',
            type : 'GET',
            data : null, // Request body
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            success : function(response) {
                //请求成功
                document.getElementById("updateUserName").value = response["username"];
                document.getElementById("updateEmail").value = response["email"];
            },
            error : function(msg) {
            }
        });
    }

    function updateUserNameF() {
        var v = document.getElementById("updateUserName").value;
        $.ajax({
            url : '/setting/unCh',
            type : 'POST',
            data : JSON.stringify({"username" : v}), // Request body
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            success : function(response) {
                //请求成功
               if(response["errorInfo"] == null){
                   window.alert(response["username"] + response["info"]);
               }else{
                   window.alert(response["errorInfo"]);
               }
            },
            error : function(msg) {
            }
        });
    }

    function updateEmailF() {
        var v = document.getElementById("updateEmail").value;
        $.ajax({
            url : '/setting/emCh',
            type : 'POST',
            data : JSON.stringify({"email" : v}), // Request body
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            success : function(response) {
                //请求成功
                if(response["errorInfo"] == null){
                    window.alert(response["info"]);
                }else{
                    window.alert(response["errorInfo"]);
                }
            },
            error : function(msg) {
            }
        });
    }

    function updatePasswordF() {
        var v1= document.getElementById("oldPw").value;
        var v2 = document.getElementById("newPw").value;
        var v3 = document.getElementById("newPwConf").value;
        $.ajax({
            url : '/setting/pwCh',
            type : 'POST',
            data : JSON.stringify({ "oldPw":v1, "newPw":v2, "newPwConf":v3 }), // Request body
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            success : function(response) {
                //请求成功
                if(response["errorInfo"] == null){
                    window.alert(response["info"]);
                }else{
                    window.alert(response["errorInfo"]);
                }
            },
            error : function(msg) {
            }
        });
    }

    function topUp(val){
        $.ajax({
            url : '/setting/topup',
            type : 'POST',
            data : JSON.stringify({"price":val}), // Request body
            // Request body
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            success : function(response) {
                //请求成功
                if(response["errorInfo"] == null){
                    window.alert(response["info"]);
                }else{
                    window.alert(response["errorInfo"]);
                }
            },
            error : function(msg) {
            }
        });
    }

    function topUPDiy(){
        var v = document.getElementById("number").value;
        $.ajax({
            url : '/setting/topup',
            type : 'POST',
            data : JSON.stringify({"price":v}), // Request body
            // Request body
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            success : function(response) {
                //请求成功
                if(response["errorInfo"] == null){
                    window.alert(response["info"]);
                }else{
                    window.alert(response["errorInfo"]);
                }
            },
            error : function(msg) {
            }
        });
    }

    function apply(){
        var data = {
            "identity" : document.getElementById("identity").value,
            "title" : document.getElementById("title").value,
            "instituteId" : document.getElementById("instituteId").value
        }
        $.ajax({
            url : '/apply',
            type : 'POST',
            data : JSON.stringify(data), // Request body
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            success : function(response) {
                //请求成功
                if (response['errorInfo'] == null) {
                    alert(response['info']);
                    document.getElementById("identity").value = null
                    document.getElementById("title").value = null
                } else {
                    alert(response['errorInfo']);
                }
            }
        });
    }


    function sendMessage() {
        var data = {
            "content": document.getElementById("content").value,
            "receiverName": document.getElementById("receiverName").value
        }
        $.ajax({
            url : '/setting/sendmessage',
            type : 'POST',
            data : JSON.stringify(data), // Request body
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            success : function(response) {
                //请求成功
                if (response['errorInfo'] == null) {
                    alert(response['info']);
                    document.getElementById("content").value = null
                    document.getElementById("receiverName").value = null
                } else {
                    alert(response['errorInfo']);
                }
            }
        });
        return false;
    }
</script>
</html>