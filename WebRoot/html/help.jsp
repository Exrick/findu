<%@ page language="java" import="java.util.*,com.findu.entity.*,com.findu.dao.*" contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>帮助-FindU失物招领平台</title>
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
	
    <script type="application/x-javascript">
    addEventListener("load", function() {
        setTimeout(hideURLbar, 0);
    }, false);
    </script>
    
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
            liveSearch: true,
            maxOptions: 1
        });
    });
    </script>
    <!-- language-select -->
    <script type="text/javascript" src="/FindU/html/js/jquery.leanModal.min.js"></script>
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
            onSelect: function(language) {
                var languageName = $.uls.data.getAutonym(language);
                $('.uls-trigger').text(languageName);
            },
            quickList: ['en', 'hi', 'he', 'ml', 'ta', 'fr'] //FIXME
        });
    });
    </script>
    <!-- //language-select -->
</head>
<body>
	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp" %>
	<!-- breadcrumbs -->
	<div class="w3layouts-breadcrumbs text-center">
		<div class="container">
			<span class="agile-breadcrumbs"><a href="/FindU/html/index.jsp"><i class="fa fa-home home_1"></i></a> / <span>帮助</span></span>
		</div>
	</div>
	<!-- //breadcrumbs -->
	<!-- Faq -->
	<div class="faq main-grid-border">
		<div class="container">
			<div class="wthree-help">
				<h3>我 们 如 何 帮 助 您 ？</h3>
				<form action="#" method="get"> 
					<textarea placeholder="请输入您的疑问，我们将尽快为您解答..." name="Message" required=""></textarea>
					<input type="submit" value="提交">
				</form>
				<h5>或者</h5>
				<a href="contact.jsp">联系我们</a>
			</div>
			<h2 class="w3-head">常见问题</h2>
			<dl class="faq-list">
				<dt class="faq-list_h">
				<h4 class="marker">Q?</h4>
				<h5 class="marker_head">为何我不能登录或注册 ?</h5>
				</dt>
				<dd>
				<h4 class="marker1">A.</h4>
				<p class="m_13">请确保你所填登录账号密码正确；确保注册时所填信息正确；确保所注册的名称、手机和邮箱未注册过，若已被注册，请更换重新填写.</p>
				</dd>
				<dt class="faq-list_h">
				<h4 class="marker">Q?</h4>
				<h5 class="marker_head">为何我不能发布失物招领 ?</h5>
				</dt>
				<dd>
				<h4 class="marker">A.</h4>
				<p class="m_13">请先登陆后再发布失物招领，若没有账号请先注册账号；请确保所填发布信息符合要求.</p>
				</dd>
				<dt class="faq-list_h">
				<h4 class="marker">Q?</h4>
				<h5 class="marker_head">密码忘记了如何找回?</h5>
				</dt>
				<dd>
				<h4 class="marker">A.</h4>
				<p class="m_13">您可以点击登录界面的忘记密码进行下一步操作找回您的密码.</p>
				</dd>
				<dt class="faq-list_h">
				<h4 class="marker">Q?</h4>
				<h5 class="marker_head">为什么已经登录了还提示要登录 ?</h5>
				</dt>
				<dd>
				<h4 class="marker">A.</h4>
				<p class="m_13">由于浏览器兼容问题，一些使用360浏览器的用户会常出现此类情况，请出现此类情况的朋友更换浏览器进行尝试.</p>
				</dd>
				<dt class="faq-list_h">
				<h4 class="marker">Q?</h4>
				<h5 class="marker_head">如何登陆账号 ?</h5>
				</dt>
				<dd>
				<h4 class="marker">A.</h4>
				<p class="m_13">点击页面右上角登录字样进行下一步操作.</p>
				</dd>
				<dt class="faq-list_h">
				<h4 class="marker">Q?</h4>
				<h5 class="marker_head">如何注册账号 ?</h5>
				</dt>
				<dd>
				<h4 class="marker">A.</h4>
				<p class="m_13">点击页面右上角注册字样进行下一步操作.</p>
				</dd>
				<dt class="faq-list_h">
				<h4 class="marker">Q?</h4>
				<h5 class="marker_head">如何申领别人发布的失物招领 ?</h5>
				</dt>
				<dd>
				<h4 class="marker">A.</h4>
				<p class="m_13 last_2">在物品页面详情页中右下角找到并点击申请物品字样进行下一步操作，申领前请登录您的账号.</p>
				</dd>
          </dl>

		</div>	
	</div>
	<!-- // Faq -->
	<%@include file="footer.jsp"%>
	
		<!-- Navigation-JavaScript -->
			<script src="js/classie.js"></script>
			<script src="js/main.js"></script>
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
			<script type="text/javascript" src="js/move-top.js"></script>
			<script type="text/javascript" src="js/easing.js"></script>
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
</body>
</html>