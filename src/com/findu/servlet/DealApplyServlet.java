package com.findu.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.findu.exception.ApplyException;
import com.findu.service.ApplyService;

public class DealApplyServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
	    request.setCharacterEncoding("utf-8");
	    
	    int applyid=-1;
	    
	    //调用service
	    ApplyService aservice=new ApplyService();
  		
  		try {
  			if(request.getParameter("passId")!=null){
  		    	applyid=(Integer.parseInt(request.getParameter("passId")));
  		    	aservice.dealApply("1", applyid);
  		    }else if(request.getParameter("failId")!=null){
  		    	applyid=(Integer.parseInt(request.getParameter("failId")));
  		    	aservice.dealApply("2", applyid);
  		    }
  			
  			request.setAttribute("dealMsg", "处理成功!");
  			request.getRequestDispatcher("/html/applymanage.jsp").forward(request, response);
  		} catch (ApplyException e) {
  			//错误信息
  			e.printStackTrace();
  			request.setAttribute("dealMsg", e.getMessage());
  			request.getRequestDispatcher("/html/applymanage.jsp").forward(request, response);
  			return;
  		}		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}
