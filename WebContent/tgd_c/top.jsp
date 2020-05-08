<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/tgd_c/css/tgd.css">

<script src="<%=request.getContextPath()%>/tgd_c/js/tgd.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-4">
				<br> <a href="index.jsp"><img
					src="https://d4fodtu7cqfym.cloudfront.net/images/logo_new.png">
				</a>
			</div>
			<div class="col-xs-8" align="right">
				<br>
				<form action="#" method="get" id="main_search_form_c"
					class="form-inline">
					<div class="form-group">
						<input type="text" placeholder="트게더 검색" id="" name=""
							class="form-control" />
						<button type="button" id="" class="btn"
							style="background-color: white !important">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>

					</div>
				</form>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row" id="main_menubar_c">
			<div id="header-menu-left" class="col-xs-2" align="left">
				<div class="col-xs-4" style="padding: 0px">
					<div class="dropdown">
						<button class="btn dropdown-toggle"
							style="background-color: white !important" type="button"
							id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true"
							style="width: 100%">
							최근 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu"
							aria-labelledby="dropdownMenu1">
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Action</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Another action</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Something else here</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Separated link</a></li>
						</ul>
					</div>
				</div>

				<div class="col-xs-4" style="padding: 0px">
					<div class="dropdown">
						<button class="btn dropdown-toggle"
							style="background-color: white !important" type="button"
							id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true"
							style="width: 100%">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu"
							aria-labelledby="dropdownMenu1">
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Action</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Another action</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Something else here</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Separated link</a></li>
						</ul>
					</div>
				</div>
				<div class="col-xs-4" style="padding: 0px">
					<div class="dropdown">
						<button class="btn dropdown-toggle"
							style="background-color: white !important" type="button"
							id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true"
							style="width: 100%">
							<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu"
							aria-labelledby="dropdownMenu1">
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Action</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Another action</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Something else here</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Separated link</a></li>
						</ul>
					</div>
				</div>



			</div>
			<div class="col-xs-8" align="center"></div>
			<div class="col-xs-2" align="right">
				<button type="button" class="btn btn-lg" style="background-color: white !important">
					<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
				</button>
				<button type="button" class="btn btn-lg" style="background-color: white !important">
					<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				</button>
			</div>
		</div>
	</div>



</body>
</html>