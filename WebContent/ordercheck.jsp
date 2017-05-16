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
        <div class="row col-sm-12">
          <div class="col-sm-1"></div>
          <div class="col-sm-5">
                <div class="row col-sm-12" style="border-bottom:1px solid #e4e4e4;font-size:22px;">
                 订单详情
                </div>
                <div class="row col-sm-12">
                  <table class="table table-hover">
                    <tr><td>物品</td><td>数量</td></tr>
                    <c:forEach items="${items}" var="item">
                      <tr><td>${item.name}</td><td>${item.amount}</td></tr>
                    </c:forEach>
                  </table>
                </div>
                <div class="row col-sm-12" style="border-bottom:1px solid #e4e4e4;font-size:18px;">
                  配送方式
                </div>
                <div class="row col-sm-12">
                  <c:choose>
                    <c:when test="${type eq '1' }">
                      工作人员上门验收
                    </c:when>
                    <c:when test="${type eq '2' }">
                      邮寄至最佳救助点
                    </c:when>
                    <c:otherwise>
                      送至附近的救助点
                    </c:otherwise>
                  </c:choose>
                </div>
            
            
            
          </div>
          <div class="col-sm-5">
            <c:choose>
              <c:when test="${type eq '1' }">
                <div class="row col-sm-12" style="border-bottom:1px solid #e4e4e4;font-size:22px;">
		             订单提交
		            </div>
		            <div>
		              <div class="row col-sm-12">
		                  请在下表填写您的联系方式
		              </div>
		              <div class="row col-sm-12">
		                <div class="col-sm-4">姓名</div>
		                <div class="col-sm-2"><input type="text" name="name"></div>
		              </div>
		              <div class="row col-sm-12">
                    <div class="col-sm-4">手机号</div>
                    <div class="col-sm-2"><input type="text" name="telephone"></div>
                  </div>
                  <div class="row col-sm-12">
                    <div class="col-sm-4">住址</div>
                    <div class="col-sm-2"><textarea rows="3" cols="30" id="address"></textarea>
                  </div>
                  <div class="row col-sm-12">
                    <div class="col-sm-4" style="cursor:pointer; border: 1px solid #e4e4e4;text-align: center;" id="submit_order">确认提交</div>
                  </div>
		            </div>
              </c:when>
              <c:when test="${type eq '2' }">
                <div class="row col-sm-12" style="border-bottom:1px solid #e4e4e4;font-size:22px;">
                 收件人信息
                </div>
                <div class="col-sm-12">
                  请在7天内将捐赠物品快递救助点，逾期订单将取消，收件人信息如下：
                </div>
                <div class="row col-sm-12">
                  <div class="col-sm-3">姓名</div>
                  <div class="col-sm-9">${project.name }</div>
                </div>
                <div>
                  <div class="col-sm-3">地址</div>
                  <div class="col-sm-9">${project.address }</div>
                </div>
              </c:when>
              <c:otherwise>
                
              </c:otherwise>
            </c:choose>
            
            
            
          </div>
          
          <div class="col-sm-1"></div>
        </div>
       
      </div>
    <%@ include file="foot.jsp" %>
    <script src="js/jquery-3.1.0.min.js"></script>
    <script>
      $(document).ready(function(){
    	  $("#submit_order").click(function(){
    		  var name=$("input[name='name']").val();
    		  var telephone=$("input[name='telephone']").val();
    		  var address=$("#address").val();
    		  alert(address);
    		  location.href="Order_submitOrder?name="+name+"&telephone="+telephone+"&address="+address;
    	  });
      });
    </script>
    <script src="js/bootstrap.min.js"   ></script>
    <script src="js/view.js"  ></script>
    <script src="js/npm.js"   ></script>  
  </body>

</HTML>