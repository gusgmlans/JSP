<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>상품상세정보</title>
		<link rel = "stylesheet" type = "text/css" href="<%=request.getContextPath()%>/css/main.css">
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
			
			<!-- Begin Right Column -->
			<div id = "rightcolumn">
				<h1>상품상세정보</h1>
				<table border = "1">
					<tr>
						<td>상품코드</td>
						<td>아이디</td>
						<td>상품명</td>
						<td>카테고리</td>
						<td>가격</td>
						<td>색상</td>
						<td>사이즈</td>
						<td>날짜</td>
						<td>상세설명</td>
						<td>수정</td>
						<td>삭제</td>
					</tr>
	<%
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		request.setCharacterEncoding("EUC-KR");
		
		String get_g_code = request.getParameter("send_g_code");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/gusgmlans?useUnicode=true&characterEncoding=euckr";
		String dbUser = "gusgmlans";
		String dbPass = "qudtls78!!@@";
		
		connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(connection + "<-- connection");
			
		preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_code = ?");
		System.out.println(preparedStatement + "<-- preparedStatement");
		
		preparedStatement.setString(1, get_g_code);
		
		resultSet = preparedStatement.executeQuery();
		System.out.println("preparedStatement.executeQuery");
			
		if(resultSet.next()){
	%>
					<tr>
						<td><%=resultSet.getString("g_code")%></td>
						<td><%=resultSet.getString("u_id")%></td>
						<td><%=resultSet.getString("g_name")%></td>
						<td><%=resultSet.getString("g_cate")%></td>
						<td><%=resultSet.getString("g_price")%></td>
						<td><%=resultSet.getString("g_color")%></td>
						<td><%=resultSet.getString("g_size")%></td>
						<td><%=resultSet.getString("g_date")%></td>
						<td><%=resultSet.getString("g_desc")%></td>
						<td><a href="<%= request.getContextPath()%>/goods/goods_update_form.jsp?send_g_code=<%=resultSet.getString("g_code")%>">수정</a></td>
						<td><a href="<%= request.getContextPath()%>/goods/goods_delete_pro.jsp?send_g_code=<%=resultSet.getString("g_code")%>">삭제</a></td>
					</tr>
	
	<%	
		}else{
			response.sendRedirect(request.getContextPath() + "/goods/goods_search_list.jsp");
		}
		
		resultSet.close();
		
		preparedStatement.close();
		
		connection.close();
	%>
				</table>
				<input type = "button" value = "돌아가기" onClick = "location.href = '<%= request.getContextPath()%>/goods/goods_search_list.jsp'">
			</div>
			<!-- End Right Column -->
			
			<!-- Begin hadan -->
			<%@include file = "/module/hadan.jsp"%>
			<!-- End hadan -->
			
		</div>
		<!-- End Wrapper -->
	</body>
</html>