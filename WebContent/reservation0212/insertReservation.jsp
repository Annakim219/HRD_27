<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서대출정보등록</title>
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
			form.action="insertReservation_p.jsp"
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
		String lentno = request.getParameter("lentno");
		String custname = request.getParameter("custname");
		String bookno = request.getParameter("bookno");
		String outdate = request.getParameter("outdate");
		String indate = request.getParameter("indate");
		String status = request.getParameter("status");
		String class1 = request.getParameter("class1");
		String t_bookno="";
		String t_bookname="";
		int chk = 0;
		
		if(bookno==null){
			lentno="";
			custname="";
			bookno="";
			outdate="";
			indate="";
			class1="";
		}
		
			try{
				String sql = "select bookno, bookname from bookinfo0212 where bookno=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bookno);
				rs = pstmt.executeQuery();
				if(rs.next()){
					t_bookno = rs.getString(1);
					t_bookname = rs.getString(2);
				} else if (bookno != ""){
					%>
						alert('등록되어 있지 않는 도서코드입니다.');
					<%
				}		
			}  catch (SQLException e) {
				System.out.println("도서 정보 조회 실패");
				e.printStackTrace();
			}
		
	%>
		<h2>도서 대출 예약 정보 등록 화면</h2>
		<form name="form" method="post" action="insertReservation.jsp">
			<table>
				<tr>
					<th>대출번호</th>
					<td><input id="in1" type="text" name="lentno" value="<%=lentno%>"></td>
					<th>고객성명</th>
					<td><input id="in1" type="text" name="custname" value="<%=custname%>"></td>
				</tr>

				<tr>
					<th>도서코드</th>
					<td><input id="in1" type="text" name="bookno" value="<%=t_bookno%>" onchange="changesubmit();"></td>
					<th>도서이름</th>
					<td><input id="in1" type="text" name="bookname" value="<%=t_bookname%>"></td>
				</tr>

				<tr>
					<th>대출일자</th>
					<td><input id="in1" type="text" name="outdate" value="<%=outdate%>"></td>
					<th>반납일자</th>
					<td><input id="in1" type="text" name="indate" value="<%=indate%>" onchange="changesubmit();" <%if(indate==""){chk=1;}else{chk=0;}%>></td>
				</tr>

				<tr>
					<th>대출상태</th>
					<td><input id="ra1" type="radio" name="status" value="1" <%if(chk==1){%>checked<%}%>>대출
					 <input id="ra1" type="radio" name="status" value="2" <%if(chk==0){%>checked<%}%>>반납</td>
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
					<input id="btn1" type="button" value="등록" onclick="check()"> 
					<input id="btn1" type="button" value="취소" onclick="location.href='/HRD0212/index.jsp'"></td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>