<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ȸ���˻�</title>
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
			<div id = "rightcolumn">
			
				<!-- Begin user_search_form.jsp -->
				<%@include file = "/user_search/user_search_form.jsp"%>
				<!-- End user_search_form.jsp -->
				
				<h1>ȸ������Ʈ</h1>
				<table border = "1">
					<tr>
						<td>���̵�</td>
						<td>��й�ȣ</td>
						<td>����</td>
						<td>�̸�</td>
						<td>�̸���</td>
						<td>�޴���ȭ</td>
						<td>�ּ�</td>
						<td>����</td>
						<td>����</td>
					</tr>
	<%
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
	
		request.setCharacterEncoding("EUC-KR");
	
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/db14hhm?useUnicode=true&characterEncoding=euckr";
		String dbUser = "dbid14hhm";
		String dbPass = "dbpw14hhm";
		
		connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(connection + "<-- connection");
	
		if(searchKey == null & searchValue == null){
			
			preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user");
			System.out.println(preparedStatement + "<-- preparedStatement");
			
		}else if(searchKey != null & searchValue.equals("")){
			
			preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user");
			System.out.println(preparedStatement + "<-- preparedStatement");
			
		}else if(searchKey != null & searchValue != null){
			
			if(searchKey.equals("u_id")){
				
				preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_id = ?");
				preparedStatement.setString(1, searchValue);
				System.out.println(preparedStatement + "<-- preparedStatement");
				
			}else if(searchKey.equals("u_level")){
				
				preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_level = ?");
				preparedStatement.setString(1, searchValue);
				System.out.println(preparedStatement + "<-- preparedStatement");
				
			}else if(searchKey.equals("u_name")){
				
				preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_name = ?");
				preparedStatement.setString(1, searchValue);
				System.out.println(preparedStatement + "<-- preparedStatement");
				
			}else if(searchKey.equals("u_email")){
				
				preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_email = ?");
				preparedStatement.setString(1, searchValue);
				System.out.println(preparedStatement + "<-- preparedStatement");
				
			}else if(searchKey.equals("u_phone")){
				
				preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_phone = ?");
				preparedStatement.setString(1, searchValue);
				System.out.println(preparedStatement + "<-- preparedStatement");
				
			}else if(searchKey.equals("u_addr")){
				
				preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_addr = ?");
				preparedStatement.setString(1, searchValue);
				System.out.println(preparedStatement + "<-- preparedStatement");
			}
		}
	
		resultSet = preparedStatement.executeQuery();
	
		while(resultSet.next()){
	%>
					<tr>
						<td><a href = "<%=request.getContextPath()%>/user_detail/user_detail_pro.jsp?send_id=<%=resultSet.getString("u_id")%>"><%=resultSet.getString("u_id")%></a></td>
						<td><%=resultSet.getString("u_pw")%></td>
						<td><%=resultSet.getString("u_level")%></td>
						<td><%=resultSet.getString("u_name")%></td>
						<td><%=resultSet.getString("u_email")%></td>
						<td><%=resultSet.getString("u_phone")%></td>
						<td><%=resultSet.getString("u_addr")%></td>
						<td><a href = "<%=request.getContextPath()%>/user_update/user_update_form.jsp?send_id=<%=resultSet.getString("u_id")%>">����</a></td>
						<td><a href = "<%=request.getContextPath()%>/user_delete/user_delete_pro.jsp?send_id=<%=resultSet.getString("u_id")%>">����</a></td>
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