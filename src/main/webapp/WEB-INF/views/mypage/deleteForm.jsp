<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� Ż��</title>
</head>
<body>
<h3>���� �������Դϴ�. ��й�ȣ�� �Է��ϼ���</h3>
<form method="post" onsubmit="checkVal()" action="delete">
	<label for="pw"></label>
	<input type="password" name="formpw" id="password">
	
	<input type="submit" value="ȸ�� Ż��">
</form>
<script type="text/javascript">
	function checkVal(){
		let pw = document.querySelector("#pw").value;
		if(!pw){
			alert("��й�ȣ�� �Է��ϼ���")
			return false;
		}
	}
	
	
</script>
</body>
</html>