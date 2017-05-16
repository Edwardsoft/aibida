<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<HTML>
  <head>
    <meta charset="utf-8">
    
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
		    padding-top: 20px;
		    padding-bottom: 20px;
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
        <div class="row">
        <div class="col-sm-8 left">
          <div id="carousel-example-generic" class="carousel slide lunbo" data-ride="carousel">
              <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
              </ol>
              <div class="carousel-inner" role="listbox">
                <div class="item active">
                  <img src="img/7.jpg" alt="First slide" class="imgs">
                </div>
                <div class="item">
                  <img src="img/8.jpg" alt="Second slide"  class="imgs">
                </div>
                <div class="item">
                  <img src="img/9.jpg" alt="Third slide"  class="imgs">
                </div>
              </div>
              <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
           <div class="news">
            <div class="title">最美儿童村，最暖华城情</div>
            <div class="small-title">作者：王赛 • 2016年8月24日</div>
            <div class="img"><img src="img/1.jpg"></div>
            <div class="description">10月15日上午，共青团南昌市委、南昌市青少年发展基金会联合江西华城建设投资集团有限公司、江西省爱心公益志愿者协会、江西华城实业控股有限公司在南昌SOS儿童村开展了“最美儿童村、最暖华城情“大型爱心公益活动，为儿童村的孩子们捐赠了价值五万元的爱心物资，其中包括食用油、自行车等物资。</div>
            <div class="quanwen">阅读全文</div>
          </div>

           <div class="news">
            <div class="title">南昌市公益组织税务管理研讨培训班顺利开展</div>
            <div class="small-title">作者：王赛 • 2016年7月28日</div>
            <div class="img"><img src="img/2.jpg"></div>
            <div class="description">为规范南昌市公益组织健康有序发展，引导公益组织做好机构税务管理，7月20日晚，南昌市民政局、南昌市妇女联合会、南昌市青少年发展基金会、爱益公益、佳和服务社联合在市妇女儿童活动中心会议室举行了南昌市公益组织税务管理研讨培训班，南昌市20多家公益组织的近30人参加研讨会。</div>
            <div class="quanwen">阅读全文</div>
          </div>
      
        </div>
        <div class="col-sm-4" style="background-color:white;">
          <div class="fixed">
            <div style="border:1px solid #e4e4e4" id="aixinbang">
              <div class="head"><span>爱心榜 &nbsp; &nbsp; &nbsp;</span><a href="" class="more">更多</a></div>
              <div class="content">
                <div class="tiaomu"><a href="">个人积分排行总榜</a></div>
                <div class="tiaomu"><a href="">本月个人积分增长排行榜</a></div>
                <div class="tiaomu"><a href="">本月个人捐赠次数排行榜</a></div>
                <div class="tiaomu"><a href="">本月各组织受捐额排行榜</a></div>
                <div class="tiaomu"><a href="">11月个人积分增长榜</a></div>
                <div class="tiaomu"><a href="">11月个人积分增长榜</a></div>
              </div>
            </div>
            <div style="border:1px solid #e4e4e4" id="aixinbang">
              <div class="head"><span>我要捐赠 &nbsp; &nbsp;</span><a href="" class="more">更多</a></div>
              <div class="content">
                <div class="tiaomu"><a href="">捐助希望工程</a></div>
                <div class="tiaomu"><a href="">捐助彩虹工程</a></div>
                <div class="tiaomu"><a href="">捐助“亲亲宝贝”大重病贫困儿童救助</a></div>
                <div class="tiaomu"><a href="">捐助“青宝贝” 孤儿及单亲被遗弃儿童</a></div>
                <div class="tiaomu"><a href="">捐助“青果援”关爱服刑在教人员子女成</a></div>
                <div class="tiaomu"><a href="">捐助“善二代”计划</a></div>
              </div>
            </div>
          </div>
        </div>
        </div>

       
      </div>
    <%@ include file="foot.jsp" %>
    <script src="js/jquery-3.1.0.min.js"></script>
    <script>
      $(document).ready(function(){
    	  $("#home").addClass("active");
        $(window).scroll(function(){
          var top=$(window).scrollTop();
          var foot=$(document).height()-$(window).height()-$(window).scrollTop();
          if(top<=62||foot<=350) {
            $(".fixed").css({"position":"static"});
          }else {
            $(".fixed").css({"position":"fixed"});
            $(".fixed").css({"top":"40px"});
          }
        });
      });
    </script>
    <script src="js/bootstrap.min.js"   ></script>
    <script src="js/view.js"  ></script>
    <script src="js/npm.js"   ></script>  
  </body>

</HTML>