<%@ page language="java" import="java.util.*,com.findu.entity.*,com.findu.service.*,java.text.*,com.findu.utils.*,com.findu.dao.*" contentType="text/html; charset=utf-8" %>
<%
	User u6=(User)session.getAttribute("user");
	GoodService gservice=new GoodService();
	ApplyService aservice=new ApplyService();
	UserService uservice=new UserService();
%>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="/FindU/html/css/pintuer.css">
    <link rel="stylesheet" href="/FindU/html/css/admin2.css">
    <script type="text/javascript" src="/FindU/html/js/jquery-1.11.0.min.js"></script>
    <script src="/FindU/html/js/pintuer.js"></script>
</head>

<body>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
        <table class="table table-hover text-center">
            <tr>
                <th width="5%">序号</th>
                <th width="8%">申请物品图片预览</th>
                <th width="10%">物品标题</th>
                <th width="5%">发布者</th>
                <th width="15%">申请理由</th>
                <th width="8%">申请图片</th>
                <th width="10%">留下的联系方式</th>
                <th width="8%">申请时间</th>
                <th width="10%">申请结果</th>
                <th width="15%">操作</th>
            </tr>
			<%
				ArrayList<Apply> list=aservice.getApplyByApplyId(u6.getId());
				if(list!=null||list.size()>0){
					int count=0;
					for(int i=0;i<list.size();i++){
						count++;
						Apply a=list.get(i);
						Good g=gservice.findGoodById(a.getGoodid());
						
						SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
               			String applytime = sdf1.format(a.getApplyTime());

		            	if(!Judge.hasPic(g.getPicture())){
		            		g.setPicture("nopic.jpg");
		            	}
		            	
		            	if(!Judge.hasPic(a.getPicture())){
		            		a.setPicture("nopic.jpg");
		            	}
		            	
		            	String applyCount=aservice.applyCount(g);
		            	
		            	String goodstate="";
		            	if("0".equals(a.getState())){
		            		goodstate="等待发布者处理";
		            	}else if("1".equals(a.getState())){
		            		goodstate="<font color='#ff0000'>申领成功，请与发布者取得联系</font>";
		            	}else if("2".equals(a.getState())){
		            		goodstate="申领失败，如有疑问请与发布者取得联系";
		            	}
		            	
		            	String fabu=uservice.findUserById(g.getFabuid()).getName();
			%>
            <tr>
                <td><%=count %></td>
                <td><a target="_blank" href="/FindU/images/<%=g.getPicture() %>"><img src="/FindU/images/<%=g.getPicture() %>" alt="" width="120" height="50" /></a></td>
                <td><a target="_blank" href="/FindU/html/single.jsp?id=<%=g.getId() %>"><%=g.getName() %></a></td>
                <td><%=fabu %></td>
                <td><%=a.getExplain() %></td>
                <td><a target="_blank" href="/FindU/images/<%=a.getPicture() %>"><img src="/FindU/images/<%=a.getPicture() %>" alt="" width="120" height="50" /></a></td>
                <td><%=a.getContact() %></td>
                <td><%=applytime %></td>
                <td><%=goodstate %></td>
                <td>
                    <div class="button-group">
                     	<% if("0".equals(a.getState())){ %>
                            <a type="button" class="button border-main" target="_blank" href="/FindU/html/change-apply.jsp?applyId=<%=a.getId() %>"><span class="icon-edit"></span> 编辑</a>
                        <a class="button border-red" href="javascript:void(0)" onclick="return del(<%=a.getId() %>)"><span class="icon-trash-o"></span> 取消申请</a>
                        <%}else{ %>
                        	<a type="button" class="button border-main" target="_blank" href="/FindU/html/single.jsp?id=<%=g.getId() %>"><span class="icon-edit"></span> 查看</a>
                        <%} %>
                    	
                    </div>
                </td>
            </tr>
                <script type="text/javascript">
		        function del(id) {
		            if (confirm("您确定要取消吗?")) {
						window.location.href="/FindU/servlet/DelApplyServlet?ApplyId="+id;
		            }
		        }
		   		</script>
            <%
            		}
            	}
            %>
            <tr>
                <td colspan="10">
                    <div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">下一页</a><a href="">尾页</a></div>
                </td>
            </tr>
        </table>
    </div>

</body>

</html>

