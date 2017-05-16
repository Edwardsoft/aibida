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
      .sex {
        border:1px solid #e4e4e4;
      }
      #apply_message{
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
	    <div id="apply_message">
	      <span class="glyphicon glyphicon-remove-circle">
	         您还未完成此表
	      </span>
      </div>
      
      <div id="donate_page" class=" row col-sm-12" style="color:white;position:fixed;width: 100%;height: 100%;background-color:transparent;z-index:999;display: none;">
        
        <div class="col-sm-2"></div>
        <div class="col-sm-8" style="background-color:rgba(28,28,28,0.8);height:90%;">
        <div style="position: absolute;right: 0px;padding:5px;"><a class="glyphicon glyphicon-remove" id="donate_page_remove"></a></div>
          <div class="row col-sm-12" id="step_one">
	            
	            <c:choose>
	              <c:when test="${volunteer.type==1 }">
	              <div class="row col-sm-12" style="margin-bottom:10px;color:white;text-align: center;font-size:24px;padding:5px;">请完成报名信息填写</div>  
	               <div class="row col-sm-12" style="font-size:18px;text-align: center;margin:10px 0px;">请选择您的性别</div>
	               <div class="row col-sm-12">
	                <div class="col-sm-4"></div>
	                <div class="col-sm-2 sex" value="0" style="background-color: rgb(28,28,28);cursor: pointer;text-align: center;margin: 5px;padding: 5px;">
	                  <div class="click_ok" style="display:none;position: absolute;width:0px;height:0px;border-right: 15px solid #cd0000;border-bottom: 15px solid #cd0000;right:0px;bottom:0px;border-left:15px solid transparent;border-top:15px solid transparent;">
	                  </div>
	                  <div class="glyphicon glyphicon-ok click_ok" style="display:none;position: absolute;top:15px;right:3px;"></div>
	                男</div>
	                <div class="col-sm-2 sex" value="1" style="background-color: rgb(28,28,28);cursor: pointer;text-align: center;margin: 5px;padding: 5px;">
	                  <div class="click_ok" style="display:none;position: absolute;width:0px;height:0px;border-right: 15px solid #cd0000;border-bottom: 15px solid #cd0000;right:0px;bottom:0px;border-left:15px solid transparent;border-top:15px solid transparent;">
	                  </div>
	                  <div class="glyphicon glyphicon-ok click_ok" style="display:none;position: absolute;top:15px;right:3px;"></div>
	                女</div>
	               </div>
	               <div class="row col-sm-12" style="font-size:18px;text-align: center;margin:10px 0px;">请填写您的个人信息</div>
	               <div class="form-group row">
	                <div class="col-sm-3"></div>
	                <label for="Inputname" class="contaol-label col-sm-2">姓名</label>
	                <div class="col-sm-4">
						        <input type="text" class="form-control login_input" id="Inputname" placeholder="请输入您的姓名" name="username" id="username">
						      </div>
	               </div>
	               <div class="form-group row">
		               <div class="col-sm-3"></div>
		               <label for="Inputphone" class="contaol-label col-sm-2">手机号</label>
		               <div class="col-sm-4">
		                 <input type="text" class="form-control login_input" id="Inputphone" placeholder="请输入您的手机号" name="username" id="username">
		               </div>
		             </div>
		             <div class="col-sm-12 row" style="margin-top: 20px;">
		               <div class="col-sm-5"></div>
		               <div class="col-sm-2" style="text-align: center;padding:10px;background-color:rgb(28,28,28);cursor: pointer;" id="volunteer_submit">提交</div>
		               <div class="col-sm-5"></div>
		             </div>
	              </c:when>
	            </c:choose>
	        </div>
        </div>
        <div class="col-sm-2"></div>
      </div>
  
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
        <div class="col-sm-1"></div>
        <div class="col-sm-10">
          <div class="col-sm-9" style="border-right: 1px dashed #e4e4e4;">
            <div class="row col-sm-12" style="text-align: center;font-size: 24px;margin: 10px 0px;">${project.name}</div>
            <div class="row col-sm-12">
              <div class="col-sm-1"></div>
              <div class="col-sm-10"><img src="${project.img}" width="100%;" ></div>
              <div class="col-sm-1"></div>
            </div>
            <div class="row col-sm-12" style="text-indent: 2em;line-height: 25px;margin-bottom: 20px;">
              ${project.description}
            </div>
            <div class="row col-sm-12" align="center">
              志愿者招聘表
            </div>
            <div class="row col-sm-12">
              <c:choose>
                <c:when test="${volunteer.type==1}">
                  <table class="table table-hover">
		                <tr><td></td><td>需求人数</td><td>已招募人数</td><td>剩余人数</td></tr>
		                <tr><td>男生</td><td>${volunteer.man_amount }</td><td>${volunteer.man_amount-volunteer.man_remain_amount }</td><td>${volunteer.man_remain_amount}</td></tr>
		                <tr><td>女生</td><td>${volunteer.woman_amount }</td><td>${volunteer.woman_amount-volunteer.woman_remain_amount }</td><td>${volunteer.woman_remain_amount}</td></tr>
		              </table>
                </c:when>
              </c:choose>
            </div>
            <div class="row col-sm-12">
              <div class="col-sm-5"></div>
              <div class="col-sm-2" style="cursor: pointer;padding:10px;background-color:orange;text-align: center;border-radius: 5px;" id="donate1">立即参加</div>
              <div class="col-sm-5"></div>
            </div>
          </div>
          <div class="col-sm-3">
          <div class="row col-sm-12" style="margin-top:50px;">
            <div class="col-sm-1"></div>
            <div class="col-sm-11" style="font-size: 20px;margin:10px 0px;">
              隶属公益组织
            </div>
          </div>
          <div class="row col-sm-12">
            <div class="col-sm-1"></div>
            <div class="col-sm-10">
              <a href="OrganazationServlet?method=getorganazation&id=${organazation.id}"><img src="${organazation.avatar }" width="100%"/></a>
            </div>
            <div class="col-sm-1"></div>
          </div>
          <div class="row col-sm-12" >
            <div class="col-sm-1"></div>
           <div class="col-sm-10" style="text-align: center;">
             <a href="OrganazationServlet?method=getorganazation&id=${organazation.id}">${organazation.name}</a>
           </div>
          </div>
            
          </div>
        </div> 
        <div class="col-sm-1"></div>
      </div>

       
      </div>
    <%@ include file="foot.jsp" %>
    <script src="js/jquery-3.1.0.min.js"></script>
    <script>
      $(document).ready(function(){
    	  var sex="-1"; 
      
       $("#donate1").click(function(){
         if(${user==null}) {
           alert("您需要登录后才可以进行此操作");
         }else {
           $("#donate_page").css({"display":"block"});
           $("body").css({"overflow":"hidden"});
         }
       });
       $("#donate_page_remove").click(function() {
           $("#donate_page").css({"display":"none"});
           $("body").css({"overflow":"scroll"});
           window.location.reload();   
       });
       $(".sex").click(function(){
    	   $(".sex").css({"border":"1px solid #e4e4e4"});
    	   $(".sex").children(".click_ok").css({"display":"none"});
    	   $(this).css({"border":"1px solid #CD0000"});
    	   $(this).children(".click_ok").css({"display":"block"});
    	   sex=$(this).attr("value");
       });
       $("#volunteer_submit").click(function(){
    	   var name=$("#Inputname").val().trim();
    	   var telephone=$("#Inputphone").val().trim();
    	   if(name==""||name==null||telephone==""||telephone==null||sex=='-1') {
    		   $("#apply_message").css({"display":"block"});
    		   setTimeout(function(){
             $("#apply_message").css({"display":"none"});
           },1000);
    	   }else {
    		   $.post(
	           'VolunteerOrderServlet',
	           {method:'addVolunteerOrderServlet',project_id:'${project.id}',user_id:'${user.id}',name:name,telephone:telephone,sex:sex},
	           function(data) {
	             if(data=="true") {
	               $("#apply_message").html("<span class='glyphicon glyphicon-ok'>您已成功报名</span>");
	               $("#step_one").css({"display":"none"});
	               $("#apply_message").css({"display":"block"});
	               $("#apply_message").css({"display":"block"});
	               setTimeout(function(){
	                   $("#apply_message").css({"display":"none"});
	                   window.location.reload();
	               },1000);
	               
	             }
	           }
	         );
    	   }
    	   
       });
      });
     
    </script>
    <script src="js/bootstrap.min.js"   ></script>
    <script src="js/view.js"></script>
  </body>

</HTML>