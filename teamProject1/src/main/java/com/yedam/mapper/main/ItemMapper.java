package com.yedam.mapper.main;

import java.util.List;

import com.yedam.vo.RankVo;

public interface ItemMapper {
	List<RankVo> rankList(int page);
}
