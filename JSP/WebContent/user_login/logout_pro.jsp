<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<%
	//세션 종료
	session.invalidate();
%>
	<script type="text/javascript">
		alert('로그아웃');
		location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>