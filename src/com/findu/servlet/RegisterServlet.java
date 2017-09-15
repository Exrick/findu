package com.findu.servlet;

import com.findu.dao.UserDao;
import com.findu.entity.User;
import com.findu.exception.RegisterException;
import com.findu.exception.UserExistsException;
import com.findu.service.UserService;
import com.findu.utils.Judge;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//获取表单注册信息
		String username = request.getParameter("Name");
		String email = request.getParameter("Email");
		String phone = request.getParameter("tel");
		String password = request.getParameter("Password");
		String repassword = request.getParameter("Repassword");
		String checkbox = request.getParameter("checkbox");

		User user = new User(username, repassword, email, phone);

		//调用service注册
		UserService service = new UserService();
		
		try {
			service.register(user, checkbox, password);

			request.setAttribute("registerMsg", "恭喜您，注册成功!");
			request.getRequestDispatcher("/html/message.jsp").forward(request,
					response);
		} catch (RegisterException e) {
			//错误信息
			e.printStackTrace();
			//保存用户注册缓存信息
			request.setAttribute("formbean", user);
			request.setAttribute("checkbox", checkbox);
			
			request.setAttribute("registerMsg", e.getMessage());
			request.getRequestDispatcher("/html/signup.jsp").forward(request,
					response);
			return;
		}				
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}