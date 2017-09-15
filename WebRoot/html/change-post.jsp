<%@ page language="java" import="java.util.*,com.findu.entity.*,com.findu.dao.*,java.sql.Timestamp,java.text.*" contentType="text/html; charset=utf-8"%>

<%
	GoodService gservice=new GoodService();
	TypeService tservice=new TypeService();
	String msg=(String)request.getAttribute("postMsg");
	if(msg==null){
		msg="";
	}
	
	User u1=(User)session.getAttribute("user");
		
	if(u1==null||"".equals(u1)){
		//response.sendRedirect("/FindU/html/signin.jsp");
		request.setAttribute("postMsg", "您还未登录，请登录后进行此操作!");
		request.getRequestDispatcher("/html/message.jsp").forward(request, response);
		return;
	}
	
	int goodid=(Integer.parseInt(request.getParameter("goodId")));
	
	if(request.getParameter("goodId")==null||gservice.findGoodById(goodid)==null){
		request.setAttribute("changePostMsg", "无该物品信息!");
		request.getRequestDispatcher("/html/message.jsp").forward(request, response);
		return;
	}
	
	if(gservice.findGoodById(goodid).getFabuid()!=u1.getId()){
		request.setAttribute("changePostMsg", "您不具有此操作权限!");
		request.getRequestDispatcher("/html/message.jsp").forward(request, response);
		return;
	}
	
	Good goodform=gservice.findGoodById(goodid);
	
	if(goodform==null){
		goodform=new Good("","","",0,-1,"","");
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>编辑物品-FindU失物招领平台</title>
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
    
    <link rel="stylesheet" type="text/css" href="/FindU/html/css/jquery-ui.css" />

	<script type="text/javascript" src="/FindU/html/js/jquery-ui-1.10.4.custom.min.js"></script>
	<script type="text/javascript" src="/FindU/html/js/jquery.ui.datepicker-zh-CN.js"></script>
	<script type="text/javascript" src="/FindU/html/js/jquery-ui-timepicker-addon.js"></script>
	<script type="text/javascript" src="/FindU/html/js/jquery-ui-timepicker-zh-CN.js"></script>
	<style type="text/css">
	.ui-timepicker-div .ui-widget-header { margin-bottom: 8px; }
	.ui-timepicker-div dl { text-align: left; }
	.ui-timepicker-div dl dt { float: left; clear:left; padding: 0 0 0 5px; }
	.ui-timepicker-div dl dd { margin: 0 10px 10px 45%; }
	.ui-timepicker-div td { font-size: 90%; }
	.ui-tpicker-grid-label { background: none; border: none; margin: 0; padding: 0; }
	
	.ui-timepicker-rtl{ direction: rtl; }
	.ui-timepicker-rtl dl { text-align: right; padding: 0 5px 0 0; }
	.ui-timepicker-rtl dl dt{ float: right; clear: right; }
	.ui-timepicker-rtl dl dd { margin: 0 45% 10px 10px; }
	</style>
</head>

<body>
    <%@include file="head.jsp"%>
	<%@include file="menu_search.jsp" %>
    <!-- breadcrumbs -->
    <div class="w3layouts-breadcrumbs text-center">
        <div class="container">
            <span class="agile-breadcrumbs"><a href="/FindU/html/index.jsp"><i class="fa fa-home home_1"></i></a> / <span>拾物发布</span></span>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- Submit Ad -->
    <div class="submit-ad main-grid-border">
        <div class="container">
            <h2 class="w3-head">编辑物品<span class="postmsg"><%=msg %></span></h2>
            <div class="post-ad-form">
                <form id="information" action="/FindU/servlet/ChangePostServlet" method="post" enctype="multipart/form-data">
                 	<div class="clearfix"></div>
                    <label>物品种类 <span>*</span></label>
                    <select class="" name="Option">
                    <%
                    	String select="";
						TypeDAO type2 = new TypeDAO(); 
						for (int i = 0; i < type2.getAllTypes().size(); i++) {
							if(goodform.getType()==tservice.findTypeIdByName(tservice.getAllTypes().get(i).getTypename())){
								select="selected";
							}else{
								select="";
							}
					%>	
                        <option value="<%=type2.getAllTypes().get(i).getTypename() %>" <%=select %>><%=type2.getAllTypes().get(i).getTypename() %></option>
					<%
					}
					%>
                    </select>	
                    <div class="clearfix"></div>
                    <input type="text" name="GetID" value="<%=goodid %>" style="display:none">
                    <label>物品标题 <span>*</span></label>
                    <input type="text" class="phone" name="GoodName" placeholder="" required="" value="<%=goodform.getName() %>">
                    <div class="clearfix"></div>
                    <label>详情说明 <span>*</span></label>
                    <textarea class="mess" name="Explain" placeholder="请尽量描述你所拾到物品的详细信息，帮助失主更好的找到它" required=""><%=goodform.getExplain() %></textarea>
                    <div class="clearfix"></div>       
                    <%
                    	String gettime="";
                    	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
               			gettime = sdf1.format(goodform.getGoodtime());
                     %>
                    <div class="personal-details">
                            <label>拾取时间 <span>*</span></label>
                      		<input name="act_start_time" type="text" class="text-box" placeholder="点击选择时间" readonly="readonly" style="cursor:pointer;" 
                      		value="<%=gettime %>"/>
                            <div class="clearfix"></div>
                            <label>拾取地点 <span>*</span></label>
                            <input type="text" class="phone" name="GetSite" placeholder="" required="" value="<%=goodform.getSite() %>">
                            <div class="clearfix"></div>
                            <label>联系方式 <span>*</span></label>
                            <input type="text" class="email" name="Contact" placeholder="" required="" value="<%=goodform.getFabucontact() %>">
                            <div class="clearfix"></div>
							<label>估计价值 <span>*</span></label>
							<%
								String value="";
								if(goodform.getValue()>0){
									value+=goodform.getValue();
								}
							 %>
							<input type="text" class="email" name="Value" placeholder="输入范围：0~9999" required="" value="<%=value %>">		
                            <div class="clearfix"></div>
                            <div class="upload-ad-photos">
	                        <label>更换物品图片:</label>
	                        <div class="photos-upload-view">
	                            <div>
	                                <input type="file" id="fileselect" name="fileselect" multiple="multiple" onchange="showPreview(this)"/>
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
                            <div class="clearfix"></div>
                   		</form>
                    </div>       
            </div>
        </div>
    </div>
    <!-- // Submit Ad -->
    
    <%@include file="footer.jsp"%>
    
    <script type="text/javascript">
	$( "input[name='act_start_time'],input[name='act_stop_time']" ).datetimepicker();
	
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
