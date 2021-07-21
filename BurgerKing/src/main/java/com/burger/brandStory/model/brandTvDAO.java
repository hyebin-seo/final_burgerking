package com.burger.brandStory.model;

import java.util.List;

public interface brandTvDAO {
	
	public List<brandTvDTO> getTvList();
	public brandTvDTO video(int tv_no);
	
}
