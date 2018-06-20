<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Main</title>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css?v=1324">
    <!-- Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<h1></h1>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<ul class="nav nav-pills nav-stacked" id="Navibar" style="float: left; width: 8%;">
    <a href="#a" class="active" onclick="userInfo()">个人信息</a>
    <a href="#b" onclick="updateInfo()">修改信息</a>
    <a href="#c">积分充值</a>
    <a href="#d">站内信</a>
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
    <div class="progress" style="width:200px;">
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
        <div class="form-group">
            <label for="updateUserName" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-3">
                <input class="form-control" id="updateUserName">
            </div>
            <div class="col-sm-3">
                <button class="btn btn-default" onclick="updateUserNameF()">更改昵称</button>
            </div>
        </div>
        <div class="form-group">
            <label for="updateEmail" class="col-sm-2 control-label">Email</label>
            <div class="col-sm-3">
                <input type="email" class="form-control" id="updateEmail">
            </div>
            <div class="col-sm-2">
                <button type="submit" class="btn btn-default" data-dismiss="alert" onclick="updateEmailF()">更改邮箱</button>
            </div>
        </div>
        <div class="form-group">
            <label for="oldPw" class="col-sm-2 control-label">原密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="oldPw">
            </div>
        </div>
        <div class="form-group">
            <label for="newPw" class="col-sm-2 control-label">新密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="newPw">
            </div>
        </div>
        <div class="form-group">
            <label for="newPwConf" class="col-sm-2 control-label">确认新密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="newPwConf">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-4">
                <button type="submit" class="btn btn-default" data-dismiss="alert" onclick="updatePasswordF()">更改密码</button>
            </div>
        </div>
    </form>


</div> <!-- /container -->
<div class="container" id="c">

    <div class="page-header" style="margin-top: 0px;">
        <h1 style="margin-top: 0px;">积分充值</h1>
    </div>
    <div class="co-top">
        <div class="co-le1">
            <img src="/static/images/1.jpg" class="img-responsive" alt="">
        </div>
        <div class="co-rg1">
            <h5><a onclick="topUp(10)">充值10积分</a></h5>
            <p>您仅需￥10，即可获得10积分</p>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="co-top">
        <div class="co-le1">
            <img src="/static/images/1.jpg" class="img-responsive" alt="">
        </div>
        <div class="co-rg1">
            <h5><a onclick="topUp(20)">充值20积分</a></h5>
            <p>您仅需￥20，即可获得20积分</p>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="co-top">
        <div class="co-le1">
            <img src="/static/images/1.jpg" class="img-responsive" alt="">
        </div>
        <div class="co-rg1">
            <h5><a onclick="topUp(50)">充值50积分</a></h5>
            <p>您仅需￥50，即可获得50积分</p>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="co-top">
        <div class="co-le1">
            <img src="/static/images/1.jpg" class="img-responsive" alt="">
        </div>
        <div class="co-rg1">
            <h5>自选充值金额</h5>
            <form class="form-inline">
                <div class="form-group">
                    <p class="recharge">充值
                        <input type="number" class="form-control" placeholder="100" style="width: 80px;">
                        元</p>
                </div>
                <button type="submit" class="btn btn-default" style="margin-left: 20px;">确定</button>
            </form>
        </div>
        <div class="clearfix"></div>
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

    <div class="panel panel-default" id="writeLetter">
        <form class="form-inline" style="margin-top: 10px; margin-bottom: 10px;">
            <div class="form-group">
                <label for="exampleInputName2">收件人</label>
                <input type="text" class="form-control" id="exampleInputName2">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">标题</label>
                <input type="text" class="form-control" id="exampleInputEmail2">
            </div>
            <button type="submit" class="btn btn-default">发送</button>
        </form>
        <textarea class="form-control" rows="10"></textarea>
    </div>

</div> <!-- /container -->


</body>
<script>
    var nav = document.getElementById('Navibar')
    nav.onclick = function (e) {
        var children = nav.children
        for (var i = 0; i < 4; i++) {
            children[i].className = ''
        }
        e.target.className = 'active'
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



</script>
</html>