<%@ page language="java" import="java.util.*,com.findu.entity.*,com.findu.dao.*" contentType="text/html; charset=utf-8"%>

<%
	String go="";
	
	String regmsg=(String)request.getAttribute("registerMsg");
	if(regmsg==null){
		regmsg="";
	}else{
		go="/FindU/html/signin.jsp";
	}	
	
	String loginmsg=(String)request.getAttribute("loginMsg");
	if(loginmsg==null){
		loginmsg="";
	}else{
		go="/FindU/html/index.jsp";
	}
	
	String appmsg=(String)request.getAttribute("appMsg");
	if(appmsg==null){
		appmsg="";
	}else{
		go="/FindU/html/mobileapp.jsp";
	}
	
	String msg=(String)request.getAttribute("Msg");
	if(msg==null){
		msg="";
	}else{
		go="/FindU/html/index.jsp";
	}
	
	String postmsg=(String)request.getAttribute("postMsg");
	if(postmsg==null){
		postmsg="";
	}else{
		go="/FindU/html/signin.jsp";
	}	
	
	String applyloginmsg=(String)request.getAttribute("applyLogin");
	if(applyloginmsg==null){
		applyloginmsg="";
	}else{
		go="/FindU/html/signin.jsp";
	}
	
	String applymsg=(String)request.getAttribute("applyMsg");
	if(applymsg==null){
		applymsg="";
	}else{
		int id=Integer.parseInt(request.getParameter("id"));
			
		if(id>=0){
			go="/FindU/html/single.jsp?id="+id;
		}else{
			go="/FindU/html/index.jsp";
		}	
	}	
	
	String goodmsg=(String)request.getAttribute("goodMsg");
	if(goodmsg==null){
		goodmsg="";
	}else{
		User u1=(User)session.getAttribute("user");
		if(u1==null||"".equals(u1)){
			response.sendRedirect("/FindU/html/signin.jsp");
			/*request.setAttribute("postMsg", "您还未登录!");
			request.getRequestDispatcher("/html/signin.jsp").forward(request, response);*/
		}
		go="/FindU/html/index.jsp";
	}
	
	String msgerror="";
	if(go==null||"".equals(go)){
		msgerror="对不起，出错了！";
		go="/FindU/html/index.jsp";
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>消息提示-FindU失物招领平台</title>
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
            <span class="agile-breadcrumbs"><a href="/FindU/html/index.jsp"><i class="fa fa-home home_1"></i></a> / <span>提示</span></span>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- Submit Ad -->
    <div class="submit-ad main-grid-border">
        <div class="container">
            <h2 class="w3-head"></h2>
            <div class="post-ad-form">
                 	<div class="clearfix"></div>
						<h3><%=applymsg %><%=goodmsg %><%=postmsg %><%=msg %><%=applyloginmsg %><%=appmsg %><%=loginmsg %>${changePostMsg}<%=regmsg %><%=msgerror %></h3><br>
						<a href="<%=go %>"><em id="sp">3</em> 秒后自动返回...</a>
                    <div class="clearfix"></div>    
            </div>
        </div>
    </div>
    <!-- // Submit Ad -->
    
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

    $().UItoTop({
        easingType: 'easeOutQuart'
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
            scrollTop: $(this.hash).offset().top
        }, 1000);
    });
});
</script>
<!-- start-smoth-scrolling -->
<!-- //here ends scrolling icon -->
<script type="text/javascript">
    onload=function(){
        setInterval(go, 1000);
    };
    var x=3; //利用了全局变量来执行
    function go(){
        x--;
        if(x>0){
            document.getElementById("sp").innerHTML=x; //每次设置的x的值都不一样了。
        }else{
            location.href='<%=go %>';
        }
    }
</script>
</html>
