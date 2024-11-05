package com.yedam.mapper.main;

import java.util.List;

import com.yedam.vo.ChatVO;

public interface ChatMapper {
	List<ChatVO> select(String seller, String buyer);
	int insert(ChatVO chat);
}
