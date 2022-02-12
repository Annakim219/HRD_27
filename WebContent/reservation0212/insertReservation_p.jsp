<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insertReservation_p</title>
</head>
<body>
<%@ include file="/DBconn.jsp" %>
<%
	String lentno = request.getParameter("lentno");
	String custname = request.getParameter("custname");
	String bookno = request.getParameter("bookno");
	String outdate = request.getParameter("outdate");
	String indate = request.getParameter("indate");
	String status = request.getParameter("status");
	String class1 = request.getParameter("class1");
	
	try{
		String sql = "insert into reservation0212 values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lentno);
		pstmt.setString(2, custname);
		pstmt.setString(3, bookno);
		pstmt.setString(4, outdate);
		pstmt.setString(5, indate);
		pstmt.setString(6, status);
		pstmt.setString(7, class1);
		pstmt.executeUpdate();
		System.out.println("등록 성공");		
		%>
		<script>
			alert('등록이 완료되었습니다.');
			location.href="/HRD0212/reservation0212/selectReservation.jsp";
			
		</script>
		<%
		
	}catch(SQLException e){
		System.out.println("등록 실패");
		%>
		<script>
			alert('등록 실패');
			history.back(-1);
		</script>
		<%
		
		e.printStackTrace();
	}
%>
</body>
</html>