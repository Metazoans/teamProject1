package com.yedam.service.item;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mapper.item.ItemMapper;
import com.yedam.vo.ItemVO;

public class ItemServiceImpl implements ItemService{

	SqlSession sqlSession = DataSource.getInstance().openSession();
	ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
	
	@Override
	public List<ItemVO> select() {
		return mapper.select();
	}
	
	@Override
	public boolean addItem(ItemVO item) {
		return mapper.insertItem(item) == 1;
	}
	
}
