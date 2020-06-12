<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="./bootstrap4.4.1/jquery/jquery-3.5.1.js"></script>
<script>
$(function(){
	$('#btn').click(function(){
		alert("눌림");
	});
});
</script>
</head>
<body>
	<input type="checkbox" name="chk" onchange="show();" />체크하세요
	<br />
	<button id="btn">확인</button>
	<span id="warn"></span>
</body>
</html>