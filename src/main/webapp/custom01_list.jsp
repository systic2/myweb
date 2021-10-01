<%@page import="db.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원 목록 조회</h2>
<% 
MemberDao dao = new MemberDao();
ArrayList<MemberVO> lists = dao.read();

%>
<table border="1">
	<tr>
		<th>회원아이디</th>
		<th>회원이름</th>
		<th>이메일</th>
		<th>연락처</th>
	</tr>
<%
for(MemberVO list : lists){
%>
<tr>
	<td><%=list.getId() %></td>
	<td><%=list.getName() %></td>
	<td><%=list.getEmail() %></td>
	<td><%=list.getTel() %></td>
</tr>
<%	
}
%>
</table>
<button type="button" onclick="location.href='./member_insert.jsp'">등록 계속</button>
</body>
</html>