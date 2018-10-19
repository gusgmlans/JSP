<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>회원가입</title>
		<link rel = "stylesheet" type = "text/css" href = "<%=request.getContextPath()%>/css/main.css">
	</head>
	<body>
	<!-- Begin Wrapper -->
		<div id = "wrapper">
		
			<!-- Begin top -->
			<%@include file = "/module/top.jsp"%>
			<!-- End top -->
			
			<!-- Begin left -->
			<%@include file = "/module/left.jsp"%>
			<!-- End left -->
			
			<!-- Begin Right Column -->
			<div id = "rightcolumn">
				<h1>회원가입</h1>
				<form action = "<%=request.getContextPath()%>/user_insert/user_insert_pro.jsp" method = "post">
					<table border = "1">
						<tr>
							<td>아이디</td>
							<td><input type = "text" name = "u_id" size = "20"></td>
						<tr>
						<tr>
							<td>암호</td>
							<td><input type = "password" name = "u_pw" size = "20"></td>
						<tr>
						<tr>
							<td>권한</td>
							<td><input type = "text" name = "u_level" size = "20"></td>
						<tr>
						<tr>
							<td>이름</td>
							<td><input type = "text" name = "u_name" size = "20"></td>
						<tr>
						<tr>
							<td>이메일</td>
							<td><input type = "text" name = "u_email" size = "20"></td>
						<tr>
						<tr>
							<td>전화번호</td>
							<td><input type = "text" name = "u_phone" size = "20"></td>
						<tr>
						<tr>
							<td>주소</td>
							<td><input type = "text" name = "u_addr" size = "20"></td>
						<tr>
						<tr>
							<td colspan = "4"><input type = "submit" value = "회원가입"></td>
						</tr>
					</table>
				</form>
			</div>
			<!-- End Right Column -->
			
			<!-- Begin hadan -->
			<%@include file = "/module/hadan.jsp"%>
			<!-- End hadan -->
			
		</div>
		<!-- End Wrapper -->
	</body>
</html>