<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	body {
		padding-top: 20px;
		padding-bottom: 20px;
		font-family: 微软雅黑;
	}

</style>
<nav class="navbar navbar-default" role="navigation	">
		        <div class="container-fluid">
		          <div class="navbar-header">
		            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		              <span class="sr-only">Toggle navigation</span>
		              <span class="icon-bar"></span>
		              <span class="icon-bar"></span>
		              <span class="icon-bar"></span>
		            </button>
		            <a class="navbar-brand" href="#">爱必达</a>
		          </div>
		          <div id="navbar" class="navbar-collapse collapse">
		            <ul class="nav navbar-nav">
		              <li id="home"><a href="Index">主页</a></li>
		              <li id="donate"><a href="Donate_showAll" >我要捐赠</a></li>
		              <li id="volunteer"><a href="Volunteer_showAll" >我要当志愿者</a></li>
		              <li class="dropdown"  id="gerenzhongxin">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown">个人中心<span class="caret"></span></a>
		                <ul class="dropdown-menu" role="menu">
		                  <li id="gerenzhuye"><a href="UserAction_show">个人主页</a></li>
		                  <li><a href="#">捐赠记录</a></li>
		                  <li><a href="#">最新消息</a></li>
		                  <li class="divider"></li>
		                  <li class="dropdown-header">用户设置</li>
		                  <li><a href="#">查看用户设置</a></li>
		                </ul>
		              </li>
		              <li style="width: 300px;">
		                <input style="position:absolute;padding:5px 20px;border-radius:30px;border:1px solid #e4e4e4;top:10px;width:250px;right: 0px;outline: none;" placeholder="搜索捐赠/志愿服务项目" id="search">
		                <span class="glyphicon glyphicon-search" style="position: absolute;right: 10px;top:19px;cursor: pointer;" id="search_click"></span>
		              </li>
		            </ul>
		            <ul class="nav navbar-nav navbar-right">
		            <c:choose>
		            	<c:when test="${user==null&&organazationuser==null}">
		            		<li id="register"><a href="Register">注册</a></li>
		              	<li id="login"><a href="Login">登录</a></li>
		            	</c:when>
		            	<c:otherwise>
		            		<li><a href="UserAction_logout">退出当前账号</a></li>
		            	</c:otherwise>
		            </c:choose>
		              <li><a href="../navbar-fixed-top/">关于我们</a></li>
		            </ul>
		          </div><!--/.nav-collapse -->
		        </div><!--/.container-fluid -->
		    </nav>
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/main.js"></script>
<script>
$(document).ready(function(){
	$("#gerenzhongxin").click(function(){
		if(${user==null}) {
		  alert("您还未登录，请先登录再进行查看！");
		  location.href="Login";
		}
  });
});
</script>
