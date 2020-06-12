<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script>
$(function(){
	
});
</script>
</head>
<body>
	<table cellpadding="0" cellspacing="0" border="0">
		<colgroup>
			<col width="45px" />
			<col width="120px" />
			<col width="55px" />
		</colgroup>
		<tr>
			<th><img src="../images/login_tit01.gif" alt="아이디" /></th>
			<td>
				<!-- 아이디입력 -->
				<input type="text" id="user_id" name="user_id" value="" class="login_input" />
			</td>
			<td rowspan="2">
				<!-- image옵션에 자동submit기능 있음 -->
				<!-- <a href="javascript:void(0)" id="loginBtn">
					<img src="../images/login_btn01.gif" />
				</a> -->
				<input type="image" src="../images/login_btn01.gif" 
				alt="로그인"/>
			</td>
		</tr>
		<tr>
			<th><img src="../images/login_tit02.gif" alt="패스워드" /></th>
			<td>
				<!-- 패스워드입력 -->
				<input type="text" id="user_pass" name="user_pass" value="" class="login_input" />
			</td>
		</tr>
	</table>
	<p>
		<input type="checkbox" name="" value="" /><img src="../images/login_tit03.gif" alt="저장" />
		<a href="../member/id_pw.jsp"><img src="../images/login_btn02.gif" alt="아이디/패스워드찾기" /></a>
		<a href="../member/join01.jsp"><img src="../images/login_btn03.gif" alt="회원가입" /></a>
	</p>
</body>
</html>