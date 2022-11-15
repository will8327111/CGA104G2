package com.record.model;

import java.sql.Date;
import java.sql.Time;

public class RecordService {
	private RecordDAO_interface dao ;
	
	public RecordService() {
		dao = new RecordDAO();
	}
	
	public RecordVO addRecord(Integer memberId, Integer ameId, Date recordDate, Time recordStatime, Integer recordCount) {
		
		RecordVO recordVO = new RecordVO();
		recordVO.setMemberId(memberId);
		recordVO.setAmeId(ameId);
		recordVO.setRecordDate(recordDate);
		recordVO.setRecordStatime(recordStatime);
		recordVO.setRecordCount(recordCount);
		
		dao.insert(recordVO);
		
		return recordVO;
	}
	
}
