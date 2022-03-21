<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" type="text/css" href="/css/index.css">

</head>
<body>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>

<!-- 컨테이너 -->
<div class="container">

	<!-- 움직이는 텍스트 -->
<div class="marquee">
  <div class="marquee__inner" aria-hidden="true">
    <span> DROP THE BEADS &</span>
    <span> DROP THE BEADS &</span>
    <span> DROP THE BEADS &</span>
    <span> DROP THE BEADS &</span>
  </div>
</div>

	<!-- 그림판 예시 누르면 그림판 이동 -->
	
	<div class="main1">
		<h3>직접 그려서 만들고 자랑해봐요!</h3>
		<ul class="main1_1">
		<div class="abox">
			<li><img class="mainimage" src="/image/mong.gif"></li>
	 		<li><img class="mainimage" src="/image/apple.png"></li>
		  	<li><img class="mainimage" src="/image/rabbit.png"></li>
	  	<a href="/painter/painter"><div class="htext"><p>눌러서 그림판 이동!</p></div></a>
	  	</div>
	  	</ul>
	</div>
	
	<div class="clear"></div>
	
	
	<!-- 게시판 인기글 -->
	<div class="main2">
		<h3>게시판 인기글</h3>

		<ul class="main2_1">
			<!-- 1번 -->
		  	<li class="boardc1">
				<a href="/board/content/${bb1.postid}">
					<input type="hidden" id="pictureid1" value="${bb1.pictureid}">
					<textarea style="display:none" id="code1" class="hidden"></textarea>
					<table id="pixel-canvas1"></table>
				<h5 class="card-title"> ${bb1.title} 
			    	<span class="read">조회수 ${bb1.readcount}</span></h5>
			    <div class="card-text"><p>${bb1.userid}</p><p> ${bb1.postcon}</p></div>
				</a>
			</li>
			
			<!-- 2번 -->
		  	<li class="boardc2">
				<a href="/board/content/${bb2.postid}">
					<input type="hidden" id="pictureid2" value="${bb2.pictureid}">
					<textarea style="display:none" id="code2" class="hidden"></textarea>
					<table id="pixel-canvas2"></table>
			    <h5 class="card-title"> ${bb2.title} 
			    	<span class="read">조회수 ${bb2.readcount}</span></h5>
			    <div class="card-text"><p>${bb2.userid}</p><p> ${bb2.postcon}</p></div>
				</a>
			</li>
			
			<!-- 3번 -->
	  		<li class="boardc3">
				<!-- 그림가져오기 -->
				<a href="/board/content/${bb3.postid}">
					<input type="hidden" id="pictureid3" value="${bb3.pictureid}">
					<textarea style="display:none" id="code3" class="hidden"></textarea>
					<table id="pixel-canvas3"></table>
			    <h5 class="card-title"> ${bb3.title} 
			    	<span class="read">조회수 ${bb3.readcount}</span></h5>
			    <div class="card-text"><p>${bb3.userid}</p><p> ${bb3.postcon}</p></div>
			    </a>
			</li>
		</ul>			
	</div>

	
	<!-- 벼룩 최신글 --> 
	<div class="main3">
	<h3>벼룩 시장</h3>
		<ul class="main3_1">
		<!-- 1번 -->
			<li class="boardf1">
				<!-- 그림가져오기 -->
				<a id="fpicadd1" href="/flea/fcontent/${ff1.f_postno}">
				<input type="hidden" id="fpic1" value="${fi1.imgpath}">
			    <h5 class="card-title"> [${ff1.f_category}] ${ff1.f_title} 
			    	<span class="read">조회수 ${ff1.f_viewcount}</span></h5>
			    	<input type="hidden" id="boardf1" value="${ff1.userid}">
			    	<div class="card-text"><p>${ff1.userid}</p><p> ${ff1.f_content}</p></div>
			    </a>
			</li>
		<!-- 2번 -->
			<li class="boardf2">
				<!-- 그림가져오기 -->
				<a id="fpicadd2" href="/flea/fcontent/${ff2.f_postno}">
				<input type="hidden" id="fpic2" value="${fi2.imgpath}">
			    <h5 class="card-title"> [${ff2.f_category}] ${ff2.f_title} 
			    	<span class="read">조회수 ${ff2.f_viewcount}</span></h5>
			    	<input type="hidden" id="boardf2" value="${ff2.userid}">
			    	<div class="card-text"><p>${ff2.userid}</p><p> ${ff2.f_content}</p></div>
			    </a>
			</li>
		<!-- 3번 -->
			<li class="boardf3">
				<!-- 그림가져오기 -->
				<a id="fpicadd3" href="/flea/fcontent/${ff3.f_postno}">
				<input type="hidden" id="fpic3" value="${fi3.imgpath}">
			    <h5 class="card-title"> [${ff3.f_category}] ${ff3.f_title} 
			    	<span class="read">조회수 ${ff3.f_viewcount}</span></h5>
			    	<input type="hidden" id="boardf3" value="${ff3.userid}">
			    	<div class="card-text"><p>${ff3.userid}</p><p> ${ff3.f_content}</p></div>
			    </a>
			</li>
		</ul>
		
	</div>
	
</div>

<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>

<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/index.js"></script>


</body>
</html> 