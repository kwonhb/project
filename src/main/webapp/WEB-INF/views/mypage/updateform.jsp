<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ����</title>
</head>
<body>
	<style>
		 form {font-size : 150%;  margin: 20px;}
	</style>
	
	<form action="http://localhost:8087/Mypage" method="get">		
		<input type="submit" value="���� �� ��"> 
	
	<input type="button" value="ȸ�� ����">
	</form>
	
	<form action="update" method="post" id="Mypage">
		
		<label for="id">ID </label>
		<input type="text" id="id" value="${user.id}" readonly><br>

		<label for="pw">PW </label> 
		<input type="password" name="pw" id="pw1" placeholder="8~16�ڸ��� ����,����,Ư�����ڸ� �����Ͽ� �����Ͻÿ�" required><br>

		<label for="pw">PWȮ�� </label> 
		<input type="password" name="pw" id="pw2" placeholder="�� ��й�ȣ�� ��ġ�ϰ� �����Ͻÿ�" required><br>

		<label for="nickname">�г��� </label> 
		<input type="text" id="nickname" value="${user.nickname}">
		<input type="button" name="nickname" id="nn_check" value="�ߺ�Ȯ��"><span id="nn_msg"></span><br>

		<label for="email">�̸��� </label> 
		<input type="email" name="email" id="email" value="${user.email}"><br>

		<label for="gender">���� </label>
		<input type="radio" id="gender" name="gender" value="male">����
		<input type="radio" id="gender" name="gender" value="female">����<br>
		
		�ּ�
		<input type="text"  id="address" name="address" placeholder="�����ȣ" value="${user.address}"> 
		<input type="button"  id="addbtn" value="�����ȣ ã��" onclick="addPost()"><br>
		<input type="text" name="address1" placeholder="��� �ּ�">
		<br>
		
		<label for="date">������� </label>
		<input type="date" name="date" id="date" 
			value='<fmt:formatDate value="${user.date}" pattern="yyyyMMdd"/>'><br> 
		
		<input type="submit" value="�Ϸ�">
		<input type="reset" value="���">
	
		</form>
		
		<form action="DeleteForm">
			<label for="drop">ȸ��Ż�� </label>
			<input type="submit" id="drop" name="delete" value="Ż�� ����"><br> 
		</form>
		

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function addPost(){
	new daum.Postcode({
		oncomplete: function(date) {
			document.querySelector("#address").value = data.address;
		}
	}).open();
}

$(function(){
	$("#pw2").outfocus(function(){
		if("#pw1"=="#pw2"){
			getelementid
			print("��� ������ ��й�ȣ�Դϴ�.")
		}else{
			print("�� ��й�ȣ�� ��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.")
		}
		
	})
	
})

	
$(function(){
	$("#nn_check").click(function(){ 
		let nickname = $("#nickname").val(); //�˻��� ���� �����´�
		if(!nickname){ 
			$("#nn_msg").html("�г��Ӹ� �Է��ϼ���") //�ߺ��� ��� ���� �޼���
			return false;
		}//��ȿ�� �˻�
		$.ajax({url:"/nnCheck", data:"nickname="+nickname, datatype:"text"} //�˻��� nickname������ �˻��� nickname�� ������ 
		).done(function(data){ //�˻��� data �޾ƿ���
			
			if(data == ""){
				$("#nn_msg").html("��� ������ �г����Դϴ�.")
				$("#nn_msg").append("<input type='hidden' id='nn_ck' value='1'>")
				//�г��� �˻��ϰ� �Ⱥ��̵��� '1'�� ���� �ִ´�
			}else{
				$("#nn_msg").html("�̹� ������� �г��� �Դϴ�.")
			}
		}) //���̵� �ߺ� Ȯ��
	});//click
})//ready
</script>
</body>
</html>










