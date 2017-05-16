<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<HTML>
  <head>
    <meta charset="utf-8">
    <title>评价</title>
    <link href="css/bootstrap.min.css"  rel="stylesheet"/>
    <link href="css/bootstrap-theme.min.css" rel="stylesheet"/>
    <link href="css/theme.css" rel="stylesheet">
    <script src="js/one.js"></script>
    <style>
      #evaluate_message{
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
          <div class="col-sm-10">
            <div id="evaluate_message"></div>
          
            <div class="row col-sm-12" style="border-bottom:1px solid #e4e4e4;padding:10px;font-size:20px;">
              评价
            </div>
            <div class="row col-sm-12" style="padding:10px;font-size: 18px; ">
              <div class="col-sm-2">
                <span class="glyphicon glyphicon-star star" or="1" style="cursor:pointer;"></span>
	              <span class="glyphicon glyphicon-star star" or="2" style="cursor:pointer;"></span>
	              <span class="glyphicon glyphicon-star star" or="3" style="cursor:pointer;"></span>
	              <span class="glyphicon glyphicon-star star" or="4" style="cursor:pointer;"></span>
	              <span class="glyphicon glyphicon-star star" or="5" style="cursor:pointer;"></span>               
              </div>
              <div class="col-sm-2" id="evaluate_point"></div>
            </div>
            <div class="row col-sm-12" style="padding:10px ">
              <textarea rows="8" cols="16" style="width: 60%;" id="evaluation"></textarea>
            </div>
            <div class="row col-sm-12" style="padding:10px ">
              <div class="col-sm-2"></div>
              <div class="col-sm-2" style="text-align: center;padding:5px;border:1px solid #e4e4e4;cursor: pointer;" id="evaluate_submit">提交</div>
              <div class="col-sm-1"></div>
            </div>
          </div>
          <div class="col-sm-1"></div>
        </div>
        
      </div>
    <%@ include file="foot.jsp" %>
    <script src="js/jquery-3.1.0.min.js"></script>
    <script>
      $(document).ready(function(){
    	 var status=0;
    	 var or=0;
       $(".star").mouseover(function(){
    	   $(this).prevAll().css({"color":"orange"});
    	   $(this).css({"color":"orange"});
    	   or=$(this).attr("or");
    	   $("#evaluate_point").html(or+"分");
    	   status=0;
       });
       $(".star").mouseout(function(){
    	   if(status!=1) {
    		   $(".star").css({"color":"#333333"})
    		   $("#evaluate_point").html("");
    		   or=0;
    	   }
       })
       $(".star").click(function(){
    	   $(this).prevAll().css({"color":"orange"});
         $(this).css({"color":"orange"});
         status=1;
         $("#evaluate_point").html(or+"分");
       });
       $("#evaluate_submit").click(function(){
    	   var evaluation=$("#evaluation").val();
    	   $.post(
    			 'EvaluateServlet',
    			 {method:'addEvaluate',order_id:'${order.id}',point:or,evaluation:evaluation},
    			 function(data) {
    				 if(data=="true") {
    					 $("#evaluate_message").html("<span class='glyphicon glyphicon-ok-circle'>评价成功</span>")
    				   $("#evaluate_message").css({"display":"block"});
    					 $("#evaluate_message").css({"display":"block"});
	             setTimeout(function(){
	               $("#evaluate_message").css({"display":"none"});
	               location.href="geren";
	             },1000);
    					 
    				 }else {
    					 $("#evaluate_message").html("<span class='glyphicon glyphicon-ok-circle'>评价失败，请稍后重试</span>")
    		       $("#evaluate_message").css({"display":"block"});
    					 setTimeout(function(){
                 $("#evaluate_message").css({"display":"none"});
               },1000);
    				 }
    				 
    			 }
    	   )
       });
      });
    </script>
    <script src="js/bootstrap.min.js"   ></script>
    <script src="js/view.js"  ></script>
    <script src="js/npm.js"   ></script>  
  </body>

</HTML>