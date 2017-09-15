package com.findu.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.findu.dao.ApplyDAO;
import com.findu.entity.Apply;
import com.findu.entity.Good;
import com.findu.exception.ApplyException;
import com.findu.exception.ChangeUserException;

public class ApplyService {
	
	private ApplyDAO dao = new ApplyDAO();

	public void applyGood(Apply apply) throws Exception {
		Apply applyOld = dao.getApplyByDetails(apply.getUserid(),
				apply.getGoodid());
		if (applyOld != null) {
			throw new Exception();
		}
		dao.save(apply);
	}

	public String applyCount(Good good) throws Exception {
		return this.dao.applyCount(good.getId());
	}

	public ArrayList<Apply> getHotApply() throws Exception {
		return this.dao.getHotApply();
	}

	public ArrayList<Apply> getApplyByApplyId(int applyuserid) throws Exception {
		return this.dao.getApplyByApplyId(applyuserid);
	}

	public ArrayList<Apply> getApplyByGoodId(int applygoodid) throws Exception {
		return this.dao.getApplyByGoodId(applygoodid);
	}

	// 获得申请物品成功的用户
	public Apply getApplySuccess(int applygoodid) throws Exception {
		return dao.getApplySuccess(applygoodid);
	}

	/**
	 * 删除申请
	 * @param applyid
	 * @throws Exception
	 */
	public void delApply(int applyid) throws ApplyException {
		try {	
			dao.delApply(applyid);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ApplyException("删除失败");
		}	
	}

	// 通过applyid获得申请
	public Apply getApplyById(int applyid) throws Exception {
		return dao.getApplyById(applyid);
	}

	// 更新申请信息
	public void updateApply(Apply apply) throws Exception {
		dao.updateApply(apply);
	}

	/**
	 * 处理申请
	 * @param state
	 * @param applyid
	 * @throws Exception
	 */
	public void dealApply(String state, int applyid) throws ApplyException {
		
		try {	
			dao.dealApply(state, applyid);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ApplyException("处理失败");
		}		
	}
}