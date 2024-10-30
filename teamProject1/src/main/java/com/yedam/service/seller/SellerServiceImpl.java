package com.yedam.service.seller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mapper.seller.SellerMapper;
import com.yedam.vo.ItemVO;

public class SellerServiceImpl implements SellerService{

	SqlSession sqlSession = DataSource.getInstance().openSession();
	SellerMapper mapper = sqlSession.getMapper(SellerMapper.class);
	
	@Override
	public List<ItemVO> select() {
		return mapper.select();
	}
	
}
