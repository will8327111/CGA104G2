package com.activity.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONArray;
import org.json.JSONObject;

import com.activity.model.ActivityDAO;
import com.activity.model.ActivityService;
import com.activity.model.ActivityVO;
import com.activityphoto.model.ActivityPhotoService;
import com.activityreport.model.ActivityReportService;
import com.activitysignup.model.ActivitySignupService;
import com.activitysignup.model.ActivitySignupVO;
import com.activity.common.SpringUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.memberLogin.model.MemberLoginVO;

@WebServlet("/activity/ActServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ActivityServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		PrintWriter out = res.getWriter();

		if ("insert".equals(action)) {
			System.out.println("????????????");
			Integer memid = (Integer) session.getAttribute("id");

			List<byte[]> photo = new ArrayList<byte[]>();

			for (Part part : req.getParts()) {
				String filename = part.getSubmittedFileName();
				if (filename != null && filename.length() != 0) {
					try (InputStream is = part.getInputStream();
							BufferedInputStream bis = new BufferedInputStream(is)) {

						byte[] photo1 = new byte[bis.available()];
						bis.read(photo1);
						photo.add(photo1);

					} catch (IOException e) {
						e.printStackTrace(System.err);
					}

				}
			}

			Integer actType = Integer.valueOf(req.getParameter("actTypeNo").trim());
			String name = req.getParameter("actName");
			String content = req.getParameter("actContent");
			Integer max = Integer.valueOf(req.getParameter("actMax").trim());
			Integer min = Integer.valueOf(req.getParameter("actMin").trim());
			java.sql.Date sgst = java.sql.Date.valueOf(req.getParameter("singStart").trim());
			java.sql.Date sget = java.sql.Date.valueOf(req.getParameter("singEnd").trim());
			java.sql.Date actst = java.sql.Date.valueOf(req.getParameter("actStart").trim());
			java.sql.Date actet = java.sql.Date.valueOf(req.getParameter("actEnd").trim());
			String country = req.getParameter("actCountry");
			String location = req.getParameter("actLocation");
			Integer cost = Integer.valueOf(req.getParameter("actCost").trim());
			ActivityService actSvc = new ActivityService();
			actSvc.addAct(memid, actType, name, content, max, min, sgst, sget, actst, actet, country, location, cost,
					photo);
			String url = req.getContextPath()+"/front-end/activity/homepage3.html";
			res.sendRedirect(url);
			
		}

		// ??????
		if ("view".equals(action)) {
			Integer memid = (Integer) session.getAttribute("id");
			Integer actId = Integer.valueOf(req.getParameter("actId"));
			ActivityService service = new ActivityService();
			ActivitySignupService serviceSign = new ActivitySignupService();
			Integer status = null;
			ActivitySignupVO vo = serviceSign.getData(actId, memid);
			if (vo != null) {
				status = vo.getSignupStatus();
			} else {
				status = 0;
			}
			ActivityVO activityVO = service.getOne(actId);
			req.setAttribute("status", status);
			req.setAttribute("activity", activityVO);
			String url = "/front-end/activity/singleone.jsp";
			RequestDispatcher getOne = req.getRequestDispatcher(url);
			getOne.forward(req, res);
		}
		

		// ??????(jsp)
//		if ("update".equals(action)) {
//			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//			Integer memid = (Integer) session.getAttribute("id");
//			Integer id = Integer.valueOf(req.getParameter("id"));
//
//			List<byte[]> photo = new ArrayList<byte[]>();
//
//			for (Part part : req.getParts()) {
//				String filename = part.getSubmittedFileName();
//				if (filename != null && filename.length() != 0) {
//					try (InputStream is = part.getInputStream();
//							BufferedInputStream bis = new BufferedInputStream(is)) {
//
//						byte[] photo1 = new byte[bis.available()];
//						bis.read(photo1);
//						photo.add(photo1);
//
//					} catch (IOException e) {
//						e.printStackTrace(System.err);
//					}
//
//				}
//			}
//
//			Integer actType = Integer.valueOf(req.getParameter("acttypeno").trim());
//
//			String name = req.getParameter("actname");
//			String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//			if (name == null || name.trim().length() == 0) {
//				errorMsgs.put("name","????????????: ????????????");
//			} else if (!name.trim().matches(nameReg)) {
//				errorMsgs.put("name","????????????:??????2~10???????????????");
//			}
//
//			String content = req.getParameter("actcontent");
//			String contentReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,500}$";
//			if (content == null || content.trim().length() == 0) {
//				errorMsgs.put("actcontent","????????????????????????");
//			} else if (!content.trim().matches(contentReg)) {
//				errorMsgs.put("actcontent","??????????????????????????????????????????500??????,??????????????????????????????");
//			}
//
//			Integer max = null;
//			try {
//				max = Integer.valueOf(req.getParameter("actMax").trim());
//			} catch (NumberFormatException e) {
//				max = 10;
//				errorMsgs.put("actMax","???????????????????????????,???????????????????????????10");
//			}
//
//			Integer min = null;
//			try {
//				min = Integer.valueOf(req.getParameter("actMin").trim());
//			} catch (NumberFormatException e) {
//				min = 1;
//				errorMsgs.put("actMin","???????????????????????????,???????????????????????????1");
//			}
//
//			java.sql.Date sgst = null;
//			try {
//				sgst = java.sql.Date.valueOf(req.getParameter("singst").trim());
//			} catch (IllegalArgumentException e) {
//				errorMsgs.put("singst","???????????????????????????!");
//			}
//
//			java.sql.Date sget = null;
//			try {
//				sget = java.sql.Date.valueOf(req.getParameter("singet").trim());
//			} catch (IllegalArgumentException e) {
//				errorMsgs.put("singet","???????????????????????????!");
//			}
//
//			java.sql.Date actst = null;
//			try {
//				actst = java.sql.Date.valueOf(req.getParameter("actst").trim());
//			} catch (IllegalArgumentException e) {
//				errorMsgs.put("actst","???????????????????????????!");
//			}
//
//			java.sql.Date actet = null;
//			try {
//				actet = java.sql.Date.valueOf(req.getParameter("actet").trim());
//			} catch (IllegalArgumentException e) {
//				errorMsgs.put("actet","???????????????????????????!");
//			}
//
//			String country = req.getParameter("actcountry");
//
//			String location = req.getParameter("actlocation");
//			String locationReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//			if (location == null || location.trim().length() == 0) {
//				errorMsgs.put("actlocation","????????????: ????????????");
//			} else if (!location.trim().matches(locationReg)) {
//				errorMsgs.put("actlocation","????????????:?????????????????????");
//			}
//
//			Integer cost = null;
//			try {
//				cost = Integer.valueOf(req.getParameter("actcost").trim());
//			} catch (NumberFormatException e) {
//				cost = 0;
//			}
//
//			
//			if (!errorMsgs.isEmpty()) {
//				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/activity/updateactivity.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//
//			ActivityService actSvc = new ActivityService();
//			actSvc.update(actType, name, content, max, min, sgst, sget, actst, actet, country, location, cost, photo,
//					id,memid);
//
//			String url = "/front-end/activity/homepage.html";
//			RequestDispatcher successView = req.getRequestDispatcher(url);
//			successView.forward(req, res);
//		}

		if ("delete".equals(action)) {;
			Integer actId = Integer.valueOf(req.getParameter("deleteId"));
			ActivityReportService report = SpringUtil.getBean(getServletContext(), ActivityReportService.class);
			 report.deleteAct(actId);
			ActivityService service = new ActivityService();
			service.delete(actId);
		}

		// ??????
		if ("search".equals(action)) {

			String country = req.getParameter("country");
			Integer actType = Integer.valueOf(req.getParameter("type"));
			String actName = req.getParameter("name");

			if (actType == 0 && country == null && country.trim().length() == 0 && actName == null
					&& actName.trim().length() == 0) {
				JSONObject object = null;
				out.write(object.toString());
			}

			ActivityService service = new ActivityService();
			out.write(service.search(country, actType, actName).toString());

		}

		// ??????
		if ("location".equals(action)) {
			ActivityService actSvc1 = new ActivityService();
			out.write(actSvc1.findCountry().toString());

		}


		if ("adddata".equals(action)) {
			Integer id = Integer.valueOf(req.getParameter("actid"));
			ActivityService actSvc1 = new ActivityService();
			out.write(actSvc1.getOneJS(id).toString());
		}

		// ??????
		if ("getPage".equals(action)) {
			Integer page = Integer.valueOf(req.getParameter("page"));
			ActivityService actSvc1 = new ActivityService();
			out.write(actSvc1.getPage(page).toString());

		}
		
		
		//??????
		if ("list".equals(action)) {

			ActivityService actSvc = new ActivityService();
			Integer memId = Integer.valueOf(req.getParameter("memId"));
			out.write(actSvc.getById(memId).toString());

		}

		// ??????
		if ("getButton".equals(action)) {

			ActivityService actSvc = new ActivityService();
			List<Integer> list = actSvc.getAll();
			JSONObject object = new JSONObject();
			Integer number = 0;
			if (list.size() % 3 != 0) {
				number = (list.size() / 3) + 1;
			} else {
				number = (list.size() / 3);
			}
			object.put("button", number);
			out.write(object.toString());
		}

			//??????
		if("getOne".equals(action)) {
			ActivityService actSvc = new ActivityService();
			Integer actId = Integer.valueOf(req.getParameter("actId"));
			out.write(actSvc.getOneJS(actId).toString());
		}
		
		if("updateJS".equals(action)) {
			Gson gson = new Gson();
			gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			JsonObject json = gson.fromJson(req.getReader(), JsonObject.class);

			ActivityVO vo = gson.fromJson(json.get("activity"), ActivityVO.class);
			String[] photo64 = gson.fromJson(json.get("photo"), String[].class);
			List<byte[]> photo = new ArrayList<byte[]>();
			
			if(photo64.length!=0) {
			for(String image:photo64) {
				String base64Image = image.split(",")[1];
			byte[] transform = Base64.getDecoder().decode(base64Image);
					photo.add(transform);
				}
			}
			ActivityService actSvc = new ActivityService();
			actSvc.updateJS(vo, photo);
		}
		
		
		if("getMember".equals(action)) {
			MemberLoginVO memeber = (MemberLoginVO)session.getAttribute("memberLoginVO");
			session.setAttribute("id",memeber.getMemberId());
			JSONObject json = new JSONObject();
			json.put("memId", memeber.getMemberId());
			json.put("memName",memeber.getMemberName());
			out.write(json.toString());
		}
		

		
		
		
	}

}
