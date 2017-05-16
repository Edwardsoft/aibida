<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<HTML>
  <head>
    <meta charset="utf-8">
    <title>订单确认</title>
    <link href="css/bootstrap.min.css"  rel="stylesheet"/>
    <link href="css/bootstrap-theme.min.css" rel="stylesheet"/>
    <link href="css/theme.css" rel="stylesheet">
    <script src="js/one.js"></script>
    <style>
      

      .navbar {
        margin-bottom: 20px;
      }
      .lunbo {
        border: 1px solid #e4e4e4;
      }
      .imgs{
        width: 100%;
        float:left;
      }
      #aixinbang {
        padding: 20px;
        margin-bottom: 30px;
      }
      .head {
        border-bottom: 1px solid #e4e4e4;
        font-size:25px;
        line-height: 35px;
      }
      .head span {  
        border-bottom: 3px solid orange;
      }
      .tiaomu {
        line-height: 25px;
        border-bottom: 1px dashed #e4e4e4;
      }
      .more {
        position: absolute;
        font-size: 15px;
        right:30px;
      }
      .left .news {
        margin-bottom: 30px;
        padding: 30px;
      }
      .news {
        border:1px solid #e4e4e4;
      }
      .title {
        text-align: center;
        font-size:23px;
        line-height: 40px;
      }
      .small-title {
        text-align: center;
        font-size:13px;
      }
      .img {
        margin-top: 15px;
        margin-bottom: 15px;
      }
      .img img {
        max-width: 100%;
      }
      .description {
        text-indent: 2em;
      }
      .quanwen {
        position: relative;
        background-color: pink;
        border-radius: 5px;
        width: 100px;
        height: 40px;
        line-height: 40px;
        text-align: center;
        cursor: pointer;
        color: white; 
        margin-top: 20px;
      }
      .fixed {
        position: fixed;
      }
      .lunbo {
        padding: 0px;
        margin-bottom: 30px;
      }
      #points {
        position: relative;
        bottom: 20px;
      }
      .point {
        float: left;
        z-index: 5;
        width: 20px;
        height: 2 0px;
        background-color: gray;
        border: 1px solid white;
        border-radius: 5px;
        margin-right: 10px;
        margin-left: 10px;
        cursor: pointer;
      }
      #p1 {
        background-color: green;
      }
      body {
        font-family: 微软雅黑;
      }
    </style>
  </head>
  
  <body>
      <div class="container">

  <%@ include file="head.jsp" %>
<script src="js/jquery-3.1.0.min.js"></script>
<script>
  $(document).ready(function(){
    $("#gerenzhongxin").click(function(){
      if(false) {
        alert("您还未登录，请先登录再进行查看！");
        location.href="login";
      }
    });
  });
</script>
        订单已完成
       
      </div>
    <%@ include file="foot.jsp" %>
    <script src="js/jquery-3.1.0.min.js"></script>
    <script>

    </script>
    <script src="js/bootstrap.min.js"   ></script>
    <script src="js/view.js"  ></script>
    <script src="js/npm.js"   ></script>  
  </body>

</HTML>