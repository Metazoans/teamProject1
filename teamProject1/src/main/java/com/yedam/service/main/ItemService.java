package com.yedam.service.main;

import java.util.List;

import com.yedam.vo.RankVo;

public interface ItemService {
	List<RankVo> ranking(int page);
	List<String> gameList();
	List<String> serverList(String game);
}
