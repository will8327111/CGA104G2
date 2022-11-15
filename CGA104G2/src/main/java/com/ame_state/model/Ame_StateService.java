package com.ame_state.model;

import java.sql.Date;
import java.util.Map;

public class Ame_StateService {
	private Ame_StateDAO_interface dao;
	
	public Ame_StateService() {
		dao = new Ame_StateDAO();
	}
	
	public Ame_StateVO addAme_State(Integer ameId,Date recordDate,String recordStatime) {
		Ame_StateVO ame_StateVO = new Ame_StateVO();
		
		ame_StateVO.setAmeId(ameId);
		ame_StateVO.setRecordDate(recordDate);
		ame_StateVO.setRecordStatime(recordStatime);
		
		dao.insert(ame_StateVO);
		
		return ame_StateVO;
		
	}
	

	public Map<String, String> showAme_Statime(Integer AME_ID){
		return dao.showAme_Statime(AME_ID);
	};
	
	public boolean update(String recordStatime, Integer ameStateId) {
		
		Ame_StateVO ame_StateVO = new Ame_StateVO();
		
		ame_StateVO.setRecordStatime(recordStatime);
		ame_StateVO.setAmeStateId(ameStateId);
		
		dao.update(ame_StateVO);
		
		return true;
		
	}
	
	public Ame_StateVO selectByIdDate(Integer ameId,Date recordDate) {
		
		Ame_StateVO ame_StateVO = new Ame_StateVO();
		ame_StateVO.setAmeId(ameId);
		ame_StateVO.setRecordDate(recordDate);
		
		Ame_StateVO ame_StateVO2 = dao.selectByIdDate(ame_StateVO);
		
		return ame_StateVO2;
	}
	
	
}
