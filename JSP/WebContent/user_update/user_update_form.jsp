<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>회원정보수정</title>
		<link rel = "stylesheet" type = "text/css" href = "<%=request.getContextPath()%>/css/main.css">
	</head>
	<body>
		<!-- Begin Wrapper -->
		<div id="wrapper">

			<!-- Begin top -->
			<%@include file = "/module/top.jsp"%>
			<!-- End top -->
			
			<!-- Begin left -->
			<%@include file = "/module/left.jsp"%>
			<!-- End left -->
			
	<%
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		request.setCharacterEncoding("EUC-KR");
	
		String get_id = request.getParameter("send_id");
		System.out.println(get_id + "<-- get_id");
		
		String db_id = null;
		String db_pw = null;
		String db_level = null;
		String db_name = null;
		String db_email = null;
		String db_phone = null;
		String db_addr = null;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/db14hhm?useUnicode=true&characterEncoding=euckr";
		String dbUser = "dbid14hhm";
		String dbPass = "dbpw14hhm";
		
		connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("SELECT * FROM tb_user WHERE u_id = ?");
		preparedStatement.setString(1, get_id);
		System.out.println(preparedStatement + "<-- preparedStatement");

		resultSet = preparedStatement.executeQuery();
		System.out.println("preparedStatement.executeQuery");
		
		if(resultSet.next()){
			db_id = resultSet.getString("u_id");
			db_pw = resultSet.getString("u_pw");
			db_level = resultSet.getString("u_level");
			db_name = resultSet.getString("u_name");
			db_email = resultSet.getString("u_email");
			db_phone = resultSet.getString("u_phone");
			db_addr = resultSet.getString("u_addr");
		}
		
		resultSet.close();
		
		preparedStatement.close();
		
		connection.close();
	%>
			<!-- Begin Right Column -->
			<div id = "rightcolumn">
				<h1>회원정보수정</h1>
				<form method = "post" action = "<%=request.getContextPath()%>/user_update/user_update_pro.jsp">
					<table border = "1">
						<tr>
							<td>아이디</td>
							<td><input type = "text" name = "u_id" size = "20" value = "<%=db_id%>" readonly></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type = "text" name = "u_pw" size = "20" value = "<%=db_pw%>"></td>
						</tr>
						<tr>
							<td>권한</td>
							<td><input type = "text" name = "u_level" size = "20" value = "<%=db_level%>"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type = "text" name = "u_name" size = "20" value = "<%=db_name%>"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type = "text" name = "u_email" size = "20" value = "<%=db_email%>"></td>
						</tr>
						<tr>
							<td>폰번호</td>
							<td><input type = "text" name = "u_phone" size = "20" value = "<%=db_phone%>"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type = "text" name = "u_addr" size = "20" value = "<%=db_addr%>"></td>
						</tr>
						<tr>
							<td colspan = "4"><input type = "submit" value = "회원정보수정"></td>
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