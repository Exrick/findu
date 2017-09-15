<%@ page language="java" import="java.util.*,com.findu.entity.*,com.findu.dao.*,java.text.*,com.findu.service.*,com.findu.utils.*" contentType="text/html; charset=utf-8"%>

<% 
	response.setContentType("text/html;charset=utf-8");
	request.setCharacterEncoding("utf-8");
	
	TypeService tservice=new TypeService();
	GoodService gservice=new GoodService();
	ApplyService aservice=new ApplyService();
	UserService uservice=new UserService();
	
	String type=(String)request.getAttribute("typeName");
	int typeid=tservice.findTypeIdByName(type);
	
	String search=(String)request.getAttribute("search");
	if(search==null){
		search="";
	}

	int currPage=Integer.parseInt((String)request.getAttribute("currPage"));
	
	String total=(String)request.getAttribute("totalPage");
	int totalPage=1;
	if(total!=null){
		totalPage=Integer.parseInt(total);
	}
	
	ArrayList<G> searchlist=(ArrayList)request.getAttribute("searchlist");
%>       

<!DOCTYPE html>
<html lang="en">
<head>
<title>搜索结果-FindU失物招领平台</title>
<link rel="shortcut icon" href="/FindU/html/images/findu.ico">
<link rel="Bookmark" href="/FindU/html/images/findu.ico" />
<link rel="stylesheet" href="/FindU/html/css/bootstrap.min.css"><!-- bootstrap-CSS -->
<link rel="stylesheet" href="/FindU/html/css/bootstrap-select.css"><!-- bootstrap-select-CSS -->
<link href="/FindU/html/css/style.css" rel="stylesheet" type="text/css" media="all" /><!-- style.css -->
<link rel="stylesheet" type="text/css" href="/FindU/html/css/jquery-ui1.css">
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
<!-- switcher-grid and list alignment -->
<script src="/FindU/html/js/tabs.js"></script>	
<script type="text/javascript">
$(document).ready(function () {    
var elem=$('#container ul');      
	$('#viewcontrols a').on('click',function(e) {
		if ($(this).hasClass('gridview')) {
			elem.fadeOut(1000, function () {
				$('#container ul').removeClass('list').addClass('grid');
				$('#viewcontrols').removeClass('view-controls-list').addClass('view-controls-grid');
				$('#viewcontrols .gridview').addClass('active');
				$('#viewcontrols .listview').removeClass('active');
				elem.fadeIn(1000);
			});						
		}
		else if($(this).hasClass('listview')) {
			elem.fadeOut(1000, function () {
				$('#container ul').removeClass('grid').addClass('list');
				$('#viewcontrols').removeClass('view-controls-grid').addClass('view-controls-list');
				$('#viewcontrols .gridview').removeClass('active');
				$('#viewcontrols .listview').addClass('active');
				elem.fadeIn(1000);
			});									
		}
	});
});
</script>
<!-- //switcher-grid and list alignment -->
</head>
<body>
	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp" %>
	<!-- breadcrumbs -->
	<div class="w3layouts-breadcrumbs text-center">
		<div class="container">
			<span class="agile-breadcrumbs"><a href="/FindU/html/index.jsp"><i class="fa fa-home home_1"></i></a> / <span>搜索结果</span></span>
		</div>
	</div>
	<!-- //breadcrumbs -->
	<!-- Products -->
	<div class="total-ads main-grid-border">
		<div class="container">
			<br>
			<div class="all-categories">
				<h3> 共找到 ${count } 条物品信息</h3>
				<ul class="all-cat-list">
					<%
						for(int i=0;i<tservice.getAllTypes().size();i++){
							Type t=tservice.getAllTypes().get(i);
							String countype=gservice.getGoodCountByType(t.getTypeid());
					 %>
					<li><a href="/FindU/html/all-classifieds.jsp?typeid=<%=t.getTypeid() %>"><%=t.getTypename() %> 
					<span class="num-of-ads">(<%=countype %>)</span></a></li>
					<%
						}
					 %>
				</ul>
			</div>

			<div class="ads-grid">
				<div class="side-bar col-md-3">
					<div class="search-hotel">
					<h3 class="agileits-sear-head">物品包含信息</h3>
					<form action="/FindU/servlet/SearchServlet" method="post">
						<input type="text" name="Search2" value="物品名称..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '物品名称...';}" required="">
						<input type="submit" value=" ">
					</form>
				</div>
				
				<div class="range">
					<h3 class="agileits-sear-head">物品估计价值</h3>
							<ul class="dropdown-menu6">
								<li>	                
									<div id="slider-range">						
										<input type="text" id="amount" style="border: 0; color: #ffffff; font-weight: normal;" />
										</div>	
									</li>			
							</ul>
							<!---->
							<script type="text/javascript" src="/FindU/html/js/jquery-ui.js"></script>
							<script type='text/javascript'>//<![CDATA[ 
							$(window).load(function(){
							 $( "#slider-range" ).slider({
										range: true,
										min: 0,
										max: 9999,
										values: [ 10, 3000 ],
										slide: function( event, ui ) {  $( "#amount" ).val( "￥" + ui.values[ 0 ] + " - ￥" + ui.values[ 1 ] );
										}
							 });
							$( "#amount" ).val( "￥" + $( "#slider-range" ).slider( "values", 0 ) + " - ￥" + $( "#slider-range" ).slider( "values", 1 ) );

							});//]]>  

							</script>
				</div>
				
				<div class="w3ls-featured-ads">
					<h2 class="sear-head fer">热门物品</h2>
						<%
							ArrayList<Apply> hotlist=aservice.getHotApply();
							if(hotlist!=null||hotlist.size()>=3){
								for(int i=0;i<3;i++){
									Good g=gservice.findGoodById(hotlist.get(i).getGoodid());
									if(!Judge.hasPic(g.getPicture())){
		            					g.setPicture("nopic.jpg");
		            				}
						%>
						<div class="w3l-featured-ad">
						<a href="/FindU/html/single.jsp?id=<%=g.getId() %>">
							<div class="w3-featured-ad-left">
								<img src="/FindU/images/<%=g.getPicture() %>" title="ad image" alt="" />
							</div>
							<div class="w3-featured-ad-right">
								<h4><%=g.getName() %></h4>
								<p>￥ <%=g.getValue() %></p>
							</div>
							<div class="clearfix"></div>
						</a>
						</div>
						<%
								}
							}
						%>
					
					<div class="clearfix"></div>
				</div>
				</div>
				<div class="agileinfo-ads-display col-md-9">
					<div class="wrapper">					
					<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					  <ul id="myTab" class="nav nav-tabs nav-tabs-responsive" role="tablist">
						<li role="presentation" class="active">
						  <a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">
							<span class="text">所有物品</span>
						  </a>
						</li>
						<li role="presentation" class="next">
						  <a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">
							<span class="text">有图片的物品</span>
						  </a>
						</li>
					  </ul>
					  <div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
						   <div>
												<div id="container">
								<div class="view-controls-list" id="viewcontrols">
									<label>view :</label>
									<a class="gridview"><i class="glyphicon glyphicon-th"></i></a>
									<a class="listview active"><i class="glyphicon glyphicon-th-list"></i></a>
								</div>
								<div class="sort">
								   <div class="sort-by">
										<label>排序 : </label>
										<select>
														<option value="">最新发布</option>
														<option value="">价值: 从低到高</option>
														<option value="">价值: 从高到低</option>
										</select>
									   </div>
									 </div>
								<div class="clearfix"></div>
							<ul class="list">
							<!-- 物品循环开始 -->
					        	<% 
									if(searchlist!=null||searchlist.size()>0)
					            	{
					            		for(int i=0;i<searchlist.size();i++)
					            		{
					            			G g=searchlist.get(i);
					            			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
               								String date = sdf1.format(g.getGoodtime());
		            						Type t3=tservice.findTypeById(g.getGoodtype());
		            						if(!Judge.hasPic(g.getGoodpicture())){
		            							g.setGoodpicture("nopic.jpg");
		            						}
					        	%>   
					        	<a href="/FindU/html/single.jsp?id=<%=g.getGoodid() %>">
									<li>
									<img src="/FindU/images/<%=g.getGoodpicture() %>" title="" alt="" />
									<section class="list-left">
									<h5 class="title"><%=g.getGoodname() %></h5>
									<span class="adprice"><h>估计价值：￥</h><%=g.getGoodvalue() %></span>
									<p class="catpath">发布者：<%=uservice.findUserById(g.getFabuid()).getName() %><br>所属分类：<%=t3.getTypename() %></p>
									</section>
									<section class="list-right">
									<span class="date">拾取时间：<%=date %></span>
									<span class="cityname">拾取地点：<%=g.getGoodsite() %></span>
									</section>
									<div class="clearfix"></div>
									</li> 
								</a>
								<%
					                   }
					              } 
					        	%>
							</ul>
						</div>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
						 <div>
												<div id="container">
								<div class="view-controls-list" id="viewcontrols">
									<label>view :</label>
									<a class="gridview"><i class="glyphicon glyphicon-th"></i></a>
									<a class="listview active"><i class="glyphicon glyphicon-th-list"></i></a>
								</div>
								<div class="sort">
								   <div class="sort-by">
										<label>排序 : </label>
										<select>
														<option value="">最新发布</option>
														<option value="">价值: 从低到高</option>
														<option value="">价值: 从高到低</option>
										</select>
									   </div>
									 </div>
								<div class="clearfix"></div>
							<ul class="list">
								<!-- 物品循环开始 -->
					        	<% 
					            	if(searchlist!=null||searchlist.size()>0)
					            	{
					            		for(int i=0;i<searchlist.size();i++)
					            		{
					            			G g=searchlist.get(i);
					            			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
               								String date = sdf1.format(g.getGoodtime());
		            						Type t3=tservice.findTypeById(g.getGoodtype());
		            						if(!"nopic.jpg".equals(g.getGoodpicture())){
					        	%>   
					        	<a href="/FindU/html/single.jsp?id=<%=g.getGoodid() %>">
									<li>
									<img src="/FindU/images/<%=g.getGoodpicture() %>" title="" alt="" />
									<section class="list-left">
									<h5 class="title"><%=g.getGoodname() %></h5>
									<span class="adprice"><h>估计价值：￥</h><%=g.getGoodvalue() %></span>
									<p class="catpath">发布者：<%=uservice.findUserById(g.getFabuid()).getName() %><br>所属分类：<%=t3.getTypename() %></p>
									</section>
									<section class="list-right">
									<span class="date">拾取时间：<%=date %></span>
									<span class="cityname">拾取地点：<%=g.getGoodsite() %></span>
									</section>
									<div class="clearfix"></div>
									</li> 
								</a>
								<%
											}
					                   }
					              } 
					        	%>
							</ul>
						</div>
							</div>
						</div>
						
						<ul class="pagination pagination-sm">
							<li><a href="/FindU/servlet/SearchServlet?key=${key }&typeid=<%=typeid %>&currPage=<%=currPage-1 %>">上一页</a></li>
							<%
								for(int i=1;i<=totalPage;i++){
									String clas="";
									if(currPage==i){
										clas="class='active'";
									}
							 %>
							<li <%=clas %>><a href="/FindU/servlet/SearchServlet?key=${key }&typeid=<%=typeid %>&currPage=<%=i %>"><%=i %></a></li>
							<%
								}
							 %>
							<li><a href="/FindU/servlet/SearchServlet?key=${key }&typeid=<%=typeid %>&currPage=<%=currPage+1 %>">下一页</a></li>
						</ul>
					  </div>
					</div>
				</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>	
	</div>
	<!-- // Products -->
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