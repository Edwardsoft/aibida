<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<HTML>
  <head>
    <meta charset="utf-8">
    <title>捐赠</title>
    <link href="css/bootstrap.min.css"  rel="stylesheet"/>
    <link href="css/bootstrap-theme.min.css" rel="stylesheet"/>
    <link href="css/theme.css" rel="stylesheet">
    <script src="js/one.js"></script>
    <style>
      .n1 {
        padding:0px 10px;
      }
      a.actived:link {
        color:black;
        text-decoration: none;
      }
      a.actived:visited {
        color:black;
      }
      a.actived:hover {
        color:black;
      }
      a.actived:active{
        color:black;
      }
      .head {
        font-size: 15px;
      }
    </style>
  </head>
  
  <body>
    <div class="container">
      <%@ include file="head.jsp" %>
	    <div class="row">
	      <div class="col-sm-1"></div>
	      <div class="col-sm-10">
	        <div class="row col-sm-12 head" style="margin:10px 0px;">
			      <div class="col-sm-1">分类：</div>
			      <div class="col-sm-10">
			        <a href="" class="n1 actived" >全部</a><span>|</span><a href="" class="n1">捐钱</a><span>|</span><a href="" class="n1">捐物</a>
			      </div>
			    </div>
			    <div class="row col-sm-12 head" style="border-bottom: 1px dashed #e4e4e4;margin:10px 0px;padding-bottom: 10px;">
			      <div class="col-sm-1">排序：</div>
			      <div class="col-sm-11">
			        <a href="" class="n1 actived">综合</a><span>|</span><a href="" class="n1">发布时间<span class="glyphicon glyphicon-arrow-down"></span></a><span>|</span><a href="" class="n1">截止时间<span class="glyphicon glyphicon-arrow-down"></span></a>
			      </div>
			    </div>
			    <c:forEach items="${projects}" var="project">
			      <div class="col-sm-4"><a href="Donate_show?method=getproject&id=${project.id}"><img alt="" src="${project.img}" width="100%;"></a><br/><a href="">${project.name }</a></div>
			    </c:forEach>
	      </div>
	      <div class="col-sm-1"></div>
	    </div>
    </div>
    <%@ include file="foot.jsp" %>
    <script src="js/jquery-3.1.0.min.js"></script>
    <script>
      $(document).ready(function(){
    	  $("#donate").addClass("active");
      });
    </script>
    <script src="js/bootstrap.min.js"   ></script>
    <script src="js/view.js"  ></script>
    <script src="js/npm.js"   ></script>  
  </body>

</HTML>