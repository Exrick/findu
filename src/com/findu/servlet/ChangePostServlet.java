package com.findu.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.findu.dao.GoodsDAO;
import com.findu.dao.TypeDAO;
import com.findu.entity.Good;
import com.findu.entity.Type;
import com.findu.entity.User;
import com.findu.service.GoodService;
import com.findu.utils.Judge;
import com.findu.utils.UUIDUtils;
import com.jspsmart.upload.SmartUpload;

public class ChangePostServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	    response.setContentType("text/html;charset=utf-8");
	    request.setCharacterEncoding("utf-8");
	    
	    GoodService gservice = new GoodService();

	    String picName = "";
	    String uuid = UUIDUtils.getUUID();

	    String filePath = getServletContext().getRealPath("/") + "images";

	    File file = new File(filePath);
	    if (!file.exists()) {
	      file.mkdir();
	    }

	    SmartUpload su = new SmartUpload();

	    su.initialize(getServletConfig(), request, response);

	    su.setCharset("utf-8");

	    su.setMaxFileSize(5242880);
	    su.setTotalMaxFileSize(5242880);
	    su.setAllowedFilesList("jpg,png,gif,jpeg");

	    int flag = 0;
	    try
	    {
	      su.upload();

	      String ext = su.getFiles().getFile(0).getFileExt();

	      if ((ext != null) || (!"".equals(ext))) {
	        picName = uuid + "." + ext;
	        su.getFiles().getFile(0).saveAs(getServletContext().getRealPath("/") + "images\\" + picName);
	      }
	    }
	    catch (Exception e) {
	      request.setAttribute("postMsg", "上传失败!");
	      flag = 1;
	      if (e.getMessage().indexOf("1015") != -1)
	        request.setAttribute("postMsg", "上传失败：上传图片文件类型不正确!");
	      else if (e.getMessage().indexOf("1010") != -1)
	        request.setAttribute("postMsg", "上传失败：上传图片文件类型不正确!");
	      else if (e.getMessage().indexOf("1115") != -1)
	        request.setAttribute("postMsg", "上传失败：上传图片文件大小大于允许上传大小!");
	      else if (e.getMessage().indexOf("1110") != -1) {
	        request.setAttribute("postMsg", "上传失败：上传图片文件大小大于允许上传总大小!");
	      }
	    }
	    
	    int goodid=Integer.parseInt(su.getRequest().getParameter("GetID"));
	    String goodname = su.getRequest().getParameter("GoodName");
	    String explain = su.getRequest().getParameter("Explain");
	    String getsite = su.getRequest().getParameter("GetSite");
	    String contact = su.getRequest().getParameter("Contact");
	    String goodtime = su.getRequest().getParameter("act_start_time");
	    String value = su.getRequest().getParameter("Value");
	    String picture = "";
	    
	    if(Judge.hasPic(picName)){
	    	picture = picName;
		}else{
			try {
				picture=gservice.findGoodById(goodid).getPicture();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	    
	    int goodvalue = 0;

	    String typename = su.getRequest().getParameter("Option");
	    TypeDAO td = new TypeDAO();
	    Type t = TypeDAO.findTypeByName(typename);
	    if (t == null) {
	      request.setAttribute("postMsg", "数据库未找到该物品类型，请联系管理员!");
	      flag = 1;
	    }
	    int type = t.getTypeid();

	    HttpSession session = request.getSession();
	    User user = (User)session.getAttribute("user");
	    int fabuid = user.getId();

	    if ((goodtime == null) || ("".equals(goodtime))) {
	      request.setAttribute("postMsg", "您还未选择拾取时间!");
	      flag = 1;
	    }

	    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    Date du = null;
	    int timeflag = 0;
	    try {
	      du = df.parse(goodtime);
	    } catch (Exception e1) {
	      timeflag = 1;
	    }
	    Timestamp st = null;
	    if (timeflag != 1) {
	      st = new Timestamp(du.getTime());
	    }
	    
	    if (Judge.isValue(value).booleanValue()) {
	        goodvalue = Integer.parseInt(value);
	        if ((goodvalue < 0) || (goodvalue > 9999)) {
	          request.setAttribute("postMsg", "物品估价请输入数字0~9999!");
	          flag = 1;
	        }
	      } else {
	        request.setAttribute("postMsg", "物品估价请输入数字0~9999!");
	        flag = 1;
	      }

	    Good good = new Good(goodname, getsite, explain, type, fabuid, contact, st, goodvalue, picture);
	    good.setId(goodid);
	    
	    if (flag != 1)
	    {
	      try {
	        gservice.updateGood(good);
	      } catch (Exception e) {
	        request.setAttribute("postMsg", "修改失败!");
	        request.getRequestDispatcher("/html/change-post.jsp").forward(request, response);
	        return;
	      }

	      response.sendRedirect("/FindU/html/single.jsp?id=" + good.getId());
	      return;
	    }

	    request.getRequestDispatcher("/html/change-post.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}
