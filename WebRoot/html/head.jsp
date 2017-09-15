<%@ page language="java" import="java.util.*,com.findu.entity.*"
	pageEncoding="UTF-8"%>

<%
	User u = (User) session.getAttribute("user");

	String name;
	if (u == null || "".equals(u.getName())) {
		name = "<a href='/FindU/html/signin.jsp'>登录</a><a href='/FindU/html/signup.jsp'>/注册</a>";
	} else {
		//name ="<a href='/FindU/html/user-info.jsp'>"+u.getName()+"</a>"+"<a href='/FindU/servlet/LoginOutServlet'>&nbsp;&nbsp;退出</a>";
		name = u.getName();
	}
%>
<script type="text/javascript">
	function changeText_over(a) {
		a.style.color = "white";
	}

	function changeText_out(a) {
		a.style.color = "black";
	}
</script>

<!-- Navigation -->
<div class="agiletopbar">
	<div class="wthreenavigation">
		<div class="menu-wrap">
			<nav class="menu">
				<div class="icon-list">
					<a href="all-classifieds.jsp?typeid=1"><i
						class="fa fa-fw fa-credit-card"></i><span>校园卡</span> </a> <a
						href="all-classifieds.jsp?typeid=0"><i
						class="fa fa-fw fa-user"></i><span>身份证</span> </a> <a
						href="all-classifieds.jsp?typeid=3"><i
						class="fa fa-fw fa-ticket"></i><span>U盘</span> </a> <a
						href="all-classifieds.jsp?typeid=11"><i
						class="fa fa-fw fa-laptop"></i><span>数码电子</span> </a> <a
						href="all-classifieds.jsp?typeid=6"><i
						class="fa fa-fw fa-money"></i><span>钱包</span> </a> <a
						href="all-classifieds.jsp?typeid=7"><i
						class="fa fa-fw fa-mobile"></i><span>手机</span> </a> <a
						href="all-classifieds.jsp?typeid=5"><i class="fa fa-fw fa-key"></i><span>钥匙</span>
					</a> <a href="all-classifieds.jsp?typeid=12"><i
						class="fa fa-fw fa-book"></i><span>图书资料</span> </a> <a
						href="all-classifieds.jsp?typeid=9"><i
						class="fa fa-fw fa-tags"></i><span>服饰</span> </a> <a
						href="all-classifieds.jsp?typeid=15"><i
						class="glyphicon glyphicon-sunglasses"></i><span>眼镜</span> </a> <a
						href="all-classifieds.jsp?typeid=16"><i
						class="glyphicon glyphicon-pencil"></i><span>文具</span> </a> <a
						href="all-classifieds.jsp?typeid=8"><i
						class="fa fa-fw fa-suitcase"></i><span>背包</span> </a> <a
						href="all-classifieds.jsp?typeid=10"><i
						class="fa fa-fw fa-bicycle"></i><span>自行车</span> </a> <a
						href="all-classifieds.jsp?typeid=13"><i
						class="fa fa-fw fa-asterisk"></i><span>生活用品</span> </a> <a
						href="all-classifieds.jsp"><i
						class="glyphicon glyphicon-th-list"></i><span>所有分类</span> </a>
				</div>
			</nav>
			<button class="close-button" id="close-button">关闭</button>
		</div>
		<button class="menu-button" id="open-button"></button>
	</div>
	<div class="clearfix"></div>
</div>
<!-- //Navigation -->
<!-- header -->
<header>
	<div class="w3ls-header">
		<!--header-one-->
		<div class="w3ls-header-left">
			<p>
				<a href="/FindU/html/mobileapp.jsp"><i class="fa fa-download"
					aria-hidden="true"></i>下载手机 App </a>
			</p>
		</div>
		<div class="w3ls-header-right">
			<ul>
				<li class="dropdown head-dpdn"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"><i
						class="fa fa-user" aria-hidden="true"></i> <%=name%>&nbsp;<span
						class="caret"></span> </a>
					<ul class="dropdown-menu">
						<li><a style="color:black;"
							onmouseover='changeText_over(this)'
							onmouseout='changeText_out(this)'
							href="/FindU/html/user-info.jsp">个人中心</a></li>
						<li><a style="color:black;"
							onmouseover='changeText_over(this)'
							onmouseout='changeText_out(this)'
							href="/FindU/servlet/LoginOutServlet">退出登录</a></li>
					</ul>
				</li>
				<%-- <li class="dropdown head-dpdn">
						<a href="/FindU/html/user-info.jsp" aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i> <%=name %></a>
					</li> --%>
				<li class="dropdown head-dpdn"><a href="/FindU/html/help.jsp"><i
						class="fa fa-question-circle" aria-hidden="true"></i> 帮助</a>
				</li>
				<li class="dropdown head-dpdn"><a href="#"><span
						class="active uls-trigger"><i class="fa fa-language"
							aria-hidden="true"></i>languages</span> </a>
				</li>
				<li class="dropdown head-dpdn">
					<div class="header-right">
						<!-- Large modal -->
						<div class="selectregion">
							<button class="btn btn-primary" data-toggle="modal"
								data-target="#myModal">
								<i class="fa fa-globe" aria-hidden="true"></i>选择城市
							</button>
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
								aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="myModalLabel">选择你的城市</h4>
										</div>
										<div class="modal-body">
											<form class="form-horizontal" action="#" method="get">
												<div class="form-group">
													<select id="basic2" class="show-tick form-control" multiple>
														<optgroup label="热门城市">
															<option selected style="display:none;color:#eee;">选择城市</option>
															<option>北京市</option>
															<option>上海市</option>
															<option>深圳市</option>
															<option>成都市</option>
														</optgroup>
														<optgroup label="更多城市">
															<optgroup label="四川省">
																<option>成都市</option>
																<option>绵阳市</option>
																<option>自贡市</option>
																<option>泸州市</option>
																<option>乐山市</option>
															</optgroup>
															<optgroup label="云南省">
																<option>昆明市</option>
																<option>安宁市</option>
																<option>曲靖市</option>
																<option>保山市</option>
																<option>思茅市</option>
															</optgroup>
														</optgroup>
														</optgroup>
													</select>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>

		<div class="clearfix"></div>
	</div>