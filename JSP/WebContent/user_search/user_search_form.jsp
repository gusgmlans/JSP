<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<body>
		<h1>회원검색</h1>
		<form action = "<%=request.getContextPath()%>/user_search/user_search_list.jsp" method = "post">
			<select name = "searchKey">
				<option value = "u_id">아이디</option>
				<option value = "u_level">권한</option>
				<option value = "u_name">이름</option>
				<option value = "u_email">이메일</option>
				<option value = "u_phone">폰번호</option>
				<option value = "u_addr">주소</option>
			</select>
			<input type = "text" name = "searchValue">
			<input type = "submit" value = "검색">	
		</form>
	</body>
</html>