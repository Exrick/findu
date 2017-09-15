package com.findu.service;

import com.findu.dao.GoodsDAO;
import com.findu.entity.Good;

import java.util.ArrayList;

public class GoodService {
	
	private GoodsDAO dao = new GoodsDAO();

	public void postGood(Good good) throws Exception {
		this.dao.save(good);
	}

	public ArrayList<Good> getAllGoods() throws Exception {
		return this.dao.getAllGoods();
	}

	public Good findGoodById(int goodid) throws Exception {
		return this.dao.getGoodById(goodid);
	}

	public ArrayList<Good> getGoodsByTypeId(int typeid) throws Exception {
		return this.dao.getGoodByType(typeid);
	}

	public ArrayList<Good> searchGoodInAll(String search) throws Exception {
		return this.dao.findGoodByName(search);
	}

	public String getSearchInAllCount(String search) throws Exception {
		return this.dao.findGoodByNameAllCount(search);
	}

	public ArrayList<Good> searchGoodInType(String search, int typeid)
			throws Exception {
		return this.dao.findGoodInType(search, typeid);
	}

	public String getSearchInTypeCount(String search, int goodtype)
			throws Exception {
		return this.dao.findGoodInTypeCount(search, goodtype);
	}

	public String getGoodCountByType(int typeid) throws Exception {
		return this.dao.getGoodCountByType(typeid);
	}

	public ArrayList<Good> getGoodByFabuId(int fabuid) throws Exception {
		return this.dao.getGoodByFabuId(fabuid);
	}

	// 删除物品
	public void deleteGood(int goodid) throws Exception {
		dao.deleteGood(goodid);
	}

	// 修改物品信息
	public void updateGood(Good good) throws Exception {
		dao.update(good);
	}

	// 通过物品id获得物品信息
	public Good getGoodById(int goodid) throws Exception {
		return dao.getGoodById(goodid);
	}
}