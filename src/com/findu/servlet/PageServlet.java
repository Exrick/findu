package com.findu.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.findu.dao.GoodsDAO;
import com.findu.entity.G;
import com.findu.entity.PageBean;

public class PageServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//初始化每页显示条数
		int pageSize=10;
		int currentPage=1;
		String currPage=request.getParameter("currPage");
		if(currPage!=null){
			currentPage= Integer.parseInt(currPage);
		}
		GoodsDAO dao=new GoodsDAO();
		try {
			int count = dao.count();
			int totalPage=(int) Math.ceil(count*1.0/pageSize);
			List<G> goods=dao.findGoodByPage(currentPage,pageSize);
			
			PageBean pb=new PageBean();
			pb.setGoods(goods);
			pb.setCount(count);
			pb.setCurrentPage(currentPage);
			pb.setPageSize(pageSize);
			pb.setTotalPage(totalPage);
			
			request.setAttribute("pb", pb);
			request.getRequestDispatcher("/html/all-classifieds.jsp").forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}
