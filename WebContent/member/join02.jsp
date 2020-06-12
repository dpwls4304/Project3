<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%
String name = "한글 또는 영문만 입력 할 수 있습니다.";
String name2 = "이름이 잘못되었습니다.";
String pass1 = "영문과 숫자만 사용할 수 있습니다.";

String id_origin = "* 4자 이상 12자 이내의 영문/숫자 조합하여 공백 없이 기입";
String pass_origin = "* 4자 이상 12자 이내의 영문/숫자 조합";
String length = "4자 이상 12자 이내로 써주세요";
%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
var pattern_name = /^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣\s]+$/;//영문한글
var pattern_pass = /^[a-zA-Z0-9\s]+$/;//영문숫자
var kor_complete = /^[가-힣\s]+$/;//한글완성형

//1. onkeyup 키업이벤트
function check_pattern(obj) {
	
	var pattern_kor = /^[가-힣ㄱ-ㅎㅏ-ㅣ\s]+$/
	var pattern_eng = /^[a-zA-Z\s]+$/;
	var final_kor = /[가-힣]/;
	var pattern_num = /[0-9]/;
	var pattern_engNum = /^[a-zA-Z0-9\s]+$/;
	
	//변수
	var str = obj.value;
	
	//이름
	//※str!=pattern_kor.test(str)은 안먹힘
	if(obj.name=="name"){
		
		var warnName = document.getElementById("warnName");
		
		if(!str==pattern_name.test(str)){
			warnName.innerHTML = "<b>" + "<%=name%>" + "</b>";
			obj.value = "";
		}
		else if(!str){ //한번 틀리고 난 다음부턴 지워도 경고
			warnName.innerHTML = "<b>" + "<%=name%>" + "</b>";
		}
		else{
			warnName.innerHTML = "";
		}
	} 
}

//2. onblur 블러이벤트
function outFocus(obj){
	
	var str = obj.value;
	
	//이름
	if(obj.name=="name"){
		
		var warnName = document.getElementById("warnName");
		
		if(!str==kor_complete.test(str)){
			warnName.innerHTML = "<b>" + "<%=name2%>" + "</b>";
		}
		else if(!str){
			obj.value = "";
		}
		else{
			"<b>" + "<%=name2%>" + "</b>";
		}
	}
}

//중복확인
function id_check_person(){
	//1920/1080
	//alert("윈도우 가로:" + window.screen.width + "/윈도우 세로:" + window.screen.height);
	
	
	/* Y축 변수는 OS기준으로 가운데 정렬과 동일. 브라우저 기준으로 할 경우
	문서 길이가 길면 중앙정렬시 화면에서 안보이는 문제가 있기 때문.
	https://webisfree.com/2016-09-01/%ED%8C%9D%EC%97%85%EC%B0%BD-%EC%A4%91%EC%95%99%EC%A0%95%EB%A0%AC-%EA%B0%80%EC%9A%B4%EB%8D%B0-%EC%9C%84%EC%B9%98%EC%8B%9C%ED%82%A4%EB%8A%94-%EB%B0%A9%EB%B2%95*/ 
	var popX = (document.body.offsetWidth/2) - (200/2);
	var popY = (window.screen.height/2) - (300/2);
	
	var childView = window.open("./idCheck.jsp", "idcheck", "status=no, resizable=no, scrollbars=no," +
		"width=500, height=300, left="+ popX + ", top="+ popY);
	childView.focus();
}

function checkValue() {
	var frm = document.forms.frm;
}

