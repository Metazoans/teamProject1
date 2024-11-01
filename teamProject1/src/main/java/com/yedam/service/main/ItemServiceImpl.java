package com.yedam.service.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mapper.main.ItemMapper;
import com.yedam.vo.RankVo;

public class ItemServiceImpl implements ItemService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
	
@Override
public List<RankVo> ranking(int page) {
	// TODO Auto-generated method stub
	return mapper.rankList(page);
}

}
