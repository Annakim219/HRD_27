<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 정보 조회</title>
<style>
th{
	height: 35px;
	background: lightgrey;
}
td{
	height: 30px;
	text-align: center;
}
.cnt{
	display: table;
	width : 500px;
	margin : 5px auto;
}

p{
 margin-left: 5px;
 text-align: left;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
		<h2>도서 정보 조회</h2>
		<%
			int count = 0;
			try {
				String sql = "select count(*) from bookinfo0212";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					count = rs.getInt(1);
				}

			} catch (SQLException e) {
				System.out.println("count 조회 실패");
				e.printStackTrace();
			}
		%>
		<div class="cnt">
			<p>
				총 <b><%=count%>권</b>의 도서정보가 있습니다.
			</p>
		</div>
		<table>
			<tr>
				<th width=50>no</th>
				<th width=80>도서코드</th>
				<th width=100>저자</th>
				<th width=270>도 서 명</th>
			</tr>
		<%
			int no = 0;
			try {
				String sql = "select * from bookinfo0212";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					String bookno = rs.getString(1);
					String author = rs.getString(2);
					String bookname = rs.getString(3);
					no++;
					%>
			<tr>
				<td><%=no %></td>
				<td><a href="/HRD0212/bookinfo0212/updateBookinfo.jsp?bookno=<%=bookno %>"><%=bookno %></a></td>
				<td><%=author %></td>
				<td><p><%=bookname %></p></td>
			</tr>			
					<%
				}

			} catch (SQLException e) {
				System.out.println("데이터 조회 실패");
				e.printStackTrace();
			}				
		%>
		</table>
		<div class="btn_group" align=center>
			<input id="btn2" type="button" value="도서 정보 추가" onclick="location.href='/HRD0212/bookinfo0212/insertBookinfo.jsp'">
		</div>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>