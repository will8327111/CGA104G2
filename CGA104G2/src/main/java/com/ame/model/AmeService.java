package com.ame.model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.ame_state.model.Ame_StateService;

public class AmeService {
	private AmeDAO_interface dao;
	Integer oneameid = null;
	
	public AmeService() {
		dao = new AmeDAO();
	}

	public AmeVO addAme(String amename, String ameintroduce, Integer amepoint, Integer amemax,
			String ameopening, byte[] ameimg) {  
		AmeVO ameVO = new AmeVO();
		
		ameVO.setAmeName(amename);
		ameVO.setAmeIntroduce(ameintroduce);
		ameVO.setAmePoint(amepoint);
		ameVO.setAmeMax(amemax);
		ameVO.setAmeOpening(ameopening);
		ameVO.setAmeImg(ameimg);
		
		
		oneameid = dao.insert(ameVO);
		if(oneameid != null) {
			for(int i = 0; i < 30; i ++) {
				Ame_StateService ame_StateSvc = new Ame_StateService();
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DAY_OF_MONTH, +i);
				Date recordDate = new Date(cal.getTimeInMillis());
				ame_StateSvc.addAme_State(oneameid, recordDate, ameopening);
			}
		}
		return ameVO;
	}
	
	public AmeVO updateAme(Integer ameid, String amename, String ameintroduce, Integer amepoint, Integer amemax,
			String ameopening, byte[] ameimg) { 
		
		AmeVO ameVO = new AmeVO();
		ameVO.setAmeId(ameid);
		ameVO.setAmeName(amename);
		ameVO.setAmeIntroduce(ameintroduce);
		ameVO.setAmePoint(amepoint);
		ameVO.setAmeMax(amemax);
		ameVO.setAmeOpening(ameopening);
		ameVO.setAmeImg(ameimg);
		dao.update(ameVO);
		
		return ameVO;
	}

	public List<AmeVO> getAll() {
		return dao.getAll();
	}
	
	public void deleteAme(Integer ameid) {
		dao.delete(ameid);
	}
	
	public AmeVO getOneAme(Integer ameid) {
		return dao.findByPrimaryKey(ameid);
	}
}
