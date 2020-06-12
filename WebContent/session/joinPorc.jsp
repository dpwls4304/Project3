<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@page import="mod.MemberDAO"%>
<%@page import="mod.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%
request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String tel1 = request.getParameter("tel1");
String tel2 = request.getParameter("tel2");
String tel3 = request.getParameter("tel3");
String tel = tel1 + "-" + tel2 + "-" + tel3;
String mobile1 = request.getParameter("mobile1");
String mobile2 = request.getParameter("mobile2");
String mobile3 = request.getParameter("mobile3");
String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");
String email = email1 + "@" + email2;
String zip = request.getParameter("zip");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");
String addr3 = request.getParameter("addr3");
String address = zip + "," + addr1 + "," + addr3 + ","+ addr2;

MemberDTO dto = new MemberDTO();

dto.setName(name);
dto.setId(id);
dto.setPass(pass);
dto.setTel(tel);
dto.setmobile(mobile);
dto.setEmail(email);
dto.setAddress(address);

MemberDAO dao = new MemberDAO(application);

int affected = dao.insertMember(dto);
if(affected==1){
%>
	<script>
		location.href="../main/main.jsp";
	</script>
<%
} else{
%>
	<script>
		history.go(-1);
	</script>
<%
}
%>