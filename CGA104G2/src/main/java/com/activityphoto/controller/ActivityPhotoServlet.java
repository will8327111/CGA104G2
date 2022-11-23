package com.activityphoto.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.activityphoto.model.ActivityPhotoService;
import com.activityphoto.model.ActivityPhotoVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;


 
@WebServlet("/activity/ActPhotoServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ActivityPhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	   String action = req.getParameter("action");
		
		if("list".equals(action)) {
		String id = req.getParameter("actid");
		ActivityPhotoService service = new ActivityPhotoService();
		res.getOutputStream().write(service.getAll(Integer.parseInt(id)));
		}
		
		
		//有用
		if("actPhoto".equals(action)) {
			String id = req.getParameter("actId");
			ActivityPhotoService service = new ActivityPhotoService();
				PrintWriter out = res.getWriter();
				out.write(service.actPhotos(Integer.parseInt(id)).toString());				
		}
		
		
		
		
	}
		
		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			
			req.setCharacterEncoding("UTF-8");
			res.setCharacterEncoding("UTF-8");
			  String action = req.getParameter("action");
			  
			if("updateById".equals(action)) {
				String photoId = req.getParameter("updatePhoto");
				String actId = req.getParameter("actId");
				
				
				Part photo = req.getPart("photoChange");
				byte[] photo1 = null;
				
				
				try(InputStream is = photo.getInputStream();
					BufferedInputStream	bis = new BufferedInputStream(is);
						){
					photo1 = new byte[bis.available()];
					bis.read(photo1);
				}catch (IOException e) {
					e.printStackTrace();
				}
					
				ActivityPhotoVO phtoVO = new ActivityPhotoVO();
				phtoVO.setActPhotoId(Integer.parseInt(photoId));
				phtoVO.setActPhoto(photo1);
				ActivityPhotoService service = new ActivityPhotoService();
				service.update(phtoVO);
				String url =req.getContextPath()+"/activity/ActServlet?action=oneupdate&oneactid="+actId;
				res.sendRedirect(url);
			}
			
			
			
			if("deleteById".equals(action)) {
				Gson gson = new Gson();
				JsonObject object  =gson.fromJson(req.getReader(), JsonObject.class);
				Integer actId = gson.fromJson(object.get("id"),Integer.class);
				ActivityPhotoService service = new ActivityPhotoService();
				service.deletePhotoId(actId);
			String url =req.getContextPath()+"/activity/ActServlet?action=oneupdate&oneactid="+actId;
				res.sendRedirect(url);
			}
			
	
		}
		

	
}
