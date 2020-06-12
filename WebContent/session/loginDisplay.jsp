<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script>
<<<<<<< HEAD

</script>
</head>
<body>
<div id="loginDisplay">
	<p style="padding:10px 0px 10px 10px">
		<span style="font-weight:bold; color:#333;">
			<%=session.getAttribute("USER_NAME") %>님,
		</span>반갑습니다.<br />
		로그인 하셨습니다.
	</p>
		<p style="text-align:right; padding-right:10px;">
		<!-- 회원정보수정 -->
		<a href=""><img src="../images/login_btn04.gif" /></a>
		<!-- 로그아웃 -->
		<a href="../session/logout.jsp"><img src="../images/login_btn05.gif" /></a>
		<!-- <input type="image" src="../images/login_btn05.gif" alt="로그아웃"
			onclick="logoutValidata(); return false;" /> -->
	</p>
</div>
=======
$(function(){
	
});
</script>
</head>
<body>
	<p style="padding:10px 0px 10px 10px">
		<span style="font-weight:bold; color:#333;">
			<%=session.getAttribute("USER_NAME") %>님,
		</span>반갑습니다.<br />
		로그인 하셨습니다.
	</p>
		<p style="text-align:right; padding-right:10px;">
		<!-- 회원정보수정 -->
		<a href=""><img src="../images/login_btn04.gif" /></a>
		<!-- 로그아웃 -->
		<a href="../session/logout.jsp"><img src="../images/login_btn05.gif" /></a>
	</p> 
>>>>>>> refs/remotes/origin/master
</body>
</html>