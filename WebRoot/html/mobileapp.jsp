<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>FindU手机APP下载-FindU失物招领平台</title>
<link rel="shortcut icon" href="/FindU/html/images/findu.ico">
<link rel="Bookmark" href="/FindU/html/images/findu.ico" />
<link rel="stylesheet" href="/FindU/html/css/bootstrap.min.css"><!-- bootstrap-CSS -->
<link rel="stylesheet" href="/FindU/html/css/bootstrap-select.css"><!-- bootstrap-select-CSS -->
<link href="/FindU/html/css/style.css" rel="stylesheet" type="text/css" media="all" /><!-- style.css -->
<link rel="stylesheet" href="/FindU/html/css/font-awesome.min.css" /><!-- fontawesome-CSS -->
<link rel="stylesheet" href="/FindU/html/css/menu_sideslide.css" type="text/css" media="all"><!-- Navigation-CSS -->
<!-- meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<!-- //meta tags -->
<!--fonts-->
<link href='/FindU/html/fonts/font1.css' rel='stylesheet' type='text/css'>
<link href='/FindU/html/fonts/font2.css' rel='stylesheet' type='text/css'>
<!--//fonts-->	
<!-- js -->
<script type="text/javascript" src="/FindU/html/js/jquery.min.js"></script>
<!-- js -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/FindU/html/js/bootstrap.js"></script>
<script src="/FindU/html/js/bootstrap-select.js"></script>
<script>
  $(document).ready(function () {
    var mySelect = $('#first-disabled2');

    $('#special').on('click', function () {
      mySelect.find('option:selected').prop('disabled', true);
      mySelect.selectpicker('refresh');
    });

    $('#special2').on('click', function () {
      mySelect.find('option:disabled').prop('disabled', false);
      mySelect.selectpicker('refresh');
    });

    $('#basic2').selectpicker({
      liveSearch: true,
      maxOptions: 1
    });
  });
</script>
<!-- language-select -->
<script type="text/javascript" src="/FindU/html/js/jquery.leanModal.min.js"></script>
<link href="/FindU/html/css/jquery.uls.css" rel="stylesheet"/>
<link href="/FindU/html/css/jquery.uls.grid.css" rel="stylesheet"/>
<link href="/FindU/html/css/jquery.uls.lcd.css" rel="stylesheet"/>
<!-- Source -->
<script src="/FindU/html/js/jquery.uls.data.js"></script>
<script src="/FindU/html/js/jquery.uls.data.utils.js"></script>
<script src="/FindU/html/js/jquery.uls.lcd.js"></script>
<script src="/FindU/html/js/jquery.uls.languagefilter.js"></script>
<script src="/FindU/html/js/jquery.uls.regionfilter.js"></script>
<script src="/FindU/html/js/jquery.uls.core.js"></script>
<script>
			$( document ).ready( function() {
				$( '.uls-trigger' ).uls( {
					onSelect : function( language ) {
						var languageName = $.uls.data.getAutonym( language );
						$( '.uls-trigger' ).text( languageName );
					},
					quickList: ['en', 'hi', 'he', 'ml', 'ta', 'fr'] //FIXME
				} );
			} );
		</script>
<!-- //language-select -->
</head>
<body>
	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp" %>
	<!-- breadcrumbs -->
	<div class="w3layouts-breadcrumbs text-center">
		<div class="container">
			<span class="agile-breadcrumbs"><a href="/FindU/html/index.jsp"><i class="fa fa-home home_1"></i></a> / <span>手机 APP</span></span>
		</div>
	</div>
	<!-- //breadcrumbs -->
	<!-- Terms of use -->
	<div class="mobileapp main-grid-border">
		<div class="container">
			<div class="wthree-mobile-app">
				<form action="/FindU/servlet/AppDownloadServlet" method="get"> 
					<input class="text" type="email" name="email" placeholder="输入你的邮箱地址" required="">
					<input type="submit" value="发送下载链接">
				</form>
			</div>
			<div class="app">
				<div class="col-md-5 app-left mpl">
					<h2>最新发布的FindU失物招领手机APP!</h2>
					<p>在手机上简单实现发布失物招领，并且还能快速便捷帮您找回你的失物.</p>
					<div class="agileinfo-dwld-app">
							<h6>下载该应用 : 
								<a href="#"><i class="fa fa-apple"></i></a>
								<a href="#"><i class="fa fa-windows"></i></a>
								<a href="#"><i class="fa fa-android"></i></a>
							</h6>
						</div>
				</div>
				<div class="col-md-7 agile-app-image">
					<img src="images/mob2.png" alt="">
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="app-bottom-grids text-center">
			<div class="container">
				<div class="col-md-3 app-bottom-grid">
					<i class="fa fa-search"></i>
					<h3>物品搜索</h3>
					<p>你可以快速搜索你丢失物品的特征、地点等信息来找到别人发布的失物招领.</p>
				</div>
				<div class="col-md-3 app-bottom-grid">
					<i class="fa fa-bell-o"></i>
					<h3>消息通知</h3>
					<p>一旦有新的申请人、回复评论者你会立即收到消息通知，不错过每一个通知.</p>
				</div>
				<div class="col-md-3 app-bottom-grid">
					<i class="fa fa-plus"></i>
					<h3>发布失物招领</h3>
					<p>你可以快速发布你拾到的物品的类别、特征、地点等信息来帮助别人找回失物.</p>
				</div>
				<div class="col-md-3 app-bottom-grid">
					<i class="fa fa-reply-all"></i>
					<h3>评论回复</h3>
					<p>你也可以快速评论留言别人发布的失物招领.</p>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>	
	</div>
	<!-- // Terms of use -->
	<%@include file="footer.jsp"%>
</body>
		<!-- Navigation-JavaScript -->
			<script src="/FindU/html/js/classie.js"></script>
			<script src="/FindU/html/js/main.js"></script>
		<!-- //Navigation-JavaScript -->
		<!-- here stars scrolling icon -->
			<script type="text/javascript">
				$(document).ready(function() {
					/*
						var defaults = {
						containerID: 'toTop', // fading element id
						containerHoverID: 'toTopHover', // fading element hover id
						scrollSpeed: 1200,
						easingType: 'linear' 
						};
					*/
										
					$().UItoTop({ easingType: 'easeOutQuart' });
										
					});
			</script>
			<!-- start-smoth-scrolling -->
			<script type="text/javascript" src="/FindU/html/js/move-top.js"></script>
			<script type="text/javascript" src="/FindU/html/js/easing.js"></script>
			<script type="text/javascript">
				jQuery(document).ready(function($) {
					$(".scroll").click(function(event){		
						event.preventDefault();
						$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
					});
				});
			</script>
			<!-- start-smoth-scrolling -->
		<!-- //here ends scrolling icon -->
</html>
