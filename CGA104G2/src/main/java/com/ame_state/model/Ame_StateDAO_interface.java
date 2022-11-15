package com.ame_state.model;

import java.util.List;

public interface Ame_StateDAO_interface {
	public void insert(Ame_StateVO ame_StateVO);
	public void update(Ame_StateVO ame_StateVO);
	public List<Ame_StateVO> showAme_Statime(Integer AME_ID);
//	public List<Ame_StateVO> getAll();
}
