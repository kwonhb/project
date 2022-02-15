<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 테스트 페이지</title>
<link rel="stylesheet" type="text/css" href="/css/header.css">
<link rel="stylesheet" type="text/css" href="/css/content.css">
</head>
<body>
<header>
	<div class="h1">
		<div class="g1"><a href="#">로그인</a></div>	
		<div class="g1"><a href="#">마이페이지</a></div>
		<div class="g1"><a href="#">관리자 메뉴</a></div>
	</div>
	<div class="h2">
		<div class="g2"><a href="#">픽셀아트</a></div>
		<div class="g2"><a href="#">커뮤니티</a></div>
		<div class="g2"><a href="#">구매페이지</a></div>
	</div>
</header>
<div class="container">
	<div class="side_top">
		<div><p>자유게시판 / ${dto.postid}</p></div>
		<div class="makespace"></div>
		<div>
			<form action="../updateform" method="post">
				<input type="hidden" name="postid" value="${dto.postid}">
				<button type="submit" id="editbtn">수정</button>
			</form>
		</div>
		<div>
			<form action="../delete" method="post">
				<input type="hidden" name="postid" value="${dto.postid}">
				<button type="submit" id="delbtn">삭제</button>
			</form>
		</div>
	</div>
	<div class="side_left">
	</div>
	<div class="side_right">
	</div>
	<div class="center">
		<div class="title">
			<p>[${dto.head}] ${dto.title}</p>
		</div>
		<div class="user">
			<div><h4>${dto.nickname}</h4></div>
			<div><h5><fmt:formatDate value="${dto.postdate}" pattern="yy.MM.dd HH:mm:ss"/></h5></div>
			<div class="makespace"></div> 
			<div><h5>조회 ${dto.readcount} 추천 ${dto.rec} 댓글 ${countReply}</h5></div>
		</div>
		<div class="canvas">
			<input type="hidden" id="pictureid" value="${dto.pictureid}">
			<textarea id="code" class="hidden"></textarea>
			<table class="pixel-canvas"></table>
		</div>
		<div class="content">
		${dto.postcon}
		</div>
		<div class="reply">
			<div class="replytop">
				<div><h5>댓글</h5></div>
				<div><h6 id="countReply">총 ${countReply}개</h6></div>
				<div class="makespace"></div>
				<div><h6 id="replyRefresh">새로고침</h6></div>
			</div>
			<div class="rs">
			<c:forEach items="${rlist}" var="r" varStatus="status">
				<div class="r">
					<div class="r_id"><h5>${r.nickname}</h5></div>
					<div><h5>${r.repcon}</h5></div>
					<div class="makespace"></div>
					<div class="r_del" id="${r.replyid}"><h6>삭제</h6></div>
					<div class="r_date">
						<h6><fmt:formatDate value="${r.replydate}" pattern="yy.MM.dd HH:mm:ss"/></h6>
					</div>					
				</div>
			</c:forEach>
			</div>
		</div>
		<div class="writereply">
			<div class="writereply_1">
				<form class="replyzone" name="replyzone">
					<textarea placeholder="댓글을 작성해주세요." name="repcon" id="repcon"></textarea>
					<input type="hidden" id="userid" name="userid" value="dulgi">
					<input type="hidden" id="nickname" name="nickname" value="bidulgi">
					<input type="hidden" id="postid" name="postid" value="${dto.postid}">
					
				</form>
			</div>
			<div class="writereply_2">
				<p>※ 운영 정책을 위반하는 댓글은 무통보 삭제될 수 있습니다.</p>
				<div class="makespace"></div>
				<button type="button" id="submit">댓글 남기기</button>
				<button type="button" id="recommend">추천 남기기</button>
				<button type="button" id="withrec">댓글 + 추천</button>
			</div>
		</div>
	</div>
</div>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/content.js"></script>
</body>
</html>