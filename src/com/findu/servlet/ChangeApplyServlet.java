package com.findu.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.findu.entity.Apply;
import com.findu.entity.User;
import com.findu.service.ApplyService;
import com.findu.service.GoodService;
import com.findu.utils.Judge;
import com.findu.utils.UUIDUtils;
import com.jspsmart.upload.SmartUpload;

public class ChangeApplyServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
	    request.setCharacterEncoding("utf-8");
	    
	    GoodService gservice=new GoodService();
	    ApplyService aservice=new ApplyService();
	    
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
	      request.setAttribute("applyMsg", "上传失败!");
	      flag = 1;
	      if (e.getMessage().indexOf("1015") != -1)
	        request.setAttribute("applyMsg", "上传失败：上传图片文件类型不正确!");
	      else if (e.getMessage().indexOf("1010") != -1)
	        request.setAttribute("applyMsg", "上传失败：上传图片文件类型不正确!");
	      else if (e.getMessage().indexOf("1115") != -1)
	        request.setAttribute("applyMsg", "上传失败：上传图片文件大小大于允许上传大小!");
	      else if (e.getMessage().indexOf("1110") != -1) {
	        request.setAttribute("applyMsg", "上传失败：上传图片文件大小大于允许上传总大小!");
	      }
	    }

	    String explain = su.getRequest().getParameter("Explain");
	    String contact = su.getRequest().getParameter("Contact");
	    String gid = su.getRequest().getParameter("ID");
	    int applyid =Integer.parseInt(su.getRequest().getParameter("applyID"));

	    HttpSession session = request.getSession();
	    User user = (User)session.getAttribute("user");
	    int userid = user.getId();

	    int goodid = 0;
	    if (("".equals(gid)) || (gid == null)) {
	      System.out.println("获取该申请物品ID失败!");
	      return;
	    }
	    goodid = Integer.parseInt(gid);
	    
	    String picture = "";
	    
	    if(Judge.hasPic(picName)){
	    	picture = picName;
		}else{
			try {
				picture=aservice.getApplyById(applyid).getPicture();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	    Apply apply = new Apply(explain, contact, picture);
	    apply.setId(applyid);
	    ApplyService service = new ApplyService();

	    if (flag != 1) {
	      try {
	        service.updateApply(apply);
	      } catch (Exception e) {
	        request.setAttribute("applyMsg", "修改失败，请勿重复申请!");
	        request.getRequestDispatcher("/html/message.jsp?id=" + goodid).forward(request, response);
	        return;
	      }

	      request.setAttribute("applyMsg", "重新编辑提交成功!");
	      request.getRequestDispatcher("/html/message.jsp?id=" + goodid).forward(request, response);
	      return;
	    }

	    request.getRequestDispatcher("/html/apply.jsp?id=" + goodid).forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}
