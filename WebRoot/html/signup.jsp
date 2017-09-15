<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>

<%
	String msg = (String) request.getAttribute("registerMsg");
	if (msg == null) {
		msg = "";
	}

	String checkbox = (String) request.getAttribute("checkbox");
	if (checkbox == null) {
		checkbox = "";
	} else {
		checkbox = "checked";
	}

	User formbean = (User) request.getAttribute("formbean");
	if (formbean == null) {
		formbean = new User("", "", "", "");
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>注册-FindU失物招领平台</title>

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

	//获取XMLHttpRequest对象
	function getXMLHttpRequest() {
		var xmlhttp;
		if (window.XMLHttpRequest) {//for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		return xmlhttp;
	}

	function checkName() {
		var name = document.getElementById("Name").value;
		//创建XMLHttpRequest对象
		var xhr = getXMLHttpRequest();
		//处理结果
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					var msg=document.getElementById("msg");
					if(xhr.responseText=="name"){
						msg.innerHTML="用户名已存在!";
					}else if(xhr.responseText=="specialName"){
						msg.innerHTML="用户名不得含特殊字符!";
					}else{
						msg.innerHTML="";
					}
				}
			}
		}
		
		//创建连接
		xhr.open("get", "/FindU/servlet/CheckServlet?name=" + name);
			
		//发送请求
		xhr.send(null);
	}
	
	function checkEmail() {
		var email= document.getElementById("Email").value;
		//创建XMLHttpRequest对象
		var xhr = getXMLHttpRequest();
		//处理结果
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					var msg=document.getElementById("msg");
					if(xhr.responseText=="email"){
						msg.innerHTML="邮箱已被注册!";
					}else{
						msg.innerHTML="";
					}
				}
			}
		}
		
		//创建连接
		xhr.open("get", "/FindU/servlet/CheckServlet?email=" + email);
			
		//发送请求
		xhr.send(null);
	}
	
	function checkTel() {
		var tel= document.getElementById("Tel").value;
		//创建XMLHttpRequest对象
		var xhr = getXMLHttpRequest();
		//处理结果
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					var msg=document.getElementById("msg");
					if(xhr.responseText=="tel"){
						msg.innerHTML="手机已被注册!";
					}else{
						msg.innerHTML="";
					}
				}
			}
		}
		
		//创建连接
		xhr.open("get", "/FindU/servlet/CheckServlet?tel=" + tel);
			
		//发送请求
		xhr.send(null);
	}
	/* function check(){
		document.getElementById("Regist").submit();
	} */
</script>
<!-- //language-select -->
</head>

<body>
	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp"%>

	<!-- sign up form -->
	<section>
		<div id="agileits-sign-in-page" class="sign-in-wrapper">
			<div class="agileinfo_signin">
				<h3>注册</h3>
				<form id="Regist" action="/FindU/servlet/RegisterServlet" method="post">
					<input type="text" onBlur="checkName()" id="Name" name="Name"
						placeholder="用户名" required="" value="<%=formbean.getName()%>">
					<input type="email" onBlur="checkEmail()" id="Email" name="Email" placeholder="邮箱" required=""
						value="<%=formbean.getEmail()%>"> <input type="tel"
						name="tel" onBlur="checkTel()" id="Tel" placeholder="手机号" required=""
						value="<%=formbean.getPhone()%>"> <input type="password"
						name="Password" placeholder="密码" required=""
						value="<%=formbean.getPassword()%>"> <input
						type="password" name="Repassword" placeholder="确认密码" required=""
						value="<%=formbean.getPassword()%>">
					<div class="signin-rit">
						<span class="agree-checkbox"> <label class="checkbox"><input
								type="checkbox" name="checkbox" <%=checkbox%>>我同意该网站<a
								class="w3layouts-t" href="terms.jsp" target="_blank">使用条款</a>以及<a
								class="w3layouts-t" href="privacy.jsp" target="_blank">隐私政策</a>
						</label> </span>
					</div>
					<br> <br> <font color='#ff0000'><span id="msg"><span><%=msg%></font> 
					<input type="submit" value="注册账号"> <a href="/FindU/html/signin.jsp"><input type="button" value="返回登录"> </a>
				</form>
			</div>
		</div>
	</section>
	<!-- //sign up form -->

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