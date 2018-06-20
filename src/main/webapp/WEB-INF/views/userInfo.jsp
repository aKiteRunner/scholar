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
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<ul class="nav nav-pills nav-stacked" id="Navibar" style="float: left; width: 8%;">
    <a href="#a" class="active" onclick="userinfo()">个人信息</a>
    <a href="#b">修改信息</a>
    <a href="#c">积分充值</a>
    <a href="#d">站内信</a>
    <!-- <li role="presentation" class="active"><a href="#a" >个人信息</a></li> -->
</ul>
<div class="container" id="a">

    <div class="page-header" style="margin-top: 0px;">
        <h1 style="margin-top: 0px;">个人信息</h1>
    </div>

    <p id="Hello">你好，<strong class="text-danger">${username}</strong></p>

    <h3 class="infoTitle">邮箱</h3>
    <p class="infoDetail">${email}</p>

    <h3 class="infoTitle">手机</h3>
    <p class="infoDetail">${phone}</p>

    <h3 class="infoTitle">积分</h3>
    <p class="infoDetail">${credit}</p>

    <h3 class="infoTitle">等级</h3>
    <p class="infoDetail">${degree} 距离升级还需要<strong class="text-danger">${exp}</strong>积分</p>
    <div class="progress" style="width:200px;">
        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
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
            <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-4">
                <input class="form-control" id="inputEmail3" value="科林麦克兰莫">
            </div>
        </div>
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
            <div class="col-sm-4">
                <input type="email" class="form-control" id="inputEmail3" value="fuckqq@qq.com">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">原密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="inputPassword3">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">新密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="inputPassword3">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">确认新密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="inputPassword3">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-4">
                <button type="submit" class="btn btn-default" data-dismiss="alert" onclick="$().alert()">保存更改</button>
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
            <h5>充值10积分</h5>
            <p>您仅需￥10，即可获得10积分</p>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="co-top">
        <div class="co-le1">
            <img src="/static/images/1.jpg" class="img-responsive" alt="">
        </div>
        <div class="co-rg1">
            <h5>充值20积分</h5>
            <p>您仅需￥20，即可获得20积分</p>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="co-top">
        <div class="co-le1">
            <img src="/static/images/1.jpg" class="img-responsive" alt="">
        </div>
        <div class="co-rg1">
            <h5>充值50积分</h5>
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
        <p class="panel-heading" style="font-size: 13px;">共<strong class="text-danger">3</strong>封站内信</p>

        <!-- Table -->
        <table class="table">
            <tr>
                <td>#</td>
                <td>标题</td>
                <td>发件人</td>
                <td>发件时间</td>
            </tr>
            <tr>
                <td>1</td>
                <td><a href="#">澳门皇家赌场</a></td>
                <td>fuck360@qq.com</td>
                <td>2018-06-05</td>
            </tr>
        </table>
    </div>

    <div class="panel panel-default" id="postedLetter">
        <!-- Default panel contents -->
        <p class="panel-heading" style="font-size: 13px;">已发送<strong class="text-danger">3</strong>封站内信</p>

        <!-- Table -->
        <table class="table">
            <tr>
                <td>#</td>
                <td>标题</td>
                <td>收件人</td>
                <td>发件时间</td>
            </tr>
            <tr>
                <td>1</td>
                <td><a href="#">澳门皇家赌场</a></td>
                <td>fuck360@qq.com</td>
                <td>2018-06-05</td>
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
    rl.onclick = function (e) {
        rl.className = 'active'
        pl.className = ''
        wl.className = ''
        rdiv.style.display = 'block'
        pdiv.style.display = 'none'
        wdiv.style.display = 'none'

    }
    pl.onclick = function (e) {
        rl.className = ''
        pl.className = 'active'
        wl.className = ''
        rdiv.style.display = 'none'
        pdiv.style.display = 'block'
        wdiv.style.display = 'none'
    }
    wl.onclick = function (e) {
        rl.className = ''
        pl.className = ''
        wl.className = 'active'
        rdiv.style.display = 'none'
        pdiv.style.display = 'none'
        wdiv.style.display = 'block'
    }
</script>
<script>
function userinfo() {
    alert("fuckyou");
}
</script>
</html>