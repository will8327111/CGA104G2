package com.record.model;

import java.util.List;

public interface RecordDAO_interface {
	public void insert(RecordVO recordVO);
	public void updaterecordsta(RecordVO recordVO);
	public List<RecordVO> findByPrimaryKey(Integer member_Id);
	public List<RecordVO> getAll();
	boolean dorecordsta(Integer ameId, String recordStatime);
}
