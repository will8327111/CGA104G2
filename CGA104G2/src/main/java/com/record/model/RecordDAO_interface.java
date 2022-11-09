package com.record.model;

import java.util.List;

public interface RecordDAO_interface {
	public void insert(RecordVO recordVO);
	public void update(RecordVO recordVO);
	public RecordVO findByPrimaryKey(Integer MEMBER_ID);
	public List<RecordVO> getAll();
}
