<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>상품검색</title>
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
			
			<!-- Begin Right Column -->
			<div id="rightcolumn">
			
				<!-- Begin goods_search_form.jsp -->
				<%@include file = "/goods/goods_search_form.jsp"%>
				<!-- End goods_search_form.jsp -->
				
				<h1>상품리스트</h1>
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
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		System.out.println(searchKey + "<-- searchKey");
		System.out.println(searchValue + "<-- searchValue");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/gusgmlans?useUnicode=true&characterEncoding=euckr";
		String dbUser = "gusgmlans";
		String dbPass = "qudtls78!!@@";
		
		connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(connection + "<-- connection");
		
		if(searchKey == null & searchValue == null){
			System.out.println("01조건_sk null sv null");
			preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods");
		
		}else if(searchKey != null & searchValue.equals("")){
			System.out.println("02조건_sk 있고 sv 공백");
			preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods");
		
		}else if(searchKey != null & searchValue != null){
			System.out.println("03조건_둘다 값이 있다");
			if(searchKey.equals("g_code")){
				System.out.println("03_01 g_code 조건");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_code = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("u_id")){
				System.out.println("03_02 u_id 조건");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE u_id = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("g_name")){
				System.out.println("03_03 g_name 조건");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_name = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("g_cate")){
				System.out.println("03_04 g_cate 조건");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_cate = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("g_price")){
				System.out.println("03_05 g_price 조건");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_price = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("g_color")){
				System.out.println("03_06 g_color 조건");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_color = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("g_size")){
				System.out.println("03_07 g_size 조건");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_size = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("g_date")){
				System.out.println("03_08 g_date 조건");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_date = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("g_desc")){
				System.out.println("03_09 g_desc 조건");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_desc=?");
				preparedStatement.setString(1, searchValue);
			}
		}
		
		resultSet = preparedStatement.executeQuery();
		System.out.println("preparedStatement.executeQuery");
		
		while(resultSet.next()){
	%>
					<tr>
						<td><a href = "<%=request.getContextPath()%>/goods/goods_detail_pro.jsp?send_g_code=<%=resultSet.getString("g_code")%>"><%=resultSet.getString("g_code")%></a></td>
						<td><%=resultSet.getString("u_id")%></td>
						<td><%=resultSet.getString("g_name")%></td>
						<td><%=resultSet.getString("g_cate")%></td>
						<td><%=resultSet.getString("g_price")%></td>
						<td><%=resultSet.getString("g_color")%></td>
						<td><%=resultSet.getString("g_size")%></td>
						<td><%=resultSet.getString("g_date")%></td>
						<td><%=resultSet.getString("g_desc")%></td>
						<td><a href = "<%= request.getContextPath()%>/goods/goods_update_form.jsp?send_g_code=<%=resultSet.getString("g_code")%>">수정</a></td>
						<td><a href = "<%= request.getContextPath()%>/goods/goods_delete_pro.jsp?send_g_code=<%=resultSet.getString("g_code")%>">삭제</a></td>
					</tr>
	<%	
		}
		
		resultSet.close();
		
		preparedStatement.close();
		
		connection.close();
	%>
				</table>
			</div>
			<!-- End Right Column -->
			
			<!-- Begin hadan -->
			<%@include file = "/module/hadan.jsp"%>
			<!-- End hadan -->
			
		</div>
		<!-- End Wrapper -->
	</body>
</html>