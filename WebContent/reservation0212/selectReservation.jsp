<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 대출 정보 조회</title>
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
	width : 950px;
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
		<h2>도서 예약 정보 조회</h2>
		<%
			int count = 0;
			try {
				String sql = "select count(*) from reservation0212";
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
				총 <b><%=count%>권</b>의 도서 예약정보가 있습니다.
			</p>
		</div>
		<table>
			<tr>
				<th width=50>no</th>
				<th width=80>대출번호</th>
				<th width=80>고객성명</th>
				<th width=80>도서코드</th>
				<th width=240>도 서 명</th>
				<th width=150>대출일자</th>
				<th width=150>대출일자</th>
				<th width=80>대출상태</th>
				<th width=50>등급</th>
			</tr>
		<%
			int no = 0;
			try {
				String sql = "select a.lentno, a.custname, a.bookno, b.bookname, to_char(a.outdate,'yyyy-mm-dd'), to_char(a.indate,'yyyy-mm-dd'), a.status, a.class1 from reservation0212 a, bookinfo0212 b where a.bookno=b.bookno order by a.bookno";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					String lentno = rs.getString(1);
					String custname = rs.getString(2);
					String bookno = rs.getString(3);
					String bookname = rs.getString(4);
					String outdate = rs.getString(5);
					String indate = rs.getString(6);
					String status = rs.getString(7);
					String class1 = rs.getString(8);
					no++;
					
					if(indate==null){indate="";}
					if(class1==null){class1="";}
					%>
			<tr>
				<td><%=no %></td>
				<td><a href="/HRD0212/reservation0212/updateReservation.jsp?lentno=<%=lentno %>"><%=lentno %></a></td>
				<td><%=custname %></td>
				<td><%=bookno %></td>
				<td><p><%=bookname %></p></td>
				<td><%=outdate %></td>
				<td><%=indate %></td>
				<td><%=status %></td>
				<td><%=class1 %></td>
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
			<input id="btn2" type="button" value="대출 정보 추가" onclick="location.href='/HRD0212/reservation0212/insertReservation.jsp'">
		</div>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>