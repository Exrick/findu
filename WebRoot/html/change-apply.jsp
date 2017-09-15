<%@ page language="java" import="java.util.*,com.findu.entity.*,com.findu.dao.*" contentType="text/html; charset=utf-8"%>

<%
	ApplyService aservice=new ApplyService();
	GoodService gservice=new GoodService();
	User u2=(User)session.getAttribute("user");
		
	if(u2==null||"".equals(u2)){
		request.setAttribute("applyLogin", "您还未登录，请登录后进行此操作!");
		request.getRequestDispatcher("/html/message.jsp").forward(request, response);
	}
	
	String msg=(String)request.getAttribute("applyMsg");
	if(msg==null){
		msg="";
	}
	
	int applyid=(Integer.parseInt(request.getParameter("applyId")));
	
	if(request.getParameter("applyId")==null||aservice.getApplyById(applyid)==null){
		request.setAttribute("changePostMsg", "无该申请信息!");
		request.getRequestDispatcher("/html/message.jsp").forward(request, response);
		return;
	}

	if(aservice.getApplyById(applyid).getUserid()!=u2.getId()){
		request.setAttribute("changePostMsg", "您不具有此操作权限!");
		request.getRequestDispatcher("/html/message.jsp").forward(request, response);
		return;
	}
	
	Apply a=aservice.getApplyById(applyid);
	if(a==null){
		a=new Apply("","","");
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>编辑申领-FindU失物招领平台</title>
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
            <span class="agile-breadcrumbs"><a href="/FindU/html/index.jsp"><i class="fa fa-home home_1"></i></a> / <span>物品申领</span></span>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- Submit Ad -->
    <div class="submit-ad main-grid-border">
        <div class="container">
            <h2 class="w3-head">编辑申领<span class="postmsg"><%=msg %></span></h2>
            <div class="post-ad-form">
                <form action="/FindU/servlet/ChangeApplyServlet" method="post" enctype="multipart/form-data">
                 	<div class="clearfix"></div>
                 	<% 
		            	Good g = gservice.getGoodById(a.getGoodid());
		            	if(g!=null)
		            	{
            		%>	
            		<input type="text" name="ID" value="<%=g.getId() %>" hidden>
            		<input type="text" name="applyID" value="<%=applyid %>" hidden>
                    <label>确认申请的物品 <span>*</span></label>
					<input type="text" class="email" name="GoodName" disabled value="<%=g.getName() %>">
                    </select>	
                    <label>申请理由 <span>*</span></label>
                    <textarea class="mess" name="Explain" placeholder="请尽量描述你丢失该物品的详细信息，让拾到者确信是属于你的失物" required=""><%=a.getExplain() %></textarea>
                    <div class="clearfix"></div>       
                    
                    <div class="personal-details">
                        
                            <label>联系方式 <span>*</span></label>
                            <input type="text" class="email" name="Contact" placeholder="" value="<%=a.getContact() %>" required="">
                            
	                        <div class="upload-ad-photos">
	                        <label>上传该物品的旧照片:</label>
	                        <div class="photos-upload-view">
	                                <div>
	                                    <input type="file" id="fileselect" name="fileselect[]" multiple="multiple" onchange="showPreview(this)"/>
	                                    <div id="filedrag">或将文件拖到这里</div>
	                                </div>
	                            <div id="messages">
	                                <p>图片预览窗口 【注：单个文件上传不得超过5MB 限 jpg/png/gif/jpeg 格式 <font color='#ff0000'>不添加图片默认为之前上传的图片</font>】</p>
	                                <div id="previewImg"></div>
	                            </div>
	                        </div>
	                        <div class="clearfix"></div>
	                        <script src="/FindU/html/js/filedrag.js"></script>
	                    	</div>
                            
                            <div class="clearfix"></div>
                            <input type="submit" value="提交修改">
                            <% 
							}else{
						   		request.setAttribute("applyMsg", "无该id对应的物品信息!");
    							request.getRequestDispatcher("message.jsp?id=-1").forward(request, response);
    							return ;
							}
							%>
                            <div class="clearfix"></div>
                   		</form>
                    </div>       
            </div>
        </div>
    </div>
    <!-- // Submit Ad -->
    
    <%@include file="footer.jsp"%>
    
    <script type="text/javascript">	
	function showPreview(obj){
			if(obj.files&&obj.files[0]){
				var reader=new FileReader();
				reader.onload=function(evt){
					document.getElementById("previewImg").innerHTML="<img class='imgPreview' src='"+evt.target.result+"'/>";
				}
			}
			reader.readAsDataURL(obj.files[0]);	
		}
	</script>
    
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
