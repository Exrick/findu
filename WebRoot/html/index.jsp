<%@ page language="java"
	import="java.util.*,com.findu.entity.*,com.findu.dao.*,java.text.*,com.findu.service.*,com.findu.utils.*"
	contentType="text/html; charset=utf-8"%>

<%
	GoodService gservice=new GoodService();
	TypeService tservice=new TypeService();
	ApplyService aservice=new ApplyService();
	ArrayList<Good> newlist=gservice.getAllGoods();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>FindU失物招领平台</title>

<link rel="shortcut icon" href="/FindU/html/images/findu.ico">
<link rel="Bookmark" href="/FindU/html/images/findu.ico" />
<link rel="stylesheet" href="/FindU/html/css/bootstrap.min.css">
<!-- bootstrap-CSS -->
<link rel="stylesheet" href="/FindU/html/css/bootstrap-select.css">
<!-- bootstrap-select-CSS -->

<link rel="stylesheet" href="/FindU/html/css/font-awesome.min.css" />
<!-- fontawesome-CSS -->
<link rel="stylesheet" href="/FindU/html/css/font-awesome.css" />
<!-- fontawesome-CSS -->
<link rel="stylesheet" href="/FindU/html/css/font-awesome.min.4.7.css" />
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

<link href="/FindU/html/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- style.css -->
</head>
<body>
	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp"%>

	<!-- Slider -->
	<div class="slider">
		<ul class="rslides" id="slider">
			<li>
				<div class="w3ls-slide-text">
					<h3>发布或者搜索失物招领</h3>
					<a href="/FindU/html/all-classifieds.jsp"
						class="w3layouts-explore-all">浏览所有类别</a>
				</div></li>
			<li>
				<div class="w3ls-slide-text">
					<h3>发布你拾到的物品</h3>
					<a href="/FindU/html/post-ad.jsp" class="w3layouts-explore">发布失物招领</a>
				</div></li>
			<li>
				<div class="w3ls-slide-text">
					<h3>最新FindU失物招领手机APP发布</h3>
					<a href="/FindU/html/mobileapp.jsp" class="w3layouts-explore">立即下载</a>
				</div></li>
			<li>
				<div class="w3ls-slide-text">
					<h3>找到你的遗失物品</h3>
					<a href="/FindU/html/all-classifieds.jsp" class="w3layouts-explore">查看详情</a>
				</div></li>
			<li>
				<div class="w3ls-slide-text">
					<h3>找回物品最简单的方法</h3>
					<a href="/FindU/html/mobileapp.jsp" class="w3layouts-explore">下载手机APP</a>
				</div></li>
		</ul>
	</div>
	<!-- //Slider -->
	<!-- content-starts-here -->
	<div class="main-content">
		<div class="w3-categories">
			<h3>浏览分类</h3>
			<div class="container">
				<div class="col-md-3">
					<div class="focus-grid w3layouts-boder1">
						<a class="btn-8" href="/FindU/html/all-classifieds.jsp?typeid=1">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image">
										<i class="fa fa-credit-card"></i>
									</div>
									<h4 class="clrchg">校园卡</h4>
								</div>
							</div> </a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="focus-grid w3layouts-boder2">
						<a class="btn-8" href="/FindU/html/all-classifieds.jsp?typeid=0">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image">
										<i class="fa fa-user"></i>
									</div>
									<h4 class="clrchg">身份证</h4>
								</div>
							</div> </a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="focus-grid w3layouts-boder3">
						<a class="btn-8" href="/FindU/html/all-classifieds.jsp?typeid=3">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image">
										<i class="fa fa-ticket"></i>
									</div>
									<h4 class="clrchg">U盘</h4>
								</div>
							</div> </a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="focus-grid w3layouts-boder4">
						<a class="btn-8" href="/FindU/html/all-classifieds.jsp?typeid=11">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image">
										<i class="fa fa-laptop"></i>
									</div>
									<h4 class="clrchg">数码电子</h4>
								</div>
							</div> </a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="focus-grid w3layouts-boder5">
						<a class="btn-8" href="/FindU/html/all-classifieds.jsp?typeid=6">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image">
										<i class="fa fa-money"></i>
									</div>
									<h4 class="clrchg">钱包</h4>
								</div>
							</div> </a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="focus-grid w3layouts-boder6">
						<a class="btn-8" href="/FindU/html/all-classifieds.jsp?typeid=7">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image">
										<i class="fa fa-mobile"></i>
									</div>
									<h4 class="clrchg">手机</h4>
								</div>
							</div> </a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="focus-grid w3layouts-boder7">
						<a class="btn-8" href="/FindU/html/all-classifieds.jsp?typeid=5">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image">
										<i class="fa fa-key"></i>
									</div>
									<h4 class="clrchg">钥匙</h4>
								</div>
							</div> </a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="focus-grid w3layouts-boder8">
						<a class="btn-8" href="/FindU/html/all-classifieds.jsp?typeid=12">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image">
										<i class="fa fa-book"></i>
									</div>
									<h4 class="clrchg">图书资料</h4>
								</div>
							</div> </a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="focus-grid w3layouts-boder9">
						<a class="btn-8" href="/FindU/html/all-classifieds.jsp?typeid=15">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image">
										<i class="glyphicon glyphicon-sunglasses"></i>
									</div>
									<h4 class="clrchg">眼镜</h4>
								</div>
							</div> </a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="focus-grid w3layouts-boder10">
						<a class="btn-8" href="/FindU/html/all-classifieds.jsp?typeid=16">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image">
										<i class="glyphicon glyphicon-pencil"></i>
									</div>
									<h4 class="clrchg">文具</h4>
								</div>
							</div> </a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="focus-grid w3layouts-boder11">
						<a class="btn-8" href="/FindU/html/all-classifieds.jsp?typeid=10">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image">
										<i class="fa fa-bicycle"></i>
									</div>
									<h4 class="clrchg">自行车</h4>
								</div>
							</div> </a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="focus-grid w3layouts-boder12">
						<a class="btn-8" href="/FindU/html/all-classifieds.jsp">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image">
										<i class="fa fa-asterisk"></i>
									</div>
									<h4 class="clrchg">所有分类</h4>
								</div>
							</div> </a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- most-popular-ads -->
		<div class="w3l-popular-ads">
			<h3>热门物品</h3>
			<div class="w3l-popular-ads-info">
				<%
					ArrayList<Apply> hotlist=aservice.getHotApply();
							if(hotlist!=null||hotlist.size()>=6){
								for(int i=0;i<6;i++){
									Good g=gservice.findGoodById(hotlist.get(i).getGoodid());
				            				String typename=tservice.findTypeNameById(g.getType());
				            				String applycount=aservice.applyCount(g);
				            				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				               				String date = sdf1.format(g.getGoodtime());
				               				if(!Judge.hasPic(g.getPicture())){
						            			g.setPicture("nopic.jpg");
						            		}
				%>
				<div class="col-md-4 w3ls-portfolio-left">
					<div class="portfolio-img event-img">
						<img src="/FindU/images/<%=g.getPicture()%>"
							class="img-responsive" alt="" />
						<div class="over-image"></div>
					</div>
					<div class="portfolio-description">
						<h4>
							<a
								href="/FindU/html/all-classifieds.jsp?typeid=<%=g.getType()%>"><%=typename%></a>
						</h4>
						<p><%=g.getName()%></p>
						<h4>
							申请人数：<%=applycount%>
							人
						</h4>
						<h5>
							拾取时间：<%=date%></h5>
						<a href="/FindU/html/single.jsp?id=<%=g.getId()%>"> <span>浏览详情</span>
						</a>
					</div>
					<div class="clearfix"></div>
				</div>
				<%
					}
				                	}
				%>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- most-popular-ads -->
		<div class="trending-ads">
			<div class="container">
				<!-- slider -->
				<div class="agile-trend-ads">
					<h2>最新发布</h2>
					<ul id="flexiselDemo3">
						<li>
							<%
								if(newlist!=null&&newlist.size()>=4){
							            					for(int i=0;i<4;i++){
							            						Good g=newlist.get(i);
							            						String typename=tservice.findTypeNameById(g.getType());
							            						SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							               						String date = sdf1.format(g.getFabutime());
							               						if(!Judge.hasPic(g.getPicture())){
									            					g.setPicture("nopic.jpg");
									            				}
							%>
							<div class="col-md-3 biseller-column">
								<a href="/FindU/html/single.jsp?id=<%=g.getId()%>"> <img
									src="/FindU/images/<%=g.getPicture()%>" alt="" /> <span
									class="price">￥ <%=g.getValue()%></span> </a>
								<div class="w3-ad-info">
									<h5><%=g.getName()%></h5>
									<span><%=Judge.countTime(date)%></span>
								</div>
							</div> <%
 	}
 	                	}
 %>
						</li>
						<li>
							<%
								if(newlist!=null&&newlist.size()>=8){
							            					for(int i=4;i<8;i++){
							            						Good g=newlist.get(i);
							            						String typename=tservice.findTypeNameById(g.getType());
							            						SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							               						String date = sdf1.format(g.getFabutime());
							               						if(!Judge.hasPic(g.getPicture())){
									            					g.setPicture("nopic.jpg");
									            				}
							%>
							<div class="col-md-3 biseller-column">
								<a href="/FindU/html/single.jsp?id=<%=g.getId()%>"> <img
									src="/FindU/images/<%=g.getPicture()%>" alt="" /> <span
									class="price">￥ <%=g.getValue()%></span> </a>
								<div class="w3-ad-info">
									<h5><%=g.getName()%></h5>
									<span><%=Judge.countTime(date)%></span>
								</div>
							</div> <%
 	}
 	                	}
 %>
						</li>
						<li>
							<%
								if(newlist!=null&&newlist.size()>=12){
							            					for(int i=8;i<12;i++){
							            						Good g=newlist.get(i);
							            						String typename=tservice.findTypeNameById(g.getType());
							            						SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							               						String date = sdf1.format(g.getFabutime());
							               						if(!Judge.hasPic(g.getPicture())){
									            					g.setPicture("nopic.jpg");
									            				}
							%>
							<div class="col-md-3 biseller-column">
								<a href="/FindU/html/single.jsp?id=<%=g.getId()%>"> <img
									src="/FindU/images/<%=g.getPicture()%>" alt="加载失败"/> <span
									class="price">￥ <%=g.getValue()%></span> </a>
								<div class="w3-ad-info">
									<h5><%=g.getName()%></h5>
									<span><%=Judge.countTime(date)%></span>
								</div>
							</div> <%
 	}
 	                	}
 %>
						</li>
					</ul>
				</div>
			</div>
			<!-- //slider -->
		</div>
		<!--partners-->
		<div class="w3layouts-partners">
			<h3>合作伙伴</h3>
			<div class="container">
				<ul>
					<li><a href="#"><img class="img-responsive"
							src="/FindU/html/images/p-1.png" alt="">
					</a></li>
					<li><a href="#"><img class="img-responsive"
							src="/FindU/html/images/p-2.png" alt="">
					</a></li>
					<li><a href="#"><img class="img-responsive"
							src="/FindU/html/images/p-3.png" alt="">
					</a></li>
					<li><a href="#"><img class="img-responsive"
							src="/FindU/html/images/p-4.png" alt="">
					</a></li>
					<li><a href="#"><img class="img-responsive"
							src="/FindU/html/images/p-5.png" alt="">
					</a></li>
				</ul>
			</div>
		</div>
		<!--//partners-->
		<!-- mobile app -->
		<div class="agile-info-mobile-app">
			<div class="container">
				<div class="col-md-5 w3-app-left">
					<a href="/FindU/html/mobileapp.jsp"><img
						src="/FindU/html/images/app.png" alt="">
					</a>
				</div>
				<div class="col-md-7 w3-app-right">
					<h3>
						最新发布的手机APP是最<span>简单快捷</span>的方式来找回你的失物
					</h3>
					<p>通过移动端的应用程序您可以方便快捷的发布您所拾到的物品，也可以在移动端快速的访问平台的失物信息，找回您的物品。</p>
					<div class="agileits-dwld-app">
						<h6>
							下载应用程序 : <a href="#"><i class="fa fa-apple"></i>
							</a> <a href="#"><i class="fa fa-windows"></i>
							</a> <a href="#"><i class="fa fa-android"></i>
							</a>
						</h6>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- //mobile app -->
	</div>

	<%@include file="footer.jsp"%>

	<!-- Navigation-JavaScript -->
	<script src="/FindU/html/js/classie.js"></script>
	<script src="/FindU/html/js/main.js"></script>
	<!-- //Navigation-JavaScript -->

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

	<script type="text/javascript" src="/FindU/html/js/jquery.flexisel.js"></script>
	<!-- flexisel-js -->
	<script type="text/javascript">
		$(window).load(function() {
			$("#flexiselDemo3").flexisel({
				visibleItems : 1,
				animationSpeed : 1000,
				autoPlay : true,
				autoPlaySpeed : 5000,
				pauseOnHover : true,
				enableResponsiveBreakpoints : true,
				responsiveBreakpoints : {
					portrait : {
						changePoint : 480,
						visibleItems : 1
					},
					landscape : {
						changePoint : 640,
						visibleItems : 1
					},
					tablet : {
						changePoint : 768,
						visibleItems : 1
					}
				}
			});

		});
	</script>

	<!-- Slider-JavaScript -->
	<script src="/FindU/html/js/responsiveslides.min.js"></script>
	<script>
		$(function() {
			$("#slider").responsiveSlides({
				auto : true,
				pager : false,
				nav : true,
				speed : 500,
				maxwidth : 800,
				namespace : "large-btns"
			});

		});
	</script>
	<!-- //Slider-JavaScript -->

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
