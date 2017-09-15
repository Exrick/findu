package com.findu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.findu.exception.ApplyException;
import com.findu.service.ApplyService;

public class DelApplyServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
	    request.setCharacterEncoding("utf-8");
	    PrintWriter out = response.getWriter();
	    
	    int applyid=(Integer.parseInt(request.getParameter("ApplyId")));

	    //调用service
	    ApplyService aservice=new ApplyService();
  		
  		try {
  			aservice.delApply(applyid);
  			
  			request.setAttribute("delMsg", "删除成功!");
  		    request.getRequestDispatcher("/html/myapply.jsp").forward(request, response);
  		} catch (ApplyException e) {
  			//错误信息
  			e.printStackTrace();
  			request.setAttribute("delMsg", e.getMessage());
  			request.getRequestDispatcher("/html/pass.jsp").forward(request, response);
  			return;
  		}			    
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}
