package com.findu.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.findu.dao.GoodsDAO;
import com.findu.entity.G;
import com.findu.service.TypeService;

public class SearchServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		String search = "";
		String search1 = request.getParameter("Search");
		String search2 = request.getParameter("Search1");
		String search3 = request.getParameter("Search2");
		String search4 = request.getParameter("key");
		if(search4!=null){
			search4=new String(search4.getBytes("ISO-8859-1"),"UTF-8");//解决中文乱码
		}
		if (search1 != null) {
			search = search1;
		}
		if (search2 != null) {
			search = search2;
		}
		if (search3 != null) {
			search = search3;
		}
		if (search4 != null) {
			search = search4;
		}
		
		int typeid=-1;
		if(request.getParameter("typeid")!=null){
			typeid=Integer.parseInt(request.getParameter("typeid"));
		}

		String typename = request.getParameter("agileinfo_search");
		request.setAttribute("search", search);
		request.setAttribute("typeName", typename);

		if (("".equals(search)) || (search == null)) {
			request.setAttribute("searchMsg", "请输入搜索内容!");
			request.getRequestDispatcher("/html/search-result.jsp").forward(request,
					response);
			return;
		}
		
		//初始化每页显示条数
		int pageSize=10;
		int currentPage=1;
		String currPage=request.getParameter("currPage");
		GoodsDAO dao=new GoodsDAO();
		TypeService tservice = new TypeService();
		ArrayList<G> searchlist=null;
		int count = 0;
		try {
			if(typename!=null){
				typeid = tservice.findTypeIdByName(typename);
			}
			if (("AllTypes".equals(typename)) || typeid==-1) {
				count=dao.searchCount(search);
			}else{
				count=dao.searchTypeCount(search, typeid);
			}
			//System.out.println(count);
			int totalPage=(int) Math.ceil(count*1.0/pageSize);
			if(currPage!=null){
				currentPage= Integer.parseInt(currPage);
				if(currentPage<1){
					currentPage=1;
				}else if(currentPage>totalPage){
					currentPage=totalPage;
				}
			}
			if(typeid<0){
				searchlist=dao.searchGoodByName(currentPage, pageSize, search);
			}else{
				searchlist=dao.searchGoodInType(currentPage, pageSize, search, typeid);
			}
			String page=String.valueOf(currentPage);
			String total=String.valueOf(totalPage);
			request.setAttribute("totalPage", total);
			request.setAttribute("currPage", page);
			request.setAttribute("count", count);
			request.setAttribute("key", search);
			request.setAttribute("typeid", typeid);
			request.setAttribute("searchlist", searchlist);
			request.getRequestDispatcher("/html/search-result.jsp").forward(
					request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}		

		/*GoodService gservice = new GoodService();
		TypeService tservice = new TypeService();

		String result = "";
		if (("AllTypes".equals(typename)) || (typename == null)) {
			try {
				result = gservice.getSearchInAllCount(search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			int typeid = -1;
			try {
				typeid = tservice.findTypeIdByName(typename);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			try {
				result = gservice.getSearchInTypeCount(search, typeid);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}*/

		//request.setAttribute("searchResult", result);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}