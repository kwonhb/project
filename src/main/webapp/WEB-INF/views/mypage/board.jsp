<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/mypage/mine.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
<div class="side_left"></div>
<div class="center">
<div class="top">
	<div><p>${userid}님의 페이지입니다.</p></div>
</div>	
<div class="menubar">
	<div class="menu selected"><p>커뮤니티 - 글</p></div>
	<div class="menu"><p>커뮤니티 - 댓글</p></div>
	<div class="menu"><p>그림판</p></div>
	<div class="menu"><p>벼룩시장 - 글</p></div>
	<div class="menu"><p>벼룩시장 - 댓글</p></div>
</div>
<div class="con">
	<c:choose>
		<c:when test="${blist == 'none'}">
			<div class="none">
				<p>글이 없대.</p>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${blist}" var="b" varStatus="bs">
				<div class="trace" id="board_${b.postid}">
					<div class="t1">
						<h5>${b.title}</h5>
						<h6><fmt:formatDate value="${b.postdate}" pattern="yy.MM.dd" /></h6>
					</div>
					<div class="t2">
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>

</div>
<div class="side_right"></div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/mypage/mine.js"></script>
</html>