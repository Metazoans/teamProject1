package com.yedam.mapper.main;

import java.util.List;

import com.yedam.vo.ItemVO;
import com.yedam.vo.RankVo;

public interface ItemMapper {
	List<RankVo> rankList(int page);
	List<String> gameList();
	List<String> serverList(String game);
	List<ItemVO> randomList();
}
