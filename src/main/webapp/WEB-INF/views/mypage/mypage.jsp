<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h1>�����������Դϴ�.</h1>
	<br>
	<form>		
		<input type="submit" value="���� �� ��"> 
	</form>	<br>
	<form action="http://localhost:8087/updateform" method="get">
		<input type="submit" value="ȸ�� ����">
	</form>	<br>
	<form>
	
		���� �� ��
		<input type="button" value="+������"> <br>
		<!-- ���� �� �� �ֽ� ������ �ö󰡱� -->
		<br>
		���� �ø� ��ǰ
		<input type="button" value="+������"> <br>
		<!-- ���� �ø� ��Ǯ �ֽ� ������ �ö󰡱� -->
	</form><br>
	<a href="http://localhost:8087/">ó������</a>
	

</body>
</html>