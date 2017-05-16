<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<HTML>
  <head>
    <meta charset="utf-8">
    <title>我的订单</title>
    <link href="css/bootstrap.min.css"  rel="stylesheet"/>
    <link href="css/bootstrap-theme.min.css" rel="stylesheet"/>
    <link href="css/theme.css" rel="stylesheet">
    <script src="js/one.js"></script>
    <style>
      

     .cancel {
       cursor: pointer;
     }
     #cancel_order_message{
	    background: rgba(20,20,20,1);
	    position: fixed;
	    width:30%;
	    height:50px;
	    text-align: center;
	    font-size:20px;
	    left:35%;
	    top:55%;
	    z-index:1000;
	    color:white;
	    line-height:660px;
	    display: none;
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
        <div id="cancel_order_message"></div>
        <div class="row col-sm-12" style="margin-bottom: 30px;">
          <div class="col-sm-1"></div>
          <div class="col-sm-10">
            <div>
		          <ol class="breadcrumb" style="background-color: transparent;margin: 0px;padding: 0px;">
		            <li><a href="UserAction_show">个人中心</a></li>
		            <li class="active">捐赠记录</li>
		          </ol>
            </div>
            <div class="row col-sm-12" style="border-bottom:1px solid #e4e4e4;padding:10px;font-size:20px;"> 
              我的捐赠记录   
            </div>
            <c:forEach items="${orders}" var="order" varStatus="order_status">
              <c:forEach items="${items }" var="item" varStatus="item_status">
                <c:if test="${item_status.count eq order_status.count}">
                  <div class="col-sm-12 row orders" style="margin: 10px;border:1px dashed transparent;">
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
		                       <c:when test="${order.status==0 }">
			                       订单已取消
			                     </c:when>
		                       <c:otherwise>
		                         。。
		                       </c:otherwise>
		                    </c:choose>
		                  </div>
		                </div>
		                <div class="row col-sm-12" style="font-size: 15px;padding-bottom:10px;">
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
		                       <a class="cancel" value="${order.id }">取消订单</a>
		                     </c:when>
		                     <c:when test="${order.status==3 }">
		                       <a href="">填写快递单号</a> &nbsp; &nbsp;<a class="cancel" value="${order.id }">取消订单</a>
		                     </c:when>
		                     <c:when test="${order.status==8 }">
		                       <a href="EvaluateServlet?method=evaluate&id=${order.id}">评价</a>
		                     </c:when>
		                     <c:when test="${order.status==9 }">
		                       <a href="EvaluateServlet?method=showevaluate&order_id=${order.id}">查看评价</a>
		                     </c:when>
		                    </c:choose>
		                  </div>
		                </div>
		              </div>
                </c:if>
              </c:forEach>
            </c:forEach>
            <div class="row col-sm-12">
              <div class="col-sm-3"></div>
              <div class="col-sm-2" style="text-align: center;">
              <c:if test="${page>1}">
                <a href="OrderServlet?method=myOrders&user_id=${user.id}&page=${page-1}">上一页</a>
              </c:if>
              </div>
              <div class="col-sm-2"></div>
              <div class="col-sm-2" style="text-align: center;">
	              <c:if test="${page<pageamount}">
	                <a href="OrderServlet?method=myOrders&user_id=${user.id}&page=${page+1}">下一页</a>
	              </c:if>
              <div class="col-sm-3">
              
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
        $(".orders").mouseover(function(){
        	$(this).css({"border":"1px dashed #e4e4e4"});
        })
        $(".orders").mouseout(function(){
          $(this).css({"border":"1px dashed transparent"});
        });
        $(".cancel").click(function(){
          var order_id=$(this).attr("value");
          alert(order_id);
          $.post (
            'OrderServlet',
            {method:'cancelOrder',order_id:order_id},
            function(data) {
              if(data=="true") {
                $("#cancel_order_message").html("<span class='glyphicon glyphicon-ok-circle'>订单已成功取消</span>");
                $("#cancel_order_message").css({"display":"block"});
                setTimeout(function(){
                  window.location.reload();
                },1000);
              }else {
                $("#cancel_order_message").html("<span class='glyphicon glyphicon-ok-circle'>出现异常，请稍后重试</span>");
                  $("#cancel_order_message").css({"display":"block"});
                  setTimeout(function(){
                    $("#cancel_order_message").css({"display":"none"});
                  },1000);
              }
            }
          );
        });
      });
    </script>
    <script src="js/bootstrap.min.js"   ></script>
    <script src="js/view.js"  ></script>
    <script src="js/npm.js"   ></script>  
  </body>

</HTML>