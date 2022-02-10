<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>글 상세</title>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-12">
				<!-- 제목 -->
				<h2>제목 ${dto.title}</h2>
			</div>
		</div>
		<!-- 본문 상세 -->
		<table>
			<tr>
				<td>번호</td>
				<td>${dto.postid}</td>
				<td>작성자</td>
				<td>${dto.userid}</td>
				<td>등록일</td>
				<td><fmt:formatDate value="${dto.postdate }" dateStyle="long" /></td>
				<td>조회수</td>
				<td>${dto.readcount}</td>
			</tr>
		</table>
		<hr>
		
		
		<!-- 그림판, 본문 내용 가져오기 -->
		<div class="row">
			<div class="col-sm-6">
				<div class="canvas">
					<table class="pixel-canvas">그림</table>
					<br>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="row">
					<div class="col-sm-12">
						<pre id="contents">내용 ${dto.postcon}</pre>
					</div>
				</div>
			</div>
		</div>
		<hr>
		
		<!-- 수정, 삭제, 목록으로 이동 -->

		<div class="mb-3" style="float: right;">
			<c:if test="${ user.id == dto.userid }">
				<a href="./update/${dto.postid}"> 
				
				<button type="button" class="btn btn-outline-secondary btn-sm">글 수정</button></a>
				<a id="${dto.postid}" href="./delete">
				<button type="button" class="btn btn-outline-secondary btn-sm">글 삭제</button></a>
			</c:if> <a href="./list">
				<button type="button" class="btn btn-outline-secondary btn-sm">목록으로</button></a>
		</div>


		<!-- 댓글 -->
		<div>
			<c:forEach items="${rList}" var="reply">
				<div>${reply.replyid}
					/
					<fmt:formatDate value="${reply.replydate }" dateStyle="short" />
				</div>
				<div>${reply.repcon}
					<c:if test="${reply.userid == user.id }">
						<button class="dbtn" id="${reply.replyid}">삭제</button>
					</c:if>
				</div>
				<hr>
			</c:forEach>
			<input class="form-control form-control-sm mb-1" type="text"
			name="content" id="content" aria-label=".form-control-sm example">
			<div style="float: right;">
			<button type="button" id="add" class="btn btn-outline-secondary btn-sm">댓글달기</button>
			</div>
		</div>

	</div> 
	
	<!-- 스크립트 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function() {
			$("a[id]").click(function() {
				let no = $(this).attr("id");
				$.ajax({
					url : "/board/delete",
					data : "no=" + no,
					method : "delete"
				}).done(function() {
					location.href = "/board/list";
				})
				return false;
			})//click

			$("#add").click(
					function() {
						let userid = '${user.id}';
						let repcon = $("#content").val();
						/* let replyid = ${dto.replyid}; */

						$.ajax(
								{
									url : "/reply/insert",
									data : "replyid=" + replyid + "&userid="
											+ userid + "&repcon=" + repcon,
									method : "get"
								}).done(function() {
							location.reload();
						});

					})//click

			$(".dbtn").click(function() {
				let replyid = $(this).attr("id");
				$.ajax({
					url : "/reply/delete/" + replyid,
					method : "get"
				}).done(function() {
					location.reload();
				});

			})//click
			


		})//ready
	</script>

</body>
</html>