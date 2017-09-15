package com.findu.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.findu.dao.GoodsDAO;
import com.findu.entity.Good;

public class AJAXSearchServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String name=request.getParameter("name");
		name=new String(name.getBytes("ISO-8859-1"),"UTF-8");//解决中文乱码
		
		if(name==null||"".equals(name)){
			return;
		}
		
		GoodsDAO dao=new GoodsDAO();
		ArrayList<Good> list=dao.findGoodByNameAJAX(name);
		
		//将名字符串返回网页
		String str="";
		if(list.size()<=5){
			for(int i=0;i<list.size();i++){
				if(i>0){
					str+=",";
				}
				str+=list.get(i).getName();
			}
		}else{
			for(int i=0;i<5;i++){
				if(i>0){
					str+=",";
				}
				str+=list.get(i).getName();
			}
		}
		
		//把数据直接响应
		response.getWriter().write(str);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}
