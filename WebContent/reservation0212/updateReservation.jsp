<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서대출정보수정</title>
<style>
tr {
	height: 30px;
}

th {
	width: 120px;
	background: lightgrey;
}

td {
	width: 200px;
}

#in1 {
	height: 22px;
	width: 97%;
	margin-left: 2px;
}

#sel1 {
	height: 25px;
	width: 60%;
	margin-left: 2px;
}

#ra1 {
	margin-left: 2px;
}
</style>
<script>
	function check() {
		if (document.form.lentno.value == "") {
			alert('대출번호가 입력되지 않았습니다.');
			document.form.lentno.focus();
		} else if (document.form.custname.value == "") {
			alert('고객성명이 입력되지 않았습니다.');
			document.form.custname.focus();
		} else if (document.form.bookno.value == "") {
			alert('도서코드가 입력되지 않았습니다.');
			document.form.bookno.focus();
		} else {
			document.form.submit();
		}

	}

	function changesubmit(){
		document.form.submit();
	}
	</script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
		<%
		String send_lentno = request.getParameter("lentno");
		int chk = 0;

		
		try{
			String sql = "select a.lentno, a.custname, a.bookno, b.bookname, to_char(a.outdate,'yyyy-mm-dd'), to_char(a.indate,'yyyy-mm-dd'), a.status, a.class1 from reservation0212 a, bookinfo0212 b where a.bookno=b.bookno and lentno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_lentno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String lentno = rs.getString(1);
				String custname = rs.getString(2);
				String bookno = rs.getString(3);
				String bookname = rs.getString(4);
				String outdate = rs.getString(5);
				String indate = rs.getString(6);
				String status = rs.getString(7);
				String class1 = rs.getString(8);	
				
				if(indate==null){indate="";}
				if(class1==null){class1="S";}	
		
	%>
		<h2>도서 대출 예약 정보 등록 화면</h2>
		<form name="form" method="post" action="updateReservation_p.jsp">
			<table>
				<tr>
					<th>대출번호</th>
					<td><input id="in1" type="text" name="lentno" value="<%=lentno%>" readonly></td>
					<th>고객성명</th>
					<td><input id="in1" type="text" name="custname" value="<%=custname%>" readonly></td>
				</tr>

				<tr>
					<th>도서코드</th>
					<td><input id="in1" type="text" name="bookno" value="<%=bookno%>" readonly></td>
					<th>도서이름</th>
					<td><input id="in1" type="text" name="bookname" value="<%=bookname%>" readonly></td>
				</tr>

				<tr>
					<th>대출일자</th>
					<td><input id="in1" type="text" name="outdate" value="<%=outdate%>" readonly></td>
					<th>반납일자</th>
					<td><input id="in1" type="text" name="indate" value="<%=indate%>"></td>
				</tr>

				<tr>
					<th>대출상태</th>
					<td><input id="ra1" type="radio" name="status" value="1" <%if(status.equals("1")){%>checked<%}%>>대출
					 <input id="ra1" type="radio" name="status" value="2" <%if(status.equals("2")){%>checked<%}%>>반납</td>
					<th>반납일자</th>
					<td><select id="sel1" name="class1">
							<option value="S" <%if(class1.equals("S")){%>selected<%}%>>S</option>
							<option value="A" <%if(class1.equals("A")){%>selected<%}%>>A</option>
							<option value="B" <%if(class1.equals("B")){%>selected<%}%>>B</option>
							<option value="C" <%if(class1.equals("C")){%>selected<%}%>>C</option>
					</select></td>
				</tr>

				<tr id="tr_btn">
					<td colspan=4 align=center>
					<input id="btn1" type="button" value="목록" onclick="location.href='/HRD0212/reservation0212/selectReservation.jsp'">
					<input id="btn1" type="button" value="수정" onclick="check()">
				</tr>
			</table>
		</form>
						<%
			}			
		}catch(SQLException e){
			System.out.println("수정 데이터 조회 실패");
		}
		
		%>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>