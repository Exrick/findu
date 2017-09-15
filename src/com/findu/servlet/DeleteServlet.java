package com.findu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.findu.service.GoodService;

public class DeleteServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
	    request.setCharacterEncoding("utf-8");
	    PrintWriter out = response.getWriter();
	    
	    int goodid=(Integer.parseInt(request.getParameter("goodId")));
	    
	    GoodService gservice=new GoodService();
	    try {
			gservice.deleteGood(goodid);
		} catch (Exception e) {
			request.setAttribute("delMsg", "É¾³ýÊ§°Ü!");
			request.getRequestDispatcher("/html/mypost.jsp").forward(request, response);
			e.printStackTrace();
			return;
		}

	    request.setAttribute("delMsg", "É¾³ý³É¹¦!");
	    request.getRequestDispatcher("/html/mypost.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}
