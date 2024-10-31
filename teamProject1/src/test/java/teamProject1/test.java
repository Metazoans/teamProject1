package teamProject1;

import java.util.List;

import com.yedam.service.buyer.buyerService;
import com.yedam.service.buyer.buyerServiceImpl;
import com.yedam.vo.ItemVO;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		buyerService svc = new buyerServiceImpl();
		List<ItemVO> list = svc.getItemList();
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
			
		}
	}

}
