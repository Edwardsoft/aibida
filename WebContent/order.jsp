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
	      <div class="row col-sm-12" style="margin-bottom: 30px;">
			    <div class="col-sm-1"></div>
			    <div class="col-sm-10">
			      <div class="row col-sm-12" style="border-bottom:1px solid #e4e4e4;padding:10px;font-size:20px;"> 
			        订单详情     
			      </div>
			      <div class="row col-sm-12" style="font-size: 16px;padding:10px;">
			        <div class="col-sm-4">
                时间：${order.insert_time}
              </div>
			        <div class="col-sm-3">
                <div>项目：${item.name}</div>
              </div>
              <div class="col-sm-3">状态：
                <c:choose>
	                 <c:when test="${order.status==1 }">
	                   等待上门
	                 </c:when>
	                 <c:when test="${order.status==3 }">
	                   等待填写快递单号
	                 </c:when>
	                 <c:when test="${order.status==8 }">
	                   等待评价
	                 </c:when>
	                 <c:when test="${order.status==9 }">
	                   已完成
	                 </c:when>
	                 <c:otherwise>
	                   。。
	                 </c:otherwise>
                </c:choose>
              </div>
			      </div>
			      <div class="row col-sm-12" style="font-size: 15px;">
			        <div class="col-sm-3">
                <div>姓名：${order.name}</div>
              </div>
              <div class="col-sm-3">
                <div>联系方式：${order.telephone}</div>
              </div>
              <div class="col-sm-3">
                <div>地址：${order.address}</div>
              </div>
			        <div class="col-sm-3">
			          <c:choose>
                 <c:when test="${order.status==1 }">
                   <a href="">取消订单</a>
                 </c:when>
                 <c:when test="${order.status==3 }">
                   <a href="">填写快递单号</a> &nbsp; &nbsp;<a href="">取消订单</a>
                 </c:when>
                 <c:when test="${order.status==8 }">
                   <a href="EvaluateServlet?method=evaluate&id=${order.id}">评价</a>
                 </c:when>
                 <c:when test="${order.status==9 }">
                   <a href="EvaluateServlet?method=evaluate&id=${order.id}">查看评价</a>
                 </c:when>
                </c:choose>
			        </div>
			      </div>
			  </div>
      </div>
    </div>
    <%@ include file="foot.jsp" %>
    <script src="js/jquery-3.1.0.min.js"></script>
    <script>
      $(document).ready(function(){
       
      });
    </script>
    <script src="js/bootstrap.min.js"   ></script>
    <script src="js/view.js"  ></script>
    <script src="js/npm.js"   ></script>  
  </body>

</HTML>