<%@ page language="java" import="java.util.*,com.findu.entity.*,com.findu.dao.*,java.text.*" contentType="text/html; charset=utf-8"%>
<%
	User u2=(User)session.getAttribute("user");
	
	if(u2==null||"".equals(u2)){
		//response.sendRedirect("/FindU/html/signin.jsp");
		request.setAttribute("postMsg", "您还未登录，请登录后进行此操作!");
		request.getRequestDispatcher("/html/message.jsp").forward(request, response);
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>个人中心</title>
    <link rel="stylesheet" href="/FindU/html/css/admin2.css">
    <link rel="shortcut icon" href="/FindU/html/images/findu.ico">
	<link rel="Bookmark" href="/FindU/html/images/findu.ico" />
    <link rel="stylesheet" href="/FindU/html/css/bootstrap.min.css">
    <!-- bootstrap-CSS -->
    <link rel="stylesheet" href="/FindU/html/css/bootstrap-select.css">
    <!-- bootstrap-select-CSS -->
    <link href="/FindU/html/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- style.css -->
    <link rel="stylesheet" href="/FindU/html/css/font-awesome.min.css" />
    <!-- fontawesome-CSS -->
    <link rel="stylesheet" href="/FindU/html/css/menu_sideslide.css" type="text/css" media="all">
    <!-- Navigation-CSS -->
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
    <link rel="stylesheet" href="/FindU/html/css/flexslider.css" media="screen" />
    <!-- flexslider css -->
    <style media="screen">
        .test {
            display: inline-block;
            width: 180px;
            font-size: 24px;
            padding-left: 10px;
        }
    </style>
</head>

<body>
    <%@include file="head.jsp"%>
	<%@include file="menu_search.jsp" %>
   <body style="background-color:#f2f9fd;">
        <div class="leftnav">
            <ul style="display:block">
                <li><a href="info.jsp" target="right"><i class="fa fa-user" aria-hidden="true"></i> 个人信息</a></li>
                <li><a href="pass.jsp" target="right"><i class="fa fa-key" aria-hidden="true"></i> 修改密码</a></li>
                <li><a href="mypost.jsp" target="right"><i class="fa fa-list-alt" aria-hidden="true"></i> 我的发布</a></li>
                <li><a href="applymanage.jsp" target="right"><i class="fa fa-cog" aria-hidden="true"></i> 申领管理</a></li>
                <li><a href="myapply.jsp" target="right"><i class="fa fa-plus-circle" aria-hidden="true"></i> 我的申领</a></li>
            </ul>

        </div>
        <script type="text/javascript">
            $(function() {
                $(".leftnav h2").click(function() {
                    $(this).next().slideToggle(200);
                    $(this).toggleClass("on");
                })
                $(".leftnav ul li a").click(function() {
                    $("#a_leader_txt").text($(this).text());
                    $(".leftnav ul li a").removeClass("on");
                    $(this).addClass("on");
                })
            });
        </script>

        <div class="admin">
            <iframe rameborder="1" scrolling="auto" src="info.jsp" name="right" width="100%" height="800px"></iframe>
        </div>
    </body>
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

</html>

