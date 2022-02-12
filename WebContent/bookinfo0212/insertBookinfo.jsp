<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서정보등록</title>
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
	<section>
		<h2>도서 정보 등록 화면</h2>
		<form name="form" method="post" action="insertBookinfo_p.jsp">
			<table>
				<tr>
					<th>도서코드</th>
					<td><input id="in1" type="text" name="bookno"></td>
				</tr>

				<tr>
					<th>저 자</th>
					<td><input id="in1" type="text" name="author"></td>
				</tr>

				<tr>
					<th>도서이름</th>
					<td><input id="in1" type="text" name="bookname"></td>
				</tr>

				<tr id="tr_btn">
					<td colspan=2 align=center>
					<input id="btn1" type="button" value="등록" onclick="check()">
					<input id="btn1" type="button" value="취소" onclick="location.href='/HRD0212/index.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>