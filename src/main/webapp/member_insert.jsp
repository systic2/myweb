<%@page import="db.MemberVO"%>
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
<% 
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String email = request.getParameter("email");
String tel = request.getParameter("tel");

if(id != null){
	MemberVO vo = new MemberVO(id, pw, name, email, tel);
	MemberDao dao = new MemberDao();
	int flag = dao.insert(vo);
	if (flag != 0){
 
%>
	<p>저장 결과</p>
	<p>자료 <%=flag %>건을 등록하였습니다.</p>
	<button type="button" onclick="location.href='./member_insert.jsp'">등록 계속</button> <button type="button" onclick="location.href='./custom01_list.jsp'">조회</button>
<%} 
}else{
%>
<h2>회원 등록</h2>
<form method="post" action="./member_insert.jsp">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<th>회원명</th>
			<td><input type="text" name="pname"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name="email"></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="tel" name="tel"></td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">등록</button> <button type="button" onclick="location.href='./custom01_list.jsp'">조회</button></td>
		</tr>
	</table>
</form>
<%
}	
%>
</body>
</html>