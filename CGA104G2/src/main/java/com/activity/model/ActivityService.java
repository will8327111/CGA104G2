package com.activity.model;

import java.sql.Date;
import java.util.Base64;
import java.util.List;
import java.util.Base64.Encoder;

import org.hibernate.Transaction;
import org.json.JSONArray;
import org.json.JSONObject;

import com.activity.common.*;
import com.activityphoto.model.ActivityPhotoDAO;
import com.activityphoto.model.ActivityPhotoDAO_interface;
import com.activityphoto.model.ActivityPhotoVO;
import com.activityreply.model.ActivityReplyDAO;
import com.activityreply.model.ActivityReplyDAO_interface;
import com.activityreport.model.ActivityReportDAO;
import com.activityreport.model.ActivityReportDAO_interface;
import com.activitysignup.model.ActivitySignupDAO;
import com.activitysignup.model.ActivitySignupDAO_interface;

public class ActivityService implements ActivityServiceCommon {

	private ActivityDAO_interface dao;
	private ActivityPhotoDAO_interface daoPhoto;
	private ActivitySignupDAO_interface daoSingup;
	private ActivityReplyDAO_interface daoReply;

	public ActivityService() {
		daoSingup = new ActivitySignupDAO();
		daoReply = new ActivityReplyDAO();
		daoPhoto = new ActivityPhotoDAO();
		dao = new ActivityDAO();
	}

	public void addAct(Integer mem, Integer actType, String name, String content, Integer max, Integer min, Date sgst,
			Date sget, Date actst, Date actet, String country, String location, Integer cost, List<byte[]> actPhoto) {

		ActivityVO activityVO = new ActivityVO();

		activityVO.setMemberId(mem);
		activityVO.setActType(actType);
		activityVO.setActName(name);
		activityVO.setActContent(content);
		activityVO.setActMaxCount(max);
		activityVO.setActMinCount(min);
		activityVO.setActStart(actst);
		activityVO.setActEnd(actet);
		activityVO.setSignStart(sgst);
		activityVO.setSignEnd(sget);
		activityVO.setActCountry(country);
		activityVO.setActLocation(location);
		activityVO.setActCost(cost);

		Integer actid = null;
		actid = dao.insert(activityVO);

		if (!(actPhoto.size()==0)) {
			for (byte[] photo : actPhoto) {
				ActivityPhotoVO vo = new ActivityPhotoVO();
				vo.setActId(actid);
				vo.setActPhoto(photo);
				daoPhoto.insert(vo);
			}
		}
	}

	// 有用
	public JSONArray search(String actCountry, Integer actType, String actName) {
		return dao.search(actCountry, actType, actName);
	}

	public List<Integer> getAll() {
		return dao.getAll();
	}

	public ActivityVO getOne(Integer actId) {
		beginTranscation();
		ActivityVO vo = dao.getOne(actId);
		commit();
		return vo;
	}

	public void update(Integer actType, String name, String content, Integer max, Integer min, Date sgst, Date sget,
			Date actst, Date actet, String country, String location, Integer cost, List<byte[]> actPhoto,
			Integer actid,Integer memid) {
		ActivityVO activityVO = new ActivityVO();
		
		activityVO.setActId(actid);
		activityVO.setActType(actType);
		activityVO.setActName(name);
		activityVO.setActContent(content);
		activityVO.setActMaxCount(max);
		activityVO.setActMinCount(min);
		activityVO.setActStart(actst);
		activityVO.setActEnd(actet);
		activityVO.setSignStart(sgst);
		activityVO.setSignEnd(sget);
		activityVO.setActCountry(country);
		activityVO.setActLocation(location);
		activityVO.setActCost(cost);
		activityVO.setMemberId(memid);
		dao.update(activityVO);
		
		if (!(actPhoto.size()==0)) {
			for (byte[] photo : actPhoto) {
				ActivityPhotoVO vo = new ActivityPhotoVO();
				vo.setActId(actid);
				vo.setActPhoto(photo);
				daoPhoto.insert(vo);
			}
		}

	}



	public void delete(Integer actId) {
		daoPhoto.deleteAct(actId);
		daoSingup.deleteAct(actId);
		daoReply.deleteAct(actId);
		dao.delete(actId);
	}

	// 有用
	public JSONArray findCountry() {
		return dao.findCountry();
	}

	public JSONObject getOneJS(Integer actId) {
		return dao.getOneJS(actId);
	}

	public JSONArray getById(Integer memId) {
		return dao.getById(memId);
	}

	// 有用
	public void updateNumber(Integer actId, Integer number) {
		dao.updateNumber(actId, number);
	}

	// 有用
	public JSONArray getPage(Integer number) {
		return dao.getPage(number);

	}

	// 有用

	public void reomveNumver(Integer currentNumber, Integer number, Integer actId) {
		dao.removeNumber(currentNumber, number, actId);
	}



	public void updateJS(ActivityVO activityVO, List<byte[]> actPhoto) {
		
		dao.update(activityVO);
		
		if (!(actPhoto.size()==0)) {
			for (byte[] photo : actPhoto) {
				ActivityPhotoVO vo = new ActivityPhotoVO();
				vo.setActId(activityVO.getActId());
				vo.setActPhoto(photo);
				daoPhoto.insert(vo);
			}
		}

	}

	public void updateStatus(Integer actId) {
		dao.updateStatus(actId);
	}	

	
	public JSONObject name(Integer memberId) {
		return  dao.name(memberId);
		
	}
	
	
	public List<ActivityVO> get() {
		return  dao.get();
		
	}
	
	
	public void expired(Integer actId) {
			dao.expired(actId);
	}
	
	
	
}
