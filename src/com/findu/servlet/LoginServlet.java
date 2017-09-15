package com.findu.servlet;

import java.io.IOException;

import javax.security.auth.login.LoginException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.findu.entity.User;
import com.findu.exception.UserExistsException;
import com.findu.service.UserService;

public class LoginServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//获取用户名与密码
		String name = request.getParameter("Name");
		String password = request.getParameter("Password");

		//调用service登录
		UserService service = new UserService();
		
		try {
			User user = service.login(name, password);
			
			//登录成功，将用户存储到session中
			request.getSession().setAttribute("user", user);
			request.setAttribute("Msg", "恭喜您，登陆成功!");
			request.getRequestDispatcher("/html/index.jsp").forward(request,
					response);
		} catch (UserExistsException e) {
			//错误信息
			e.printStackTrace();
			//保存用户名缓存
			request.setAttribute("tempname", name);
			
			request.setAttribute("Msg", e.getMessage());
			request.getRequestDispatcher("/html/signin.jsp").forward(request,
					response);
			return;
		}			
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}