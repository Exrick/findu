package com.findu.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.findu.entity.User;
import com.findu.exception.ChangeUserException;
import com.findu.service.UserService;

public class InfoChangeServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//获取表单信息
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		String sex = request.getParameter("Sex");
		String birth = request.getParameter("Birth");
		String qq = request.getParameter("QQ");
		String address = request.getParameter("Address");
		String introduce = request.getParameter("Introduce");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(birth);
		} catch (Exception e) {
			e.printStackTrace();
		}

		User u = new User(sex, date, address, introduce, qq);
		
		 //调用service
	    UserService service = new UserService();
  		
  		try {
  			service.changeUserData(u);
  			
  			u = new User(user.getId(), user.getName(), user.getPhone(),
  					user.getEmail(), u.getGender(), u.getBirthday(), u.getQq(),
  					u.getAddress(), u.getExplain());

  			request.getSession().setAttribute("user", u);

  			request.setAttribute("changeMsg", "保存成功!");
  			request.getRequestDispatcher("/html/info.jsp").forward(request,
  					response);
  		} catch (ChangeUserException e) {
  			//错误信息
  			e.printStackTrace();
  			request.setAttribute("changeMsg", e.getMessage());
  			request.getRequestDispatcher("/html/info.jsp").forward(request,
					response);
  			return;
  		}		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}