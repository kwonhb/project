<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="en">
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

<title>글 쓰기</title>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<div class="container" style="margin-top:30px">

		<form action="./boardwrite" method="post">
			<h3>글 쓰기</h3>
			<br>

			<!-- 카테고리 선택 -->
			<select class="w-25" aria-label="Default select example">
				<option selected>카테고리</option>
				<option value="notice">공지</option>
				<option value="freetolk">잡담</option>
				<option value="questions">질문</option>
				<option value="boast">자랑</option>
				<option value="5">5</option>
			</select>
			<div class="mb-3">
				<label for="userid" class="form-label"></label> 
				<input type="text" name="userid"
					class="form-control" id="userid" value="${user.id}" readonly>
			</div>
			
			<!-- 제목, 내용 입력칸 -->

			<div class="mb-3">
				<label for="title" class="form-label"></label> 
				<input type="text" name="title"
					class="form-control form-control-lg" id="title" placeholder="제목 입력">
			</div>

			<div class="mb-3">
				<label for="con" class="form-label"></label>
				<textarea class="form-control" name="postcon" id="postcon" rows="20"
					placeholder="내용 입력"></textarea>
			</div>

			<!-- 그림추가하기? -->
			<div class="mb-3">
				<label for="pictureid" class="form-label"></label> 
				<input type="text" name="pictureid"
					class="form-control" id="pictureid" placeholder="사진 코드 입력">
			</div>

			
			<button type="submit" class="btn btn-outline-dark">저장</button>
		</form>

	</div>
</body>
</html>