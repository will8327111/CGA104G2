package com.activity.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.activity.model.ActivityService;
import com.activity.model.ActivityVO;


@WebServlet(name="timer",
		urlPatterns = {"/ActivityUpdate"},
		loadOnStartup = 1)
public class ActivityUpdate extends HttpServlet {

  Timer t1 = new Timer();
	
	@Override
	public void init() throws ServletException {
		t1.scheduleAtFixedRate(task, cal.getTime(), 24*60*60*1000);	
	}
  
  

	TimerTask task = new TimerTask() {
				@Override
		public void run() {
					ActivityService service = new ActivityService();
					List<ActivityVO> list= service.get();
					for(ActivityVO vo : list ) {
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				java.sql.Date today = java.sql.Date.valueOf	(dateFormat.format(cal.getTime()));
						Integer result = vo.getSignEnd().compareTo(today);
						if(result<0) {
							service.expired(vo.getActId());
						}		
					}
					
		}
	};
	
	Calendar cal = Calendar.getInstance();
	
	
	
	
	@Override
	public void destroy() {
		t1.cancel();	
	}

	

}
