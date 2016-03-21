<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="js/jquery-1.8.2.min.js"></script>
	<script type="application/javascript" src="js/main.js"></script>

<title>登陆页面</title>
</head>
<body>
	<form action="index" method="post">
		<input type="text" name="name"> <input type="password"
			name="password"> <input type="submit" value="确认">
	</form>
	<form method="post" action="/test">

		<input name="id">
		<button type="submit">


			test

		</button>

		<a href="/test?id=3">AAA</a>

	</form>
	${user.id}

	<a href="/test/ww">ww</a>

	<a href="/test/aa">aa</a>

	<a href="/test/bb">bb</a>

	<a href="/test/cc">cc</a>
	<button type="button" onclick="test1()">submit</button>
	<button type="button" onclick="test2()">submit</button>
	<button type="button" onclick="test3()">submit</button>

	<form method="post" action="/upload" enctype="multipart/form-data">
		Desc<input type="text" name="desc"/>
		File<input type="file" name="file">
		<button type="submit">upload</button>


	</form>

</body>
</html>