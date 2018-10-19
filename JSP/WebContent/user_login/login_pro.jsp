<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>

<!DOCTYPE html>

<%
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	request.setCharacterEncoding("EUC-KR");
	
	String id = request.getParameter("id");	
	String pw = request.getParameter("pw");
	System.out.println(id + "<-- id");
	System.out.println(pw + "<-- pw");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/db14hhm?useUnicode=true&characterEncoding=euckr";
	String dbUser = "dbid14hhm";
	String dbPass = "dbpw14hhm";
	
	connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(connection + "<-- connection");
	
	preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name FROM tb_user WHERE u_id = ?");
	preparedStatement.setString(1, id);
	System.out.println(preparedStatement + "<-- preparedStatement");
	
	resultSet = preparedStatement.executeQuery();
	System.out.println("preparedStatement.executeQuery");
	
	if(resultSet.next()){
		System.out.println("아이디 일치");
		String dbId = resultSet.getString("u_id");
		String dbPw = resultSet.getString("u_pw");
		String dbLevel = resultSet.getString("u_level");
		String dbName = resultSet.getString("u_name");
		
		if(pw.equals(dbPw)){
			System.out.println("로그인 성공");
			
			session.setAttribute("S_ID", dbId);
			session.setAttribute("S_LEVEL", dbLevel);
			session.setAttribute("S_NAME", dbName);
%>	
			<script type="text/javascript">
				alert('로그인 성공');
				location.href = '<%=request.getContextPath()%>/index.jsp';
			</script>
<%
		}else{
			System.out.println("비밀번호 불일치");
%>
			<script type="text/javascript">
				alert('비밀번호 불일치');
				location.href = '<%=request.getContextPath()%>/index.jsp';
			</script>
<%
		}
	}else{
		System.out.println("아이디 불일치");
%>
		<script type="text/javascript">
			alert('아이디 불일치');
			location.href = '<%=request.getContextPath()%>/index.jsp';
		</script>
<% 
	}
	
	resultSet.close();
	
	preparedStatement.close();
	
	connection.close();
%>	