<%@page import="org.json.simple.JSONObject"%>
<%@page import="mod.MemberDTO"%>
<%@page import="java.util.Map"%>
<%@page import="mod.MemberDAO"%>
<%@page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");

System.out.println(id + "/" + pass);

String drv = application.getInitParameter("MariaJDBCDriver");
String url = application.getInitParameter("MariaConnectURL");

MemberDAO dao = new MemberDAO(drv, url);

//방법3 : Map컬렉션에 회원정보 저장 후 반환받기
Map<String, String> memberInfo = dao.getMemberMap(id, pass);

JSONObject jobj = new JSONObject();

if(memberInfo.get("id")!=null){
		
	//저장된 값이 있다면 세션영역에 id, pass, name을 속성으로 저장한다.
	session.setAttribute("USER_ID", memberInfo.get("id"));
	session.setAttribute("USER_PASS", memberInfo.get("pass"));
	session.setAttribute("USER_NAME", memberInfo.get("name"));
	//※JSON객체는 생성해서 요청한 쪽으로 뿌려져야 사용할 수 있다.
	jobj.put("result", 0);
	//response.sendRedirect("../main/main.do");
	
}
else{
	jobj.put("result", 1);
	//response.sendRedirect("../main/main.do");
	//저장된 값이 없다면 리퀘스트 영역에 오류메시지를 저장하고 포워드한다.
	//request.setAttribute("ERROR_MSG", "회원인증에 실패했습니다.");
	//포워드하면 페이지 이동 안됨
	//request.getRequestDispatcher("../main/main.do").forward(request, response); 
}
out.print(jobj.toString());
%>
