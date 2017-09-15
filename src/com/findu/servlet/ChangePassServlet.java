package com.findu.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.findu.entity.User;
import com.findu.exception.ChangeUserException;
import com.findu.service.UserService;

public class ChangePassServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
	    request.setCharacterEncoding("utf-8");
	    
	    //获得表单信息
	    String oldpass=request.getParameter("mpass");
	    String newpass=request.getParameter("newpass");
	    String renewpass=request.getParameter("renewpass");
	    
	    HttpSession session = request.getSession();
	    User user = (User)session.getAttribute("user");
	    
	    //调用service修改密码
	    UserService service = new UserService();
  		
  		try {
  			service.changePass(user,oldpass,newpass,renewpass);
  			
  			request.setAttribute("changePassMsg", "修改成功!");
  			request.getRequestDispatcher("/html/pass.jsp").forward(request, response);
  		} catch (ChangeUserException e) {
  			//错误信息
  			e.printStackTrace();
  			request.setAttribute("changePassMsg", e.getMessage());
  			request.getRequestDispatcher("/html/pass.jsp").forward(request, response);
  			return;
  		}				

	    /*session.removeAttribute("user");
	    response.sendRedirect("/FindU/html/signin.jsp");*/
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}
