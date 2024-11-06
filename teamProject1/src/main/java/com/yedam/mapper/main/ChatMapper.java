package com.yedam.mapper.main;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.vo.ChatVO;

public interface ChatMapper {
	List<ChatVO> select(@Param("fromId")String fromId, @Param("toId")String toId);
	int insert(ChatVO chat);
}
