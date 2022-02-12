<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updatetBookinfo_p</title>
</head>
<body>
<%@ include file="/DBconn.jsp" %>
<%
	String bookno = request.getParameter("bookno");
	String author = request.getParameter("author");
	String bookname = request.getParameter("bookname");
	
	try{
		String sql = "update bookinfo0212 set author=?, bookname=? where bookno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, author);
		pstmt.setString(2, bookname);
		pstmt.setString(3, bookno);
		pstmt.executeUpdate();
		System.out.println("수정 성공");		
		%>
		<script>
			alert('수정이 완료되었습니다.');
			location.href="/HRD0212/bookinfo0212/selectBookinfo.jsp";
			
		</script>
		<%
		
	}catch(SQLException e){
		System.out.println("수정 실패");
		%>
		<script>
			alert('수정 실패');
			history.back(-1);
		</script>
		<%
		
		e.printStackTrace();
	}
%>
</body>
</html>