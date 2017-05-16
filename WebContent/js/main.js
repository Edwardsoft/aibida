$(document).ready(function(){
  $("#search_click").click(function(){
	var content=$("#search").val().trim();
	if(content==""||content==null) {
		alert("查询的内容不得为空！")
	}else {
		location.href="Search?content="+content;
	}
  });
});