<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/theme.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-3.1.0.min.js" ></script>
<script type="text/javascript">

</script>
<style type="text/css">
  .jichuxinxi {
    border-top:1px solid #e4e4e4;
    border-bottom:1px solid #e4e4e4;
    line-height: 70px;
  }
  .jichuxinxi span {
    color:orange;
  }
  .mulu {
    border-left:1px solid #e4e4e4;
    border-right:1px solid #e4e4e4;
    min-height:400px;
  }
  .mulu li {
    height: 50px;
  }
      
  #touxiang {
    width: 90px;
    margin: 25%;
    height: 90px;
    border-radius: 45px;
    background-color: green;
    margin-bottom: 15%;
  }
  #qiehuanzhanghao {
    width: 90px;
    height: 28px;
    background-color: #e4e4e4;
    line-height: 28px;
    text-align: center;
    border:1px solid gray;
    margin-bottom: 20px;
    margin-top: 20px;
    margin-left: 25%;
  }
  .xijie *{
    margin-top: 10px;
    margin-bottom: 10px;
    font-size:15px;
  }

  a:link {color:black;text-decoration: none;}
  a:visited {color: black;}
  a:hover {color: orange}
  a:active {color: #0000FF}
</style>
<title>我的主页</title>
</head>
<body>
  <div class="container">
    <%@ include file="head.jsp" %>
    <div class="row">
      <div class="col-sm-1"></div>
      <div class="col-sm-10 row">
        <div class="row" style="border-bottom:1px solid #e4e4e4;padding:10px 0px;">
          编辑个人信息
        </div>
        <div class="col-sm-7 row">
          <div class="row" style="padding:5px 0px;">
            <div class="col-sm-3">昵称：</div>
            <div class="col-sm-9">
              <div class="row"><input type="text" class="form-control login_input" id="InputUsername" value="${user.userName }" name="username" id="username"></div>
              <div class="row" style="padding:5px;"><span id="username_error" style="color:red;"></span></div>
            </div>
          </div>
          
        </div>
        <div class="col-sm-1"></div>
        <div class="col-sm-2 ">
          <div class="row">
            <img src="${user.avatar }" style="width: 100%;padding:5px;">
          </div>
          <div class="row" style="text-align:center;margin:10px 0px;"><span style="padding:5px;border:1px solid #e4e4e4;cursor:pointer;" id="change_avatar">修改头像</span></div>
        </div>
      </div>
      <div class="col-sm-1"></div>
    </div>
    <div class="row" style="padding:20px 0px;">
      <div class="col-sm-2"></div>
      <div class="col-sm-2"><button type="button" class="btn btn-default" name="save">保存</button></div>
      <div class="col-sm-2"><button type="button" class="btn btn-default" name="cancel">取消</button></div>
    </div>
  </div>
  <%@ include file="foot.jsp" %>
  <script src="js/jquery-3.1.0.min.js"></script> 
  <script src="js/bootstrap.min.js"></script>
  <script src="js/docs.js"></script>
  <script src="js/view.js"></script>
  <script type="text/javascript">
	  var username;
	  var password;
	  var email;
	  var usernamestatus=0;
	  var passwordstatus=0;
	  var repeatpasswordstatus=0;
	  var emailstatus=0;
	  var telephoenstatus=0;
	  var email=$.trim($("input[name='email']").val());
	  var telephone=$.trim($("input[name='telephone']").val());
	  function checkusername() {
	    var re=new RegExp("^[a-zA-Z][a-zA-Z0-9_]{4,15}$");
	    username=$("input[name='username']").val();
	    if(username==null||username=="") {
	      $("input[name='username']").parent().parent().removeClass("has-warning");
	      $("input[name='username']").parent().parent().addClass("has-error");
	      $("#username_error").html("用户名不能为空！");
	      usernamestatus=0;
	    }else if(username.length<6){
	      $("input[name='username']").parent().parent().removeClass("has-error");
	      $("input[name='username']").parent().parent().addClass("has-warning");
	      $("#username_error").html("用户名长度不得低于六位");
	      usernamestatus=0;
	    }else if(!re.test(username)) {
	      $("input[name='username']").parent().parent().removeClass("has-error");
	      $("input[name='username']").parent().parent().addClass("has-warning");
	      $("#username_error").html("用户名首只能以字母开头，只允许字母数字下划线，允许5-16位");
	      usernamestatus=0;
	    }else {
	      $("#username_error").html("");
	      $.post(
	        "UserServlet",
	        {username:username,method:'checkUserName'},
	        function(data) {
	          if(data=="false") {
	            $("input[name='username']").parent().parent().removeClass("has-error");
	            $("input[name='username']").parent().parent().removeClass("has-warning");
	            usernamestatus=1;
	          }else {
	        	  if($("input[name='username']").val()==${user.userName}) {
	        		  $("input[name='username']").parent().parent().removeClass("has-error");
	              $("input[name='username']").parent().parent().removeClass("has-warning");
	              usernamestatus=1;
	        	  }else {
	        		  $("input[name='username']").parent().parent().addClass("has-error");
	              $("#username_error").html("很遗憾，该用户名已被占用");
	              usernamestatus=0;
	        	  }
	            
	          }
	        }
	      )
	    }
	  }
	  
	  function checkpassword() {
	    var re=new RegExp("^[a-zA-Z][a-zA-Z0-9_]{4,15}$");
	    password=$("input[name='password']").val();
	    if(password==null||password=="") {
	      $(this).parent().parent().addClass("has-error");
	      $("#password_error").html("密码不能为空！");
	      passwordstatus=0;
	    }else if(password.length<6){
	      $(this).parent().parent().removeClass("has-error");
	      $(this).parent().parent().addClass("has-warning");
	      $("#password_error").html("用户名长度不得低于六位");
	      passwordstatus=0;
	    }else if(!re.test(password)) {
	      $(this).parent().parent().removeClass("has-error");
	      $(this).parent().parent().addClass("has-warning");
	      $("#password_error").html("密码只允许字母数字下划线，允许5-16位");
	      passwordstatus=0;
	    }else {
	      $("#password_error").html("");
	      $(this).parent().parent().removeClass("has-error");
	      $(this).parent().parent().removeClass("has-warning");
	      passwordstatus=1;
	    }
	  }
	   
	  
	  function checkemail() {
	    var emailgre=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/; 
	    email=$("input[name='email']").val();
	    if(email!=""&&email!=null) {
	      if(!emailgre.test(email)) {
	        $("#email_error").html("邮箱格式不正确");
	        emailstatus=0;
	        $("input[name='email']").parent().parent().addClass("has-error");
	      }else {
	        $("#email_error").html("");
	        emailstatus=1;
	        $("input[name='email']").parent().parent().removeClass("has-error");
	      }
	    }else {
	      $("#email_error").html("");
	      emailstatus=1;
	      $("input[name='email']").parent().parent().removeClass("has-error");
	    }
	  }
	  function checktelephone() {
		  var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
		  var telephone=$("input[name='telephone']").val();
		  if(!myreg.test(telephone)&&telephone.length>=1) 
		  { 
		    $("#telephone_error").html("请输入正确的手机号");
		      return false; 
		  }else if(telephone.length==0){
			  $("#telephone_error").html("");
		  }else{
			  $("#telephone_error").html("<a href='#'>点击获取手机验证码</a>");
		  } 
	  }
	  
    $(document).ready(function(){
    	$("#change_avatar").mouseover(function(){
    		$(this).css({"background-color":"#d4d4d4"})
    	});
    	$("#change_avatar").mouseout(function(){
            $(this).css({"background-color":"white"})
      });
    	$("input[name='username']").blur(function(){
 	      checkusername();
 	    });
 	    $("input[name='password']").blur(function(){
 	      checkpassword();
 	    });
 	    $("input[name='email']").blur(function(){
 	      checkemail();
 	    })
 	    $("input[name='telephone']").blur(function(){
 	    	checktelephone();
 	    })
    })
  </script>
</body>
</html>