<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="css/amazeui.flat.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/theme.css" rel="stylesheet">
<script src="js/one.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索结果</title>
<style>
  * {
    font-family:微软雅黑; 
  }
  .login .head {
    top:25px;
    position:absolute;
    width:100%;
    height:40px;
    font-size:22px;
    text-align:center;
    color:green;
  }
  
  .login {
    width:780px;
    left:25%;
    top:150px;
    height:500px;
    position:absolute;
    display:block;
    background-color:white;
    border-radius:10px;
    border:1px solid #e4e4e4;
  }
  username,password,jizhu {
    display:block;
    position:absolute;
    width:390px;
    left:195px;
    
  }
  username {
    top:100px;
    line-height:30px;
  }
  password {
    top:170px;
    line-height:30px;
  }
  jizhu {
    top:250px;
  }
  .input {
    position:absolute;
    right:50px;
    width:200px;
    height:30px;
    border-radius:15px;
    border:none;
    background-color:#f2f2f2;
  }
  .text {
    position:absolute;
    left:50px;
  }
  jizhu input{
    position:absolute;
    left:130px;
  }
  .wangji {
    position:absolute;
    right:50px;
  }
  jizhu .text {
    position:absolute;
    left:150px;
  }
  login {
    position:absolute;
    width:250px;
    left:270px;
    top:310px;
    background-color:orange;
    text-align:center;
    height:35px;
    line-height:35px;
    border-radius:17.5px;
    cursor:pointer;
  }
  fenge {
    width:215px;
    display:block;
    left:287.5px;
    height:30px;
    position:absolute;
    top:370px;
    text-align:center;
    color:green;
  }
  .hr_left,.hr_right{
    position:absolute;
    top:12px;
    width:50px;
    display:inline;
    height:1px;
    border:none;
    border-top:1px solid green;
  }
  .hr_left {
    left:0px;
  }
  .hr_right {
    right:0px;
  }
  error {
    position: absolute;
    top:220px;
    color:red;
    width:250px;
    left:270px;
    text-align:center;
  }
  #login_form {
    border:1px solid #e4e4e4;
    border-radius:10px;
  }
  
  .form_title {
    text-align: center;
    height: 75px;
  }
  
  .form-group {
    height: 100px;
  }
  
  button {
    width:100px;
  }
  a.am-icon-qq:link {
    color:black;
  } 
  a.am-icon-qq:visited {
    color:red;
  } 
  a.am-icon-qq:hover {
    color:yellow;
  } 
</style>
<script type="text/javascript">

</script>
</head>
<body>

<div class="container">
  <%@ include file="head.jsp" %>
  <div class="row col-sm-12">
    <div class="col-sm-1"></div>
    <div class="col-sm-10">
      <div class="row col-sm-12" style="border-bottom:1px solid #e4e4e4;padding:10px;font-size:20px;"> 
        <div class="col-sm-4">
        捐赠/<a href="SearchVolunteer?content=${content }">志愿服务</a>
        </div>       
      </div>
      <div class="col-sm-12 row" id="donate_search">
        <div class="col-sm-12 row">
          搜索<span style="color:orange;">"${content}"</span>，找到${donate_project_size}个捐赠项目 
        </div>
        <c:forEach items="${donate_projects}" var="donate_project">
          <div class="col-sm-12 row" style="padding:10px;">
            <div class="col-sm-2">
              <a href="Donate_show?id=${donate_project.id}"><img src="${donate_project.img}" style="width: 100%;"></a>
            </div>
            <div class="col-sm-4" style="font-size: 18px;">
              <a href="Donate_show?id=${donate_project.id}">
                ${donate_project.name}
              </a>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
    <div class="col-sm-1"></div>
  </div>
</div>

<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/docs.js"></script>
<script src="js/view.js"></script>
<script src="js/amazeui.min.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
	  $("#search").val("${content}");
    $("#orlogin").click(function(){
      location.href="OrLogin";
    });
    
    
  });
</script>
</body>
</html>