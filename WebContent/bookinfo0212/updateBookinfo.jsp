<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서정보수정</title>
<style>
tr{
	height: 30px;
}
th{
 	width: 150px;
	background: lightgrey;
}
td{
	width: 300px;
}
#in1{
	height:22px;
	width: 80%;
	margin-left: 2px;
}
</style>
<script>
	function check(){
		if(document.form.bookno.value==""){
			alert('도서코드가 입력되지 않았습니다.');
			document.form.bookno.focus();
		}else if(document.form.author.value==""){
			alert('작가가 입력되지 않았습니다.');
			document.form.author.focus();
		}else if(document.form.bookname.value==""){
			alert('도서이름이 입력되지 않았습니다.');
			document.form.bookname.focus();
		}else{
			document.form.submit();
		}

	}
	
</script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
	<%
		String send_bookno = request.getParameter("bookno");
		try {
			String sql = "select * from bookinfo0212 where bookno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_bookno);
			rs = pstmt.executeQuery();
		if (rs.next()) {
			String bookno = rs.getString(1);
			String author = rs.getString(2);
			String bookname = rs.getString(3);
			
			%>
			
		<h2>도서 정보 수정 화면</h2>
		<form name="form" method="post" action="updatetBookinfo_p.jsp">
			<table>
				<tr>
					<th>도서코드</th>
					<td><input id="in1" type="text" name="bookno" value="<%=bookno %>" readonly></td>
				</tr>

				<tr>
					<th>저 자</th>
					<td><input id="in1" type="text" name="author" value="<%=author %>"></td>
				</tr>

				<tr>
					<th>도서이름</th>
					<td><input id="in1" type="text" name="bookname" value="<%=bookname %>"></td>
				</tr>

				<tr id="tr_btn">
					<td colspan=2 align=center>
					<input id="btn1" type="button" value="목록" onclick="location.href='/HRD0212/bookinfo0212/selectBookinfo.jsp'">
					<input id="btn1" type="button" value="수정" onclick="check()">
					</td>
				</tr>
			</table>
		</form>
							<%
				}

			} catch (SQLException e) {
				System.out.println("데이터 조회 실패");
				e.printStackTrace();
			}				
		%>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>