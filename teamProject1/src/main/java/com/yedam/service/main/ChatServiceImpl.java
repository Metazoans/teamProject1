package com.yedam.service.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mapper.main.ChatMapper;
import com.yedam.vo.ChatVO;

public class ChatServiceImpl implements ChatService{
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ChatMapper mapper = sqlSession.getMapper(ChatMapper.class);
	
	@Override
	public List<ChatVO> chatList(String seller, String buyer) {
		return mapper.select(seller, buyer);
	}
	@Override
	public boolean chatUpdate(ChatVO chat) {
		return mapper.insert(chat) == 1;
	}

}
