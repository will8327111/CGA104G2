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
//			String url = req.getContextPath() + "/front-end/activity/list.jsp";
//			res.sendRedirect(url);
		}

		// 有用
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
		
		//有用(jsp)
//		if ("oneUpdate".equals(action)) {
//			
//			Integer actId = Integer.valueOf(req.getParameter("actId"));
//			ActivityService actSvc = new ActivityService();
//			ActivityVO activityVO = actSvc.getOne(actId);
//			req.setAttribute("activity", activityVO);
//			
//			String parameter = "?actName="+activityVO.getActName()+
//								"&actType="+activityVO.getActType()+
//								"&actContent="+activityVO.getActContent()+
//								"&actMaxNumber="+activityVO.getActMaxCount()+
//								"&actMinNumber="+activityVO.getActMinCount()+
//								"&actSignupStart="+activityVO.getSignStart()+
//								"&actSingupEnd="+activityVO.getSignEnd()+
//								"&actStart="+activityVO.getActStart()+
//								"&actEnd="+activityVO.getActEnd()+
//								"&actCountry="+activityVO.getActCountry()+
//								"&actLocation="+activityVO.getActLocation()+
//								"&actCost="+activityVO.getActCost()+
//								"&actId="+activityVO.getActId();
//			
//			String url = "/front-end/activity/update.jsp"+parameter;
//			RequestDispatcher update = req.getRequestDispatcher(url);
//			update.forward(req, res);
//		}

		// 有用(jsp)
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
//				errorMsgs.put("name","活動名稱: 請勿空白");
//			} else if (!name.trim().matches(nameReg)) {
//				errorMsgs.put("name","活動名稱:請在2~10個中英數字");
//			}
//
//			String content = req.getParameter("actcontent");
//			String contentReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,500}$";
//			if (content == null || content.trim().length() == 0) {
//				errorMsgs.put("actcontent","活動內容請勿空白");
//			} else if (!content.trim().matches(contentReg)) {
//				errorMsgs.put("actcontent","活動內容請勿低於十個字或超過500個字,只能使用中英文和數字");
//			}
//
//			Integer max = null;
//			try {
//				max = Integer.valueOf(req.getParameter("actMax").trim());
//			} catch (NumberFormatException e) {
//				max = 10;
//				errorMsgs.put("actMax","請填入最參加大人數,目前預設幫你設定為10");
//			}
//
//			Integer min = null;
//			try {
//				min = Integer.valueOf(req.getParameter("actMin").trim());
//			} catch (NumberFormatException e) {
//				min = 1;
//				errorMsgs.put("actMin","請填入最小參加人數,目前預設幫你設定為1");
//			}
//
//			java.sql.Date sgst = null;
//			try {
//				sgst = java.sql.Date.valueOf(req.getParameter("singst").trim());
//			} catch (IllegalArgumentException e) {
//				errorMsgs.put("singst","請輸入報名開始日期!");
//			}
//
//			java.sql.Date sget = null;
//			try {
//				sget = java.sql.Date.valueOf(req.getParameter("singet").trim());
//			} catch (IllegalArgumentException e) {
//				errorMsgs.put("singet","請輸入報名截止日期!");
//			}
//
//			java.sql.Date actst = null;
//			try {
//				actst = java.sql.Date.valueOf(req.getParameter("actst").trim());
//			} catch (IllegalArgumentException e) {
//				errorMsgs.put("actst","請輸入活動開始日期!");
//			}
//
//			java.sql.Date actet = null;
//			try {
//				actet = java.sql.Date.valueOf(req.getParameter("actet").trim());
//			} catch (IllegalArgumentException e) {
//				errorMsgs.put("actet","請輸入活動開始日期!");
//			}
//
//			String country = req.getParameter("actcountry");
//
//			String location = req.getParameter("actlocation");
//			String locationReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//			if (location == null || location.trim().length() == 0) {
//				errorMsgs.put("actlocation","活動地址: 請勿空白");
//			} else if (!location.trim().matches(locationReg)) {
//				errorMsgs.put("actlocation","活動地址:請輸入活動地址");
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

		if ("delete".equals(action)) {

			Integer actId = Integer.valueOf(req.getParameter("deleteId"));
			ActivityReportService report = SpringUtil.getBean(getServletContext(), ActivityReportService.class);
			 report.deleteAct(actId);
			ActivityService service = new ActivityService();
			service.delete(actId);
		}

		// 有用
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

		// 有用
		if ("location".equals(action)) {
			ActivityService actSvc1 = new ActivityService();
			out.write(actSvc1.findCountry().toString());

		}

		if ("ID".equals(action)) {
			Integer id = Integer.valueOf(req.getParameter("ID"));
			session.setAttribute("id", id);
			String url = req.getContextPath() + "/front-end/activity/front-index.html";
			res.sendRedirect(url);

		}

		if ("adddata".equals(action)) {
			Integer id = Integer.valueOf(req.getParameter("actid"));
			ActivityService actSvc1 = new ActivityService();
			out.write(actSvc1.getOneJS(id).toString());
		}

		// 有用
		if ("getPage".equals(action)) {
			Integer page = Integer.valueOf(req.getParameter("page"));
			ActivityService actSvc1 = new ActivityService();
			out.write(actSvc1.getPage(page).toString());

		}
		
		
		//有用
		if ("list".equals(action)) {

			ActivityService actSvc = new ActivityService();
			Integer memId = Integer.valueOf(req.getParameter("memId"));
			out.write(actSvc.getById(memId).toString());

		}

		// 有用
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

			//有用
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
		
		
		if("getName".equals(action)) {
		
			
			Integer memId = Integer.valueOf(req.getParameter("memId"));
			
			ActivityService actSvc = new ActivityService();
			out.write(actSvc.name(memId).toString());
			
		}
		
	}

}
