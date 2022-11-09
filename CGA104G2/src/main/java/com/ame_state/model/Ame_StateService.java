package com.ame_state.model;

import java.sql.Date;
import java.util.List;

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
	
	public Ame_StateVO recordAme_State() {
		Ame_StateVO ame_StateVO = new Ame_StateVO();
		
		return ame_StateVO;
	}

	public List<Ame_StateVO> showAme_Statime(Integer AME_ID){
		return dao.showAme_Statime(AME_ID);
	};
}
