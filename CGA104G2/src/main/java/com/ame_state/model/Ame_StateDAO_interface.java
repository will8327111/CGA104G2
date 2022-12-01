package com.ame_state.model;

import java.util.Map;

public interface Ame_StateDAO_interface {
	public void insert(Ame_StateVO ame_StateVO);
	public void update(Ame_StateVO ame_StateVO);
	public Map<String, String> showAme_Statime(Integer AME_ID);
	public Ame_StateVO selectByIdDate(Ame_StateVO ame_StateVO);
//	public List<Ame_StateVO> getAll();
	public void updateOne(Ame_StateVO ame_StateVO);
}