//주소API
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = '(' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
<body>
<<<<<<< HEAD
<center>
=======
<!-- <center> -->
>>>>>>> refs/remotes/origin/master
<div id="wrap">
	<%@ include file="../include/top.jsp" %>
	
	<img src="../images/member/sub_image.jpg" id="main_visual" />
	
	<div class="contents_box">
		<div class="left_contents">
			<%@ include file = "../include/member_leftmenu.jsp" %>
		</div>
		<div class="right_contents">
			<div class="top_title">
				<img src="../images/join_tit.gif" alt="회원가입" class="con_title" />
				<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;회원가입<p>
			</div>

			<p class="join_title"><img src="../images/join_tit03.gif" alt="회원정보입력" /></p>
			
			<form name="frm" action="joinPorc.jsp" method="post" onsubmit="return checkValue();">
			<table cellpadding="0" cellspacing="0" border="0" class="join_box">
				<colgroup>
					<col width="80px;" />
					<col width="*" />
				</colgroup>
				<!-- 이름 -->
				<tr>
					<th><img src="../images/join_tit001.gif" /></th>
					<td>
						<input type="text" name="name" value="" class="join_input" onkeyup="check_pattern(this);" onblur="outFocus(this)" />&nbsp;
						<!-- 이름경고 -->
						<span id="warnName" class="warnColor"></span>
					</td> 
				</tr>
				
				<!-- 아이디 -->
				<tr>
					<th><img src="../images/join_tit002.gif" /></th>
					<td>
						<input style="background-color: #c5c5c5;" type="text" id="id" name="id" readonly="readonly"
							value="중복확인을 눌러주세요" class="join_input" />&nbsp;
						<a onclick="id_check_person();" style="cursor:hand;">
							<!-- 중복확인 -->
							<img src="../images/btn_idcheck.gif" alt="중복확인" />
						</a>&nbsp;
						<span>* 4자 이상 12자 이내의 영문/숫자 조합하여 공백 없이 기입</span>
					</td>
				</tr>
				
				<!-- 비밀번호 -->
				<tr>
					<th><img src="../images/join_tit003.gif" /></th>
					<td>
						<input type="password" name="pass" value="" class="join_input" onkeyup="check_pattern(this);" onblur="outFocus(this);" />&nbsp;&nbsp;
						<span id="warnPass"><%=pass_origin%></span>
					</td>
				</tr>
				
				<!-- 비밀번호 확인 -->
				<tr>
					<th><img src="../images/join_tit04.gif" /></th>
					<td>
						<input type="password" name="pass2" value="" class="join_input" onblur="check_length(this);" />
					</td>
				</tr>
				
				<!-- 전화번호 -->
				<tr>
					<th><img src="../images/join_tit06.gif" /></th>
					<td>
						<input type="text" name="tel1" value="" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
						<input type="text" name="tel2" value="" maxlength="4" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
						<input type="text" name="tel3" value="" maxlength="4" class="join_input" style="width:50px;" />
					</td>
				</tr>
				
				<!-- 핸드폰번호 -->
				<tr>
					<th><img src="../images/join_tit07.gif" /></th>
					<td>
						<input type="text" name="mobile1" value="" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
						<input type="text" name="mobile2" value="" maxlength="4" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
						<input type="text" name="mobile3" value="" maxlength="4" class="join_input" style="width:50px;" /></td>
				</tr>
				
				<!-- 이메일 -->
				<tr>
					<th><img src="../images/join_tit08.gif" /></th>
					<td>

						<input type="text" name="email1" style="width:100px;height:20px;border:solid 1px #dadada;" value="" /> @ 
						<input type="text" name="email2" style="width:150px;height:20px;border:solid 1px #dadada;" value="" readonly />
						<select name="last_email_check2" onChange="email_input(this);" class="pass" id="last_email_check2" >
							<option selected="" value="">선택해주세요</option>
							<option value="1" >직접입력</option>
							<option value="dreamwiz.com" >dreamwiz.com</option>
							<option value="empal.com" >empal.com</option>
							<option value="empas.com" >empas.com</option>
							<option value="freechal.com" >freechal.com</option>
							<option value="hanafos.com" >hanafos.com</option>
							<option value="hanmail.net" >hanmail.net</option>
							<option value="hotmail.com" >hotmail.com</option>
							<option value="intizen.com" >intizen.com</option>
							<option value="korea.com" >korea.com</option>
							<option value="kornet.net" >kornet.net</option>
							<option value="msn.co.kr" >msn.co.kr</option>
							<option value="nate.com" >nate.com</option>
							<option value="naver.com" >naver.com</option>
							<option value="netian.com" >netian.com</option>
							<option value="orgio.co.kr" >orgio.co.kr</option>
							<option value="paran.com" >paran.com</option>
							<option value="sayclub.com" >sayclub.com</option>
							<option value="yahoo.co.kr" >yahoo.co.kr</option>
							<option value="yahoo.com" >yahoo.com</option>
						</select>
						<input type="checkbox" name="open_email" value="1">
						<span>이메일 수신동의</span>
					</td>
				</tr>
				
				<!-- 주소 -->
				<tr>
					<th><img src="../images/join_tit09.gif" /></th>
					<td>
						<input type="text" class="join_input" name="zip" id="sample6_postcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" class="join_input" style="width:550px; margin-top:5px;" name="addr1" id="sample6_address" placeholder="주소"><br>
						<input type="text" class="join_input" style="width:550px; margin-top:5px;" name="addr2" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" class="join_input" style="width:550px; margin-top:5px;" name="addr3" id="sample6_extraAddress" placeholder="참고항목">
					</td>
				</tr>
			</table>
			<!-- 확인/취소 -->
			<p style="text-align:center; margin-bottom:20px">
				<input type="image" src="../images/btn01.gif" />
				<!-- <a href="javascript:void(0)">
					<img src="../images/btn01.gif" />
				</a>&nbsp;&nbsp;  -->
				<a href="join01.jsp">
					<img src="../images/btn02.gif" />
				</a>
			</p>
			</form>
		</div>
	</div>
	<%@ include file="../include/quick.jsp" %>
</div>


<%@ include file="../include/footer.jsp" %>
</center>
</body>
</html>
