package com.memberbill.listener;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.memberbill.model.MemberBillMailService;
import com.memberbill.model.MemberBillService;
import com.memberbill.model.MemberBillVO;

@WebListener
public class MemberListener implements ServletContextListener {
	private Timer timer = new Timer();
	
	private TimerTask task = new TimerTask() {
		@Override
		public void run() {
			MemberBillService memberBillService = new MemberBillService();
			List<MemberBillVO> list = memberBillService.getAllMemberGroupData();
			
			for (MemberBillVO memberBillVO : list) {
				
				Integer memberBillId = (int) ((Math.random() * 100000) + 1);
				memberBillVO.setMemberBillId(memberBillId);
				memberBillVO.setBillDate(getDate());// 帳單月份

				memberBillService.insertMemberBill(memberBillVO);
				String to = "yunru29@gmail.com";
				String subject = "111年12月綜合帳單";
				String ch_name = "最新應繳總金額";
				String passRandom = "3,000元";
				String alert = "繳費期限 2022/12/31";
				String messageText = ch_name + "\n" + passRandom + "\n" + alert;
				MemberBillMailService memberBillMailService = new MemberBillMailService();
				memberBillMailService.sendMail(to, subject, messageText);
	
			}

		}
	};

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		timer.scheduleAtFixedRate(task, cal.getTime(),60 * 60 * 1000);
		System.out.println("123");
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		timer.cancel();
	}
	
	Calendar cal = Calendar.getInstance();

	private String getDate() {// 帳單日期
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM");// 設定格式
		try {
			Date date = sdFormat.parse("2022-11-21");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, 30);
		return sdFormat.format(calendar.getTime());// 取得當下日期 + 一個月 = 排程要發送的日期
	}

	// 4.每月固定25日產生下個月的帳單發送
	private String getPayLimit() {// 帳單發送日期
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 設定格式
		try {
			Date date = sdFormat.parse("2022-11-21");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, 1);
//		System.out.println("獲取本月" + sdFormat.format(calendar.getTime()));
		return sdFormat.format(calendar.getTime());
	}
}
