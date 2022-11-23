package com.record.model;

import java.util.List;

public interface RecordDAO_interface {
	public void insert(RecordVO recordVO);
	public void update(RecordVO recordVO);
	public List<RecordVO> findByPrimaryKey(Integer member_Id);
	public List<RecordVO> getAll();
}
