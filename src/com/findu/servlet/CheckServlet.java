package com.findu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.findu.dao.UserDao;
import com.findu.entity.User;
import com.findu.utils.Judge;

public class CheckServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		
		if(name!=null&&!"".equals(name)&&Judge.isName(name)){
			out.print("specialName");
			return;
		}

		try {
			if (UserDao.findUserByName(name) != null) {
				out.print("name");
			}
			if (UserDao.findUserByEmail(email) != null) {
				out.print("email");
			}
			if (UserDao.findUserByPhone(tel) != null) {
				out.print("tel");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
