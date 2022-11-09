package com.ame.model;

import java.util.List;

public interface AmeDAO_interface {
	public Integer insert(AmeVO ameVO);
	public Integer delete(Integer ameid);
	public void update(AmeVO ameVO);
	public AmeVO findByPrimaryKey(Integer ameid);
	public List<AmeVO> getAll();
}
