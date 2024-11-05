package com.yedam.service.main;

import java.util.List;

import com.yedam.vo.ChatVO;

public interface ChatService {
	List<ChatVO> chatList(String seller, String buyer);
	boolean chatUpdate(ChatVO chat);
}
