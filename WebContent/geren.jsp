<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="css/amazeui.flat.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/theme.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-3.1.0.min.js" ></script>
<script type="text/javascript">

</script>
<style type="text/css">
	a:link {color:black;text-decoration: none;}
	a:visited {color: black;}
	a:hover {color: orange}
	a:active {color: #0000FF}
	
	.cancel {
	  cursor:pointer;
	}
	
	#cancel_order_message{
    background: rgba(20,20,20,1);
    position: fixed;
    width:30%;
    height:60px;
    text-align: center;
    font-size:20px;
    left:35%;
    top:55%;
    z-index:1000;
    color:white;
    line-height:55px;
    display: none;
  }
</style>
<title>我的主页</title>
</head>
<body>
  <div id="cancel_order_message">
    
  </div>
	<div class="container">
	  <%@ include file="head.jsp" %>
    <div>
     <div class="row">
       <div class="col-sm-1"></div>   
       <div class="col-sm-2"><img src="${user.avatar}" style="width: 100%;"></div>  
       <div class="col-sm-8" style="padding:10px;">
	       <div class="row"  style="border-bottom:1px solid #e4e4e4;padding:5px;font-size: 20px;">
	         <div class="col-sm-6">
	          ${user.userName }
	         </div>
	         <div class="col-sm-6" style="  text-align: right;font-size:14px;">
	           <a href="gerensetup">编辑个人信息</a>
	         </div>
	       </div>
	       <div class="row" style="padding:10px;">
	         <div class="col-sm-2">邮箱：</div>
	         <div class="col-sm-3">${user.email }</div>
	         <c:choose>
	           <c:when test="${user.isCheck==0}">
	             <div class="col-sm-2"><a href="UserAction_checkEmail">立即验证邮箱</a></div>
	           </c:when>
	         </c:choose>
	         
	         <div class="col-sm-3"><a href="">修改绑定邮箱</a></div>
	       </div>
	       <div class="row" style="padding:10px;">
           <div class="col-sm-2">手机号：</div>
           <c:choose>
            <c:when test="${user.telephone eq ''}">
              <div class="cow-sm-3">${user.telephone }</div>
              <div class="cow-sm-3"><a href="">修改绑定手机</a></div>
            </c:when>
            <c:otherwise>
              <div class="col-sm-10"><a href="">立即绑定手机号</a></div>
            </c:otherwise>
           </c:choose>
         </div>
         <div class="row" style="padding:10px;">
           <div class="col-sm-2">社交网络：</div>
           <div class="col-sm-1"><a href="SocialLogin?type=qq" class="am-icon-qq" style="font-size: 20px;" title="立即绑定qq"></a></div>
           <div class="col-sm-1"><a href="SocialLogin?type=qq" class="am-icon-weixin" style="font-size: 20px;" title="立即绑定微信"></a></div>
           <div class="col-sm-1"><a href="SocialLogin?type=qq" class="am-icon-weibo" style="font-size: 20px;" title="立即绑定微博"></a></div>
         </div>
       </div>
     </div>
     <div class="row" style="margin-top:20px;">
        <div class="col-sm-1"></div>
        <div class="col-sm-10" style="border-top:1px solid #e4e4e4;">
          <div class="row col-sm-12" style="border-bottom:1px solid #e4e4e4;padding:10px;">
            <div class="col-sm-6">我的捐赠记录</div>
            <c:if test="${orders!=null }"><div class="col-sm-6" style="text-align: right;"><a href="OrderServlet?method=myOrders&user_id=${user.id}">更多>></a></div></c:if>
          </div>
          <c:choose>
            <c:when test="${orders==null }">
              <div class="row col-sm-12">暂无捐赠记录</div>
            </c:when>
            <c:otherwise>
              <table class="table table-hover" id="item_form">
                <tr style="border-top: none;">
                  <td>捐赠物品</td><td>捐赠时间</td><td>状态</td><td>详情</td>
                </tr>
                  <c:forEach items="${orders}" var="order" end="5">
                  
                    <tr><td>${order.item_id}</td><td>${order.insert_time}</td><td><c:choose>
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
                    </c:choose></td>
                    <td><a href="OrderServlet?method=show&id=${order.id}">查看详情</a></td>
                    <td>
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
                    </td>
                  </tr>
                  </c:forEach>
                
              </table>
 
            </c:otherwise>
          </c:choose>
          
        </div>
        <div class="col-sm-1"></div>
     </div>
     <div class="row" style="margin-top:20px;">
        <div class="col-sm-1"></div>
        <div class="col-sm-10" style="border-top:1px solid #e4e4e4;">
          <div class="row col-sm-12" style="border-bottom:1px solid #e4e4e4;padding:10px;">
            <div class="col-sm-6">我的志愿服务记录</div>
            <c:if test="${volunteerOrders!=null }"><div class="col-sm-6" style="text-align: right;"><a href="VlolunteerOrderServlet?method=myVlolunteerOrders&user_id=${user.id}">更多>></a></div></c:if>
          </div>
          <c:choose>
            <c:when test="${volunteerOrders==null }">
              <div class="row col-sm-12">暂无志愿服务记录</div>
            </c:when>
            <c:otherwise>
              <table class="table table-hover" id="item_form">
                <tr style="">
                  <td>id</td><td>报名时间</td><td>状态</td><td>姓名</td><td>详情</td>
                </tr>

              <c:forEach items="${volunteerOrders}" var="volunteerOrder">
                <tr style="border-top: none;">
                  <td>${volunteerOrder.project_id }</td>
                  <td>${volunteerOrder.insert_time }</td>
                  <td>
	                  <c:choose>
	                    <c:when test="${volunteerOrder.status==1}">
	                      进行中
	                    </c:when>
	                    <c:otherwise>
	                      已完成
	                    </c:otherwise>
	                  </c:choose>
                  </td>
                  <td>${volunteerOrder.name}</td>
                  <td><a href="">查看详情</a></td>
                </tr>
              </c:forEach>
              </table>
            </c:otherwise>
          </c:choose>
        </div>
        <div class="col-sm-1"></div>
     </div>
     <div class="row" style="margin-top:20px;">
        <div class="col-sm-1"></div>
        <div class="col-sm-10" style="border-top:1px solid #e4e4e4;">
          <div class="row col-sm-12" style="border-bottom:1px solid #e4e4e4;padding:10px;">
            <div class="col-sm-6">我的评价</div>
            <c:if test="${evaluates!=null }"><div class="col-sm-6" style="text-align: right;"><a href="EvaluateServlet?method=myEvaluates&user_id=${user.id}">更多>></a></div></c:if>

          </div>
          <c:choose>
            <c:when test="${evaluates==null}">
              您还没有评价
            </c:when>
            <c:otherwise>
              <div class="row col-sm-12">
                <div class="col-sm-2">评价号</div>
                <div class="col-sm-3">评价时间</div>
                <div class="col-sm-2">评分</div>
                <div class="col-sm-3">评价内容</div>
              </div>
              <div>
                <c:forEach items="${evaluates}" var="evaluate">
		                <div class="row col-sm-12">
		                  <div class="col-sm-2">${evaluate.id }</div>
		                  <div class="col-sm-3">${evaluate.insert_time }</div>
		                  <div class="col-sm-2" class="point">
		                    <c:forEach begin="1" end="${evaluate.point}">
		                      <span class="glyphicon glyphicon-star star" style="color:orange;"  ></span>
		                    </c:forEach>           		                    
		                  </div>
		                  <div class="col-sm-3">${evaluate.evaluation}</div>
		                </div>
                </c:forEach>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
        <div class="col-sm-1"></div>
     </div>
    </div>
    <div class="row" style="margin-top:20px;">
        <div class="col-sm-1"></div>
        <div class="col-sm-10" style="border-top:1px solid #e4e4e4;">
          <div class="row col-sm-12" style="border-bottom:1px solid #e4e4e4;padding:10px;">
            我的评论
          </div>
        </div>
        <div class="col-sm-1"></div>
     </div>
	</div>
  <%@ include file="foot.jsp" %>
	<script src="js/jquery-3.1.0.min.js"></script> 
	<script src="js/bootstrap.min.js"></script>
	<script src="js/docs.js"></script>
	<script src="js/view.js"></script>
	<script type="text/javascript">
	  $(document).ready(function(){
		  $("#gerenzhongxin").addClass("active");
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
		  })
	  })
	</script>
</body>
</html>