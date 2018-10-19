<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>상품정보수정</title>
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
		
		String get_g_code = request.getParameter("send_g_code");
		System.out.println(get_g_code + "<-- get_g_code");
		
		String dbcode = null;
		String dbid = null;
		String dbname = null;
		String dbcate = null;
		String dbprice = null;
		String dbcolor = null;
		String dbsize = null;
		String dbdate = null;
		String dbdesc = null;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/db14hhm?useUnicode=true&characterEncoding=euckr";
		String dbUser = "dbid14hhm";
		String dbPass = "dbpw14hhm";
		
		connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("SELECT * FROM tb_goods WHERE g_code = ?");
		System.out.println(preparedStatement + "<-- preparedStatement");
		
		preparedStatement.setString(1, get_g_code);
		
		resultSet = preparedStatement.executeQuery();
		System.out.println("prepareStatement.executeQuery");
		
		if (resultSet.next()) {
			dbcode = resultSet.getString("g_code");
			dbid = resultSet.getString("u_id");
			dbname = resultSet.getString("g_name");
			dbcate = resultSet.getString("g_cate");
			dbprice = resultSet.getString("g_price");
			dbcolor = resultSet.getString("g_color");
			dbsize = resultSet.getString("g_size");
			dbdate = resultSet.getString("g_date");
			dbdesc = resultSet.getString("g_desc");
			
			System.out.println(dbcode + "<-- dbcode");
			System.out.println(dbid + "<-- dbid");
			System.out.println(dbname + "<-- dbname");
			System.out.println(dbcate + "<-- dbcate");
			System.out.println(dbprice + "<-- dbprice");
			System.out.println(dbcolor + "<-- dbcolor");
			System.out.println(dbsize + "<-- dbsize");
			System.out.println(dbdate + "<-- dbdate");
			System.out.println(dbdesc + "<-- dbdesc");
		}
		
		resultSet.close();
		
		preparedStatement.close();
		
		connection.close();
	%>
	
			<!-- Begin Right Column -->
			<div id="rightcolumn">
				<h1>상품정보수정</h1>
				<form action = "<%=request.getContextPath()%>/goods/goods_update_pro.jsp" method = "post">
					<table border = "1">
						<tr>
							<td>상품코드</td>
							<td><input type = "text" name = "g_code" size = "20" value = "<%=dbcode%>" readonly></td>
						<tr>
						<tr>
							<td>아이디</td>
							<td><input type = "text" name = "u_id" size = "20" value = "<%=dbid%>" readonly></td>
						<tr>
						<tr>
							<td>상품명</td>
							<td><input type = "text" name = "g_name" size = "20" value = "<%=dbname%>"></td>
						<tr>
						<tr>
							<td>카테고리</td>
							<td><input type = "text" name="g_cate" size = "20" value = "<%=dbcate%>"></td>
						<tr>
						<tr>
							<td>가격</td>
							<td><input type = "text" name = "g_price" size = "20" value= "<%=dbprice%>"></td>
						<tr>
						<tr>
							<td>색상</td>
							<td><input type = "text" name = "g_color" size = "20" value = "<%=dbcolor%>"></td>
						<tr>
						<tr>
							<td>사이즈</td>
							<td><input type = "text" name = "g_size" size = "20" value = "<%=dbsize%>"></td>
						<tr>
						<tr>
							<td>날짜</td>
							<td><input type = "text" name = "g_date" size = "20" value = "<%=dbdate%>" readonly></td>
						<tr>
						<tr>
							<td>상세설명</td>
							<td><input type = "text" name = "g_desc" size = "20" value = "<%=dbdesc%>"></td>
						<tr>
						<tr>
							<td colspan = "4"><input type = "submit" value = "상품정보수정"></td>
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