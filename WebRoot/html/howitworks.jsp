<%@ page language="java" import="java.util.*,com.findu.entity.*,com.findu.dao.*" contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>怎样操作-FindU失物招领平台</title>
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
			<span class="agile-breadcrumbs"><a href="/FindU/html/index.jsp"><i class="fa fa-home home_1"></i></a> / <span>怎样操作</span></span>
		</div>
	</div>
	<!-- //breadcrumbs -->
	<!-- How it works -->
		<div class="work-section">
			<div class="container">
				<h2 class="w3-head">怎样操作</h2>
					<div class="work-section-head text-center">
						<p>快捷、简单地发布你拾取的物品, 并迅速找到你丢失的物品.</p>
					</div>
					<div class="work-section-grids text-center">
						<div class="col-md-3 work-section-grid">
							<i class="fa fa-pencil-square-o"></i>
							<h4>发布失物招领</h4>
							<p>点击右上角发布失物招领按钮，填写物品具体信息就能发布你拾到的物品</p>
							<span class="arrow1"><img src="images/arrow1.png" alt="" /></span>
						</div>
						<div class="col-md-3 work-section-grid">
							<i class="fa fa-eye"></i>
							<h4>寻找丢失物品</h4>
							<p>搜索你丢失物品的关键词，如名称、丢失地点等信息快速找到你的失物</p>
							<span class="arrow2"><img src="images/arrow2.png" alt="" /></span>
						</div>
						<div class="col-md-3 work-section-grid">
							<i class="fa fa-phone"></i>
							<h4>联系拾到者</h4>
							<p>找到你的失物详情后，即可申请认领并联系拾到者</p>
							<span class="arrow1"><img src="images/arrow1.png" alt="" /></span>
						</div>
						<div class="col-md-3 work-section-grid">
							<i class="fa fa-money"></i>
							<h4>找回失物</h4>
							<p>与拾到者进行联系，找回你的失物</p>
						</div>
						<div class="clearfix"></div>
						<a class="work" href="post-ad.jsp">现在就去发布</a>
					</div>
				</div>
		</div>	
		<div class="happy-clients">
				<div class="container">
					<div class="happy-clients-head text-center wow fadeInRight" data-wow-delay="0.4s">
						<h3>满意的使用者</h3>
						<p>使用我们平台找回失物的用户们</p>
					</div>
					<div class="happy-clients-grids">
						<div class="col-md-6 happy-clients-grid wow bounceIn" data-wow-delay="0.4s">
							<div class="client">
								<img src="images/client_1.jpg" alt="" />
							</div>
							<div class="client-info">
								<p><img src="images/open-quatation.jpg" class="open" alt="" />Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make.<img src="images/close-quatation.jpg" class="closeq" alt="" /></p>
								<h4><a href="#">Darwin Michle, </a>Project manager</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-6 happy-clients-grid span_66 wow bounceIn" data-wow-delay="0.4s">
							<div class="client">
								<img src="images/client_2.jpg" alt="" />
							</div>
							<div class="client-info">
								<p><img src="images/open-quatation.jpg" class="open" alt="" />Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.<img src="images/close-quatation.jpg" class="closeq" alt="" /></p>
								<h4><a href="#">Madam Elisabath, </a>Creative Director</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-6 happy-clients-grid wow bounceIn" data-wow-delay="0.4s">
							<div class="client">
								<img src="images/client_3.jpg" alt="" />
							</div>
							<div class="client-info">
								<p><img src="images/open-quatation.jpg" class="open" alt="" />Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make.<img src="images/close-quatation.jpg" class="closeq" alt="" /></p>
								<h4><a href="#">Clips arter, </a>Lipsum director</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-6 happy-clients-grid span_66 wow bounceIn" data-wow-delay="0.4s">
							<div class="client">
								<img src="images/client_4.jpg" alt="" />
							</div>
							<div class="client-info">
								<p><img src="images/open-quatation.jpg" class="open" alt="" />Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.<img src="images/close-quatation.jpg" class="closeq" alt="" /></p>
								<h4><a href="#">zam cristafr,  </a>manager</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
	<!-- // How it works -->

	<!-- // contact -->
	<%@include file="footer.jsp"%>
	
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
</body>
</html>