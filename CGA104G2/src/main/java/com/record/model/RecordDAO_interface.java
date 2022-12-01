package com.record.model;

import java.sql.Date;
import java.util.List;

public interface RecordDAO_interface {
	public void insert(RecordVO recordVO);
	public void update(RecordVO recordVO);
	public List<RecordVO> findByPrimaryKey(Integer member_Id);
	public List<RecordVO> getAll();
	boolean dorecordsta(Integer ameId, Date recordDate, String recordStatime);
}
