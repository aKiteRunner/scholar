<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false" %>
<%
  //    以斜线开始，不以斜线结束(例如/crud)
  pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Main</title>
    <link rel="stylesheet" type="text/css" href="static/css/style.css?v=1324">
    <!-- Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <h1></h1>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <ul class="nav nav-pills nav-stacked" id="Navibar" style="float: left; width: 8%;">
        <a href="#a" class="active" >审批站内信</a>
    </ul>
      <div class="container" id="a">
        <div class="page-header" style="margin-top: 0px;">
            <h1 style="margin-top: 0px;">审批站内信</h1>
        </div>
        <div class="panel panel-default" id="receivedLetter" >
          <!-- Default panel contents -->
          <p class="panel-heading" style="font-size: 13px;">共<strong class="text-danger">${fn:length(application)}</strong>封待审批站内信</p>
        
          <!-- Table -->
          <table class="table">
            <tr>
              <td>#</td>
              <td>用户id</td>
              <td>机构名称</td>
              <td>头衔</td>
              <td>内容</td>
              <td>是否通过审核</td>
            </tr>

            <c:forEach var="app" items="${applications}">
            <tr class="approve">
              <td>${app.id}</td>
              <td>${app.userId}</td>
              <c:forEach var="institute" items="${institutes}">
                <c:if test="${ institute.id == app.instituteId}">
                <td>${institute.name}</td>
                </c:if>
              </c:forEach>
              <td>${app.title}</td>
              <td>${app.identity}</td>
              <td>
                <button class="btn btn-default" type="submit" style="height: 34px;" onclick="pass(${app.id})">通过</button>
                <button class="btn btn-default" type="submit" onclick="unpass(${app.id})">不通过</button>
              </td>
            </tr>
            </c:forEach>

          </table>
        </div>
      </div> <!-- /container -->


  </body>
  <script>
      var nav=document.getElementById('Navibar') 
      nav.onclick=function (e)
      {
          var children=nav.children
          for(var i=0;i<1;i++)
          {
            children[i].className=''
          }
          e.target.className='active'
      }

      function pass(id) {
          $.post("/admin/checkapplication", { approve: true, applicationId: id } );
          window.location.href='/admin/application';
      }

      function unpass(id){
          $.post("/admin/checkapplication", { approve: false, applicationId: id } );
          window.location.href='/admin/application';
  }
     
  </script>
</html>