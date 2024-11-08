package com.yedam.test;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.SearchDTO;
import com.yedam.service.item.ItemService;
import com.yedam.service.item.ItemServiceImpl;

public class AppTest {

	public static void main(String[] args) {

		SearchDTO search = new SearchDTO();
		search.setPage(1);
		search.setKeyword("test5");

		ItemService svc = new ItemServiceImpl();
		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		System.out.println(gson.toJson(svc.sellListPage(search)));

	}

}
