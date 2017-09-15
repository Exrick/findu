<%@ page language="java" import="java.util.*,com.findu.entity.*,com.findu.service.*,java.text.*" contentType="text/html; charset=utf-8" %>
<%
	User u3=(User)session.getAttribute("user");
	/* if(u3==null){
		response.sendRedirect("/FindU/html/index.jsp");
		return;
	} */
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>个人信息</title>
    <link rel="stylesheet" href="/FindU/html/css/pintuer.css">
    <link rel="stylesheet" href="/FindU/html/css/admin2.css">
    <script type="text/javascript" src="/FindU/html/js/jquery.min.js"></script>
    <script src="/FindU/html/js/pintuer.js"></script>
    <script src="/FindU/html/laydate/laydate.js"></script>
</head>

<body>
    <div class="panel admin-panel">
        <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 个人信息</strong></div>
        <div class="body-content">
            <form method="post" class="form-x" action="/FindU/servlet/InfoChangeServlet" id="user_form">
            	<div class="form-group">
                    <div class="label">
                        <label>用户ID：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input input-width" name="ID" value="<%=u3.getId() %>" disabled/>
                        <div class="tips"></div>
                    </div>    
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>用户名：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input input-width" name="Name" value="<%=u3.getName() %>" disabled/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>性别：</label>
                    </div>
                    <%
                    	String checkman="";
                    	if("男".equals(u3.getGender())){
                    		checkman="checked";
                    	}
                    	String checkmale="";
                    	if("女".equals(u3.getGender())){
                    		checkmale="checked";
                    	}
                     %>
                    <div class="field">
                        <input type="radio" id="url1" <%=checkman %> value="男" name="Sex" />男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" id="url2" name="Sex" value="女" <%=checkmale %> />女
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="label">
                        <label>手机：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input input-width" name="Telphone" value="<%=u3.getPhone() %>" disabled/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>邮箱：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input input-width" name="Email" value="<%=u3.getEmail() %>" disabled/>
                        <div class="tips"></div>
                    </div>
                </div>
                <%
                	String birth="";
                	if(u3.getBirthday()==null){
                		birth="";
                	}else{
                		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                		birth=sdf.format(u3.getBirthday());
                	}
                	if(u3.getQq()==null){
                		u3.setQq("");
                	}
                	if(u3.getAddress()==null){
                		u3.setAddress("");
                	}
                	if(u3.getExplain()==null){
                		u3.setExplain("");
                	}
                 %>
                <div class="form-group">
                    <div class="label">
                        <label>生日：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input input-width" onClick="laydate()" name="Birth" value="<%=birth %>" />
                        <div class="tips"></div>     
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>QQ：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input input-width" name="QQ" value="<%=u3.getQq() %>" />
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>家乡地址：</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input input-width" name="Address" value="<%=u3.getAddress() %>" style="width:50%" />
                        <div class="tips"></div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="label">
                        <label>个人简介：</label>
                    </div>
                    <div class="field">
                        <textarea name="Introduce" class="input" style="height:120px;" ><%=u3.getExplain() %></textarea>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label></label>
                    </div>
                    <div class="field">
                        <button id="change" class="button bg-main icon-check-square-o" type="submit"> 提交修改</button>
                        &nbsp;&nbsp;&nbsp;<font color='#ff0000' size=3>${changeMsg}</font>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
<script>
;!function(){
laydate({
   elem: '#demo'
})
}();
</script>
</html>

