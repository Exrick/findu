package com.findu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.findu.entity.Apply;
import com.findu.entity.Good;
import com.findu.service.ApplyService;
import com.findu.service.GoodService;
import com.findu.utils.GetTime;
import com.findu.utils.JDBCUtils;

public class ApplyDAO {
	
	/**
	 * 保存申请信息
	 * @param apply
	 */
	public void save(Apply apply) {
		Connection conn = null;
		PreparedStatement stat = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "insert into apply(applytime,applyexplain,applygoodid,applyuserid,applycontact,applypicture)";
			sql = sql + "values(?,?,?,?,?,?)";
			stat = conn.prepareStatement(sql);

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date du = df.parse(GetTime.getTime());
			Timestamp st = new Timestamp(du.getTime());
			stat.setTimestamp(1, st);
			stat.setString(2, apply.getExplain());
			stat.setInt(3, apply.getGoodid());
			stat.setInt(4, apply.getUserid());
			stat.setString(5, apply.getContact());
			stat.setString(6, apply.getPicture());

			stat.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, stat, conn);
		}
	}
	
	/**
	 * 获得申请信息，判断是否重复申请
	 * @param applyuserid
	 * @param applygoodid
	 * @return
	 */
	public Apply getApplyByDetails(int applyuserid, int applygoodid) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from apply where applyuserid=? and applygoodid=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, applyuserid);
			stat.setInt(2, applygoodid);

			rs = stat.executeQuery();

			if (rs.next()) {
				Apply a = new Apply();
				a.setId(rs.getInt("applyid"));
				a.setExplain(rs.getString("applyexplain"));
				a.setGoodid(rs.getInt("applygoodid"));
				a.setState(rs.getString("applystate"));
				a.setUserid(rs.getInt("applyuserid"));
				a.setContact(rs.getString("applycontact"));
				a.setApplyTime(rs.getTimestamp("applytime"));
				a.setPicture(rs.getString("applypicture"));

				Apply localApply1 = a;
				return localApply1;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return null;
	}
	
	/**
	 * 通过申请ID获得申请信息
	 * @param applyid
	 */
	public Apply getApplyById(int applyid) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from apply where applyid=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, applyid);

			rs = stat.executeQuery();

			if (rs.next()) {
				Apply a = new Apply();
				a.setId(rs.getInt("applyid"));
				a.setExplain(rs.getString("applyexplain"));
				a.setGoodid(rs.getInt("applygoodid"));
				a.setState(rs.getString("applystate"));
				a.setUserid(rs.getInt("applyuserid"));
				a.setContact(rs.getString("applycontact"));
				a.setApplyTime(rs.getTimestamp("applytime"));
				a.setPicture(rs.getString("applypicture"));

				return a;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return null;
	}
	
	/**
	 * 申请物品计数
	 * @param goodid
	 * @return
	 */
	public String applyCount(int goodid) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select COUNT(*) count from apply where applygoodid=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, goodid);

			rs = stat.executeQuery();

			if (rs.next()) {
				String result = rs.getString("count");
				String str1 = result;
				return str1;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return null;
	}
	
	/**
	 * 获取热门申请物品
	 */
	public ArrayList<Apply> getHotApply() {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		ArrayList list = new ArrayList();
		try {
			conn = JDBCUtils.getConnection();

			String sql = "SELECT applygoodid,count(*) count from apply GROUP BY applygoodid ORDER BY count desc";
			stat = conn.prepareStatement(sql);

			rs = stat.executeQuery();

			while (rs.next()) {
				Apply a = new Apply();
				a.setGoodid(rs.getInt("applygoodid"));

				list.add(a);
			}
			ArrayList localArrayList1 = list;
			return localArrayList1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return null;
	}
	
	/**
	 * 统计申请人申请的物品
	 * @param applyuserid
	 * @return
	 */
	public ArrayList<Apply> getApplyByApplyId(int applyuserid) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		ArrayList list = new ArrayList();
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from apply where applyuserid=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, applyuserid);

			rs = stat.executeQuery();

			while (rs.next()) {
				Apply a = new Apply();
				a.setId(rs.getInt("applyid"));
				a.setExplain(rs.getString("applyexplain"));
				a.setGoodid(rs.getInt("applygoodid"));
				a.setState(rs.getString("applystate"));
				a.setUserid(rs.getInt("applyuserid"));
				a.setContact(rs.getString("applycontact"));
				a.setApplyTime(rs.getTimestamp("applytime"));
				a.setPicture(rs.getString("applypicture"));

				list.add(a);
			}
			ArrayList localArrayList1 = list;
			return localArrayList1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return null;
	}
	
	/**
	 * 通过物品ID获得申请的记录
	 * @param applygoodid
	 * @return
	 */
	public ArrayList<Apply> getApplyByGoodId(int applygoodid) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		ArrayList list = new ArrayList();
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from apply where applygoodid=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, applygoodid);

			rs = stat.executeQuery();

			while (rs.next()) {
				Apply a = new Apply();
				a.setId(rs.getInt("applyid"));
				a.setExplain(rs.getString("applyexplain"));
				a.setGoodid(rs.getInt("applygoodid"));
				a.setState(rs.getString("applystate"));
				a.setUserid(rs.getInt("applyuserid"));
				a.setContact(rs.getString("applycontact"));
				a.setApplyTime(rs.getTimestamp("applytime"));
				a.setPicture(rs.getString("applypicture"));

				list.add(a);
			}
			ArrayList localArrayList1 = list;
			return localArrayList1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return null;
	}

	/**
	 * 获得申请物品成功的用户 
	 * @param applygoodid
	 * @return
	 */
	public Apply getApplySuccess(int applygoodid) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from apply where applygoodid=? and applystate='1'";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, applygoodid);

			rs = stat.executeQuery();

			if (rs.next()) {
				Apply a = new Apply();
				a.setId(rs.getInt("applyid"));
				a.setExplain(rs.getString("applyexplain"));
				a.setGoodid(rs.getInt("applygoodid"));
				a.setState(rs.getString("applystate"));
				a.setUserid(rs.getInt("applyuserid"));
				a.setContact(rs.getString("applycontact"));
				a.setApplyTime(rs.getTimestamp("applytime"));
				a.setPicture(rs.getString("applypicture"));

				return a;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return null;
	}

	/**
	 * 更新申请物品结果 
	 * @param apply
	 */
	public void updateState(Apply apply) {
		Connection conn = null;
		PreparedStatement stat = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "insert into apply(applytime,applyexplain,applygoodid,applyuserid,applycontact,applypicture)";
			stat = conn.prepareStatement(sql);

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date du = df.parse(GetTime.getTime());
			Timestamp st = new Timestamp(du.getTime());
			stat.setTimestamp(1, st);
			stat.setString(2, apply.getExplain());
			stat.setInt(3, apply.getGoodid());
			stat.setInt(4, apply.getUserid());
			stat.setString(5, apply.getContact());
			stat.setString(6, apply.getPicture());

			stat.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, stat, conn);
		}
	}

	/**
	 * 删除申请
	 * @param applyid
	 */
	public void delApply(int applyid) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "DELETE FROM apply WHERE applyid=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, applyid);

			stat.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, stat, conn);
		}
	}

	/**
	 * 修改申请 
	 * @param apply
	 */
	public void updateApply(Apply apply) {
		Connection conn = null;
		PreparedStatement stat = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "UPDATE apply SET applyexplain=?,applycontact=?,applypicture=? WHERE applyid=?";
			stat = conn.prepareStatement(sql);

			stat.setString(1, apply.getExplain());
			stat.setString(2, apply.getContact());
			stat.setString(3, apply.getPicture());
			stat.setInt(4, apply.getId());

			stat.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, stat, conn);
		}
	}

	/**
	 * 处理申请 
	 * @param state
	 * @param applyid
	 */
	public void dealApply(String state, int applyid) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		PreparedStatement stat2 = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "UPDATE apply SET applystate=? WHERE applyid=?";
			stat = conn.prepareStatement(sql);

			stat.setString(1, state);
			stat.setInt(2, applyid);

			if ("1".equals(state)) {
				ApplyService aservice = new ApplyService();
				GoodService gservice = new GoodService();
				Apply a = aservice.getApplyById(applyid);
				Good g = gservice.getGoodById(a.getGoodid());

				String sql2 = "UPDATE good SET goodstate=? WHERE goodid=?";
				stat2 = conn.prepareStatement(sql2);

				stat2.setString(1, "1");
				stat2.setInt(2, g.getId());

				stat2.execute();
			}

			stat.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, stat, conn);
		}
	}
}