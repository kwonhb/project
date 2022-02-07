<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>글 상세</title>
</head>
<body>
<table>
	<tr><td>번호</td><td>${dto.postid}</td>
	<tr><td>제목</td><td>${dto.title}</td>
	<tr><td>작성자</td><td>${dto.userid}</td>
	<tr><td>내용</td><td>${dto.postcon}</td>
	<tr><td>등록일</td><td><fmt:formatDate value="${dto.postdate }" dateStyle="long"/></td>
	<tr><td>조회수</td><td>${dto.readcount}</td>
	<tr><td colspan="2" align="right">
	
	<c:if test="${ user.id == dto.userid }">
	<a href="/board/update/${dto.postid}">글 수정 </a> 
	<a id="${dto.postid}" href="#">글 삭제</a>
	</c:if>
	<a href="../list">목록 이동</a> 
	</td></tr>
</table>

<div>
	<c:forEach items="${cList}" var="reply">
		<div>${reply.replyid} / <fmt:formatDate value="${reply.replydate }" dateStyle="short"/></div>
		<div>${reply.repcon} 
		<c:if test="${reply.userid == user.id }">
		<button class="dbtn" id="${reply.replyid}">삭제</button>
		</c:if>
		</div>
		<hr>
	</c:forEach>
	<input name="content" id="content"><button id="add">등록</button>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("a[id]").click(function(){
			let no = $(this).attr("id");
			$.ajax({url:"/board/delete", data:"no="+no, method:"delete"}
			).done(function(){
				location.href="/board/list";
			})
			return false;
		})//click
		
		$("#add").click(function(){
			let userid = '${user.id}';
			let repcon = $("#content").val();
			let replyid = ${dto.replyid};
			
			$.ajax({url:"/reply/insert",
					data:"replyid="+replyid+"&userid="+userid+"&repcon="+repcon,
					method:"get"
			}).done(function(){
					location.reload();		
				});
			
		})//click
		
		$(".dbtn").click(function(){
			let replyid = $(this).attr("id");
			$.ajax({url:"/reply/delete/"+replyid,
				method:"get"
		}).done(function(){
				location.reload();		
			});
			
		})//click
		
	})//ready

</script>

</body>
</html>