<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>

<%
	String msg = (String) request.getAttribute("Msg");
	if (msg == null) {
		msg = "";
	}

	String tempname = (String) request.getAttribute("tempname");
	if (tempname == null) {
		tempname = "";
	}

	User u3 = (User) session.getAttribute("user");

	if (u3 != null) {
		request.setAttribute("loginMsg", "您已未登录，请勿重复操作!");
		request.getRequestDispatcher("/html/message.jsp").forward(
				request, response);
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>登录-FindU失物招领平台</title>
<link rel="shortcut icon" href="/FindU/html/images/findu.ico">
<link rel="Bookmark" href="/FindU/html/images/findu.ico" />
<link rel="stylesheet" href="/FindU/html/css/bootstrap.min.css">
<!-- bootstrap-CSS -->
<link rel="stylesheet" href="/FindU/html/css/bootstrap-select.css">
<!-- bootstrap-select-CSS -->
<link href="/FindU/html/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- style.css -->
<link rel="stylesheet" href="/FindU/html/css/font-awesome.min.css" />
<!-- fontawesome-CSS -->
<link rel="stylesheet" href="/FindU/html/css/menu_sideslide.css"
	type="text/css" media="all">
<!-- Navigation-CSS -->
<!-- meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />

<!-- //meta tags -->
<!--fonts-->
<link href='/FindU/html/fonts/font1.css' rel='stylesheet'
	type='text/css'>
<link href='/FindU/html/fonts/font2.css' rel='stylesheet'
	type='text/css'>
<!--//fonts-->
<!-- js -->
<script type="text/javascript" src="/FindU/html/js/jquery.min.js"></script>
<!-- js -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/FindU/html/js/bootstrap.js"></script>
<script src="/FindU/html/js/bootstrap-select.js"></script>
<script>
	$(document).ready(function() {
		var mySelect = $('#first-disabled2');

		$('#special').on('click', function() {
			mySelect.find('option:selected').prop('disabled', true);
			mySelect.selectpicker('refresh');
		});

		$('#special2').on('click', function() {
			mySelect.find('option:disabled').prop('disabled', false);
			mySelect.selectpicker('refresh');
		});

		$('#basic2').selectpicker({
			liveSearch : true,
			maxOptions : 1
		});
	});
</script>

<!-- language-select -->
<script type="text/javascript"
	src="/FindU/html/js/jquery.leanModal.min.js"></script>
<link href="/FindU/html/css/jquery.uls.css" rel="stylesheet" />
<link href="/FindU/html/css/jquery.uls.grid.css" rel="stylesheet" />
<link href="/FindU/html/css/jquery.uls.lcd.css" rel="stylesheet" />
<!-- Source -->
<script src="/FindU/html/js/jquery.uls.data.js"></script>
<script src="/FindU/html/js/jquery.uls.data.utils.js"></script>
<script src="/FindU/html/js/jquery.uls.lcd.js"></script>
<script src="/FindU/html/js/jquery.uls.languagefilter.js"></script>
<script src="/FindU/html/js/jquery.uls.regionfilter.js"></script>
<script src="/FindU/html/js/jquery.uls.core.js"></script>
<script>
	$(document).ready(function() {
		$('.uls-trigger').uls({
			onSelect : function(language) {
				var languageName = $.uls.data.getAutonym(language);
				$('.uls-trigger').text(languageName);
			},
			quickList : [ 'en', 'hi', 'he', 'ml', 'ta', 'fr' ]
		//FIXME
		});
	});
</script>
<!-- //language-select -->
</head>
<body>

	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp"%>

	<!-- sign in form -->
	<section>
		<div id="agileits-sign-in-page" class="sign-in-wrapper">
			<div class="agileinfo_signin">
				<h3>登录</h3>
				<form action="/FindU/html/LoginServlet" method="post">
					<input type="text" name="Name" placeholder="手机号或邮箱" required=""
						value="<%=tempname%>"> <input type="password"
						name="Password" placeholder="密码" required=""> <font
						color='#ff0000'><%=msg%></font> <input type="submit" value="登录">
					<div class="forgot-grid">
						<label class="checkbox"><input type="checkbox"
							name="checkbox">记住密码</label>
						<div class="forgot">
							<a href="#" data-toggle="modal" data-target="#myModal2">忘记密码?</a>
						</div>
				</form>
				<!-- Modal -->
				<div class="modal fade" id="myModal2" role="dialog">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h3 class="w3ls-password">找回密码</h3>
									<p class="get-pw">在下方输入你的邮箱我们会给你发送一封找回密码的邮件</p>
									<form action="/FindU/servlet/LoginServlet" method="post">
										<input type="text" class="user" name="email"
											placeholder="请输入你的邮箱地址" required=""> <input
											type="submit" value="提交">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<h6>
				还没有账号? <a href="/FindU/html/signup.jsp">现在就去注册</a>
			</h6>
		</div>
		</div>
	</section>
	<!-- //sign in form -->

	<%@include file="footer.jsp"%>

	<!-- Navigation-JavaScript -->
	<script src="/FindU/html/js/classie.js"></script>
	<script src="/FindU/html/js/main.js"></script>
	<!-- //Navigation-JavaScript -->

	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({
				easingType : 'easeOutQuart'
			});
		});
	</script>
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="/FindU/html/js/move-top.js"></script>
	<script type="text/javascript" src="/FindU/html/js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- start-smoth-scrolling -->
	<!-- //here ends scrolling icon -->
</body>
</html>
