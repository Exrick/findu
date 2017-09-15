<%@ page language="java" import="java.util.*,com.findu.entity.*,com.findu.service.*,java.text.*,com.findu.utils.*,com.findu.dao.*" contentType="text/html; charset=utf-8" %>
<%
	User u7=(User)session.getAttribute("user");
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
    <script type="text/javascript" src="/FindU/html/js/jquery.min.js"></script>
    <script type="text/javascript" src="/FindU/html/js/jquery-1.10.2.js"></script>
    <script src="/FindU/html/js/pintuer.js"></script>

</head>

<body>
    <form method="post" action="">
        <div class="panel admin-panel">
            <div class="panel-head"><strong class="icon-reorder"> 申领请求管理</strong></div>
            <table class="table table-hover text-center">
                <tr>
                    <th width="8%">序号</th>
                    <th width="13%">申请物品</th>
                    <th width="8%">物品图片预览</th>
                    <th width="8%">申领人</th>
                    <th width="10%">联系方式</th>
                    <th width="10%">申请图片(点击查看大图)</th>
                    <th width="13%">申领理由</th>
                    <th width="8%">申领时间</th>
                    <th width="8%">状态</th>
                    <th width="15%">操作</th>
                </tr>
                <%
                	ArrayList<Good> glist=gservice.getGoodByFabuId(u7.getId());
                	if(glist!=null||glist.size()>0){
                		int count=0;
                		for(int i=0;i<glist.size();i++){
                			Good g=glist.get(i);
                			ArrayList<Apply> alist=aservice.getApplyByGoodId(g.getId());
                			if(alist!=null||alist.size()>0){
                				for(int j=0;j<alist.size();j++){
                					count++;
                					Apply a=alist.get(j);
                					String applyuser=uservice.findUserById(a.getUserid()).getName();
                					
                					SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
               						String applytime = sdf1.format(a.getApplyTime());
               						
               						if(!Judge.hasPic(g.getPicture())){
		            					g.setPicture("nopic.jpg");
		            				}
		            				
		            				if(!Judge.hasPic(a.getPicture())){
		            					a.setPicture("nopic.jpg");
		            				}
		            				
		            				String state="";
		            				if("0".equals(a.getState())){
		            					state="<font color='#ff0000'>等待您处理</font>";
		            				}else if("1".equals(a.getState())){
		            					state="已通过";
		            				}else if("2".equals(a.getState())){
		            					state="已驳回";
		            				}
                %>
                <tr>
                    <td><%=count %></td>
                    <td><a target="_blank" href="/FindU/html/single.jsp?id=<%=g.getId() %>"><%=g.getName() %></a></td>
                    <td><a target="_blank" href="/FindU/images/<%=g.getPicture() %>"><img src="/FindU/images/<%=g.getPicture() %>" alt="" width="120" height="50" /></a></td>
                    <td><%=applyuser %></td>
                    <td><%=a.getContact() %></td>
                     <td><a target="_blank" href="/FindU/images/<%=a.getPicture() %>"><img src="/FindU/images/<%=a.getPicture() %>" alt="" width="120" height="50" /></a></td>
                    <td><%=a.getExplain() %></td>
                    <td><%=applytime %></td>
                    <td><%=state %></td>
                    <td>
                        <div class="button-group">
                        <% if("0".equals(a.getState())){ 
                        	if(!"1".equals(g.getState())){
                        %>
                            <a type="button" class="button border-main" href="javascript:void(0)" onclick="return pass(<%=a.getId() %>)"><span class="icon-edit"></span> 通过</a>
                            <a class="button border-red" href="javascript:void(0)" onclick="return del(<%=a.getId() %>)"><span class="icon-trash-o"></span> 驳回</a>
                        <%
                        	}else{
                        %>
                        		<a class="button border-red" href="javascript:void(0)" onclick="return del(<%=a.getId() %>)"><span class="icon-trash-o"></span> 驳回</a>
                        <%
                        	}
                        }else{ 
                        %>
                        	<a type="button" class="button border-main" target="_blank" href="/FindU/html/single.jsp?id=<%=g.getId() %>"><span class="icon-edit"></span> 查看</a>
                        <%} %>
                        </div>
                    </td>
                </tr>
                <%
                				}
                			}
                		}
                	}
                %>
                <tr>
                <td colspan="10">
                    <div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">下一页</a><a href="">尾页</a> </div>
                </td>
                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">
        function pass(id) {
            if (confirm("您确定要通过吗?")) {
				window.location.href="/FindU/servlet/DealApplyServlet?passId="+id;
            }
        }

		function del(id) {
            if (confirm("您确定要驳回吗?")) {
				window.location.href="/FindU/servlet/DealApplyServlet?failId="+id;
            }
        }
    </script>
</body>

</html>
