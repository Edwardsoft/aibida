<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/amazeui.flat.css" rel="stylesheet">
<div class="container">
	<div style="margin-top: 80px;margin-bottom: 40px;">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-3" style="text-align: center;border-right: 1px solid #e4e4e4;">
			<p style="font-size: 20px;">客服电话</p>
			<p style="font-size: 30px;"><b>400-0368-163</b></p>
			<p style="font-size: 20px;">9:00-22:00</p>
		</div>
		<div class="col-sm-4" style="padding-left: 30px;padding-right: 30px;">
			<p align="center" style="font-size: 20px;">何为爱必达</p>
			<p>爱必达以帮助困境儿童为宗旨，我们所做的是打造一个连通爱心人士与慈善组织以及困境儿童之间的桥梁，让更多的人更好地了解困境儿童的现状，也让更多的人帮助困境儿童</p>
			<p>关注我们：<span class="am-icon-weixin" style="margin-right:10px;font-size:24px;"></span><span class="am-icon-weibo"style="margin-left:10px;font-size:24px;"></span></p>
		</div>
		<div class="col-sm-3" style="border-left: 1px solid #e4e4e4;"><p align="center" style="font-size: 20px;">扫码下载爱必达APP</p>
			<img src="img/liantu.png" style="margin-left: 27%;	">
		</div>
		<div class="col-sm-1"></div>
	</div>
	</div >
</div>
<div style="background-color: black;height: 150px;margin-bottom: -20px;">
  <a href="https://m.kuaidi100.com/" target="_blank">快递查询</a>
</div>

<script>
	$(document).ready(function(){
		$(window).scroll(function(){
			var top=$(window).scrollTop();
			var foot=$(document).height()-$(window).height()-$(window).scrollTop();
			if(top<=62||foot<=150) {
				$(".fixed").css({"position":"static"});
			}else {
				$(".fixed").css({"position":"fixed"});
				$(".fixed").css({"top":"40px"});
			}
		});
	});
</script>