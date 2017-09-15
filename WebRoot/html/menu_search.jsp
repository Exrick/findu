<%@ page language="java"
	import="java.util.*,com.findu.entity.*,com.findu.dao.*,java.text.*,com.findu.service.*"
	contentType="text/html; charset=utf-8"%>
<%
	String searchx=(String)request.getAttribute("search");
	if(searchx==null){
		searchx="";
	}
	
	String typeNamex=(String)request.getAttribute("typeName");
	if(typeNamex==null){
		typeNamex="";
	}
%>
<script type="text/javascript">
	window.onload = function() {
		var searchElement = document.getElementById("Search");//获得搜索框
		var div = document.getElementById("context");//获得提示框
		searchElement.onkeyup = function() {//按键弹起事件
			var name = this.value;
			//获得xhr对象
			var xhr = getXMLHttpRequest();
			//处理结果
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						var str = xhr.responseText;
						if (str != "") {
							div.style.display = "block";//显示
						} else {
							div.style.display = "none";//显示
						}
						var ss = str.split(",");
						//var ss=eval("("+xhr.responseTest+")");
						var childDivs = "";
						for ( var i = 0; i < ss.length; i++) {
							childDivs += "<div onclick='writeText(this)' onmouseover='changeBackground_over(this)' onmouseout='changeBackground_out(this)' "+
							"style='font-weight:bold;padding-left:8px;padding-top:5px;padding-bottom:5px;'>"
									+ ss[i] + "</div>";//把每个元素放入div
						}
						div.innerHTML = childDivs;
					}
				}
			}

			xhr.open("get", "/FindU/servlet/AJAXSearchServlet?name=" + name);

			xhr.send(null);
		}
	}

	function changeBackground_over(div) {
		div.style.backgroundColor = "#E8E8E8";
	}

	function changeBackground_out(div) {
		div.style.backgroundColor = "";
	}

	//填充文本到搜索框
	function writeText(div) {
		//得到提示框
		var searchElement = document.getElementById("Search");
		searchElement.value = div.innerHTML;
		div.parentNode.style.display = "none";//把提示框隐藏
	}

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

	function hide() {
		var context = document.getElementById("context");
		context.style.display = "none";//把提示框隐藏
	}
</script>
<div class="container">
	<div class="agile-its-header">
		<div class="logo">
			<h1>
				<a href="/FindU/html/index.jsp"><span>Find</span>U</a>
			</h1>
		</div>
		<div class="agileits_search" style="position:relative">
			<form autocomplete="off" action="/FindU/servlet/SearchServlet"
				method="post">
				<input id="Search" name="Search" value="<%=searchx %>"
					type="text" placeholder="输入您要查找的物品信息" required=" "> <select
					id="agileinfo_search" name="agileinfo_search" required="">
					<option value="AllTypes">所有分类</option>
					<%
						TypeDAO typex = new TypeDAO();
						String selectx="";
						for (int i = 0; i < typex.getAllTypes().size(); i++) {
							if(typeNamex.equals(typex.getAllTypes().get(i).getTypename())){
									selectx="selected";
							}else{
								selectx="";
							}
					%>
					<option value="<%=typex.getAllTypes().get(i).getTypename()%>" <%=selectx %>>
						<%=typex.getAllTypes().get(i).getTypename()%></option>
					<%
						}
					%>
				</select>
				<button type="submit" class="btn btn-default"
					aria-label="Left Align">
					<i class="fa fa-search" aria-hidden="true"> </i>
				</button>
			</form>
			<a class="post-w3layouts-ad" href="/FindU/html/post-ad.jsp">发布失物招领</a>
			<div id="context"
				style="display: none;border: 1px solid gray;background-color: white;width: 368px;position: absolute;right: 373px;top: 42px;z-index: 3;"></div>
		</div>

		<div class="clearfix"></div>
	</div>
</div>
</header>
<!-- //header -->
