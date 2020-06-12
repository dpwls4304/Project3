<%@page import="mod.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//MariaDB정보로 변경되므로 초기화파라미터를 수정한다.
String drv = application.getInitParameter("MariaJDBCDriver");
String url = application.getInitParameter("MariaConnectURL");
MemberDAO dao = new MemberDAO(drv, url);
String id = request.getParameter("id");
int result = dao.registerID(id);
dao.close();

if(result==0){	
%>
	{"result":"사용할 수 있는 아이디입니다.","flag":true}
<%
}
else{
%>
	{"result":"이미 존재하는 아이디입니다.","flag":false}
<%
}
%>