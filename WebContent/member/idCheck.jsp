<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheck.jsp</title>
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script>

$(function(){
	
	var flag = false;
	
	//중복체크 내에서 확인
	$('#checkBtn').click(function(){ //클릭하면
		var id = $('#userID').val();
		var pattern_id = /^[a-zA-Z0-9\s]+$/;
		//숫자영문혼용
		var num = id.search(/[0-9]/g);
		var eng = id.search(/[a-zA-Z]/ig);
		
		if(!id){
			alert("아이디를 입력하세요.");
			return;
		}
		else if(!id==pattern_id.test(id)){
			alert("영문과 숫자 이외의 문자는 사용하실 수 없습니다.");
			$('#userID').val("");
			return;
		}
		else if(id.length<4){
			alert("4자리 이상 입력해주세요.");
			$('#userID').val("");
			return;
		}
		else if(num<0 || eng<0){
			alert("영문과 숫자를 모두 사용하셔야 합니다.");
			$('#userID').val("");
			return;
		}
		else{
			$.ajax({
				url : "./idCheckProc.jsp",
				type : "post",
				contentType : "application/x-www-form-urlencoded;charset:utf-8;",
				data : {
					method : "POST",
					id : id
				},
				dataType : "json",
				success : function(data){
					alert(data.result);
					if(data.flag==false){
						$('#userID').val("");
					}
				},
				error : function(e){
					alert("idCheck.jsp에러:"+e.statusText);
				}
			});
		}
	});
	
	$('#setID').click(function(){
		$(opener.document).find('#id').val($('#userID').val());
		window.close();
	});
});
</script>
<style>
	table{
		width: 99%;
		height: 200px;
		text-align: center;
		margin: auto;
	}
	.btn{
		width: 100px;
		height: 35px;
	}
</style>
</head>
<body>
<div id="wrap">
	<table>
		<tr>
			<th style="font-size: 1.8em;">
				아이디 중복체크
			</th>
		</tr>
		<tr>
			<td>
				<input type="text" style="width: 300px; height: 30px;" id="userID"
					maxlength="12" autofocus="autofocus" value="" />
				<input type="button" value="중복확인" style="height: 35px;" id="checkBtn" />
			</td>
		</tr>
		<tr>
			<td>
				<!-- <span></span> -->
				<input type="button" value="사용하기" class="btn" id="setID"/>&nbsp;&nbsp;
				<input type="button" value="취소" class="btn" onclick="window.close();" />
			</td>
		</tr>
	</table>
</div>
</body>
</html>
<script>

</script>