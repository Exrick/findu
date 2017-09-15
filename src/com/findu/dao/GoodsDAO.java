package com.findu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.findu.entity.G;
import com.findu.entity.Good;
import com.findu.utils.C3P0Utils;
import com.findu.utils.GetTime;
import com.findu.utils.JDBCUtils;

public class GoodsDAO {
	
	/**
	 * 保存物品信息
	 * @param good
	 */
	public void save(Good good) {
		Connection conn = null;
		PreparedStatement stat = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "insert into good(goodname,goodsite,goodexplain,goodtype,fabuid,fabucontact,fabutime,goodtime,goodvalue,goodpicture)";
			sql = sql + "values(?,?,?,?,?,?,?,?,?,?)";
			stat = conn.prepareStatement(sql);
			stat.setString(1, good.getName());
			stat.setString(2, good.getSite());
			stat.setString(3, good.getExplain());
			stat.setInt(4, good.getType());
			stat.setInt(5, good.getFabuid());
			stat.setString(6, good.getFabucontact());

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date du = df.parse(GetTime.getTime());
			Timestamp st = new Timestamp(du.getTime());
			stat.setTimestamp(7, st);

			stat.setTimestamp(8, good.getGoodtime());
			stat.setInt(9, good.getValue());
			stat.setString(10, good.getPicture());

			stat.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, stat, conn);
		}
	}
	
	/**
	 * 更新物品信息
	 * @param good
	 */
	public void update(Good good) {
		Connection conn = null;
		PreparedStatement stat = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "UPDATE good SET goodname=?,goodsite=?,goodexplain=?,goodtype=?,"
					+ "fabucontact=?,goodtime=?,goodvalue=?,goodpicture=? WHERE goodid=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, good.getName());
			stat.setString(2, good.getSite());
			stat.setString(3, good.getExplain());
			stat.setInt(4, good.getType());
			stat.setString(5, good.getFabucontact());
			stat.setTimestamp(6, good.getGoodtime());
			stat.setInt(7, good.getValue());
			stat.setString(8, good.getPicture());
			stat.setInt(9, good.getId());

			stat.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, stat, conn);
		}
	}
	
	/**
	 * 获得所有物品
	 * @return
	 */
	public ArrayList<Good> getAllGoods() {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		ArrayList list = new ArrayList();
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from good order by fabutime desc";
			stat = conn.prepareStatement(sql);

			rs = stat.executeQuery();

			while (rs.next()) {
				Good g = new Good();
				g.setId(rs.getInt("goodid"));
				g.setName(rs.getString("goodname"));
				g.setSite(rs.getString("goodsite"));
				g.setExplain(rs.getString("goodexplain"));
				g.setType(rs.getInt("goodtype"));
				g.setState(rs.getString("goodstate"));
				g.setFabuid(rs.getInt("fabuid"));
				g.setFabutime(rs.getTimestamp("fabutime"));
				g.setGoodtime(rs.getTimestamp("goodtime"));
				g.setFabucontact(rs.getString("fabucontact"));
				g.setValue(rs.getInt("goodvalue"));
				g.setPicture(rs.getString("goodpicture"));

				list.add(g);
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
	 * 通过物品id获取
	 * @param id
	 * @return
	 */
	public Good getGoodById(int id) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from good where goodid=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id);

			rs = stat.executeQuery();

			if (rs.next()) {
				Good g = new Good();
				g.setId(rs.getInt("goodid"));
				g.setName(rs.getString("goodname"));
				g.setSite(rs.getString("goodsite"));
				g.setExplain(rs.getString("goodexplain"));
				g.setType(rs.getInt("goodtype"));
				g.setState(rs.getString("goodstate"));
				g.setFabuid(rs.getInt("fabuid"));
				g.setFabutime(rs.getTimestamp("fabutime"));
				g.setGoodtime(rs.getTimestamp("goodtime"));
				g.setFabucontact(rs.getString("fabucontact"));
				g.setValue(rs.getInt("goodvalue"));
				g.setPicture(rs.getString("goodpicture"));

				Good localGood1 = g;
				return localGood1;
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
	 * 多条件获得物品信息
	 * @param fabuid
	 * @param name
	 * @param site
	 * @return
	 */
	public Good getGoodByDetails(int fabuid, String name, String site) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from good where fabuid=? and goodname=? and goodsite=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, fabuid);
			stat.setString(2, name);
			stat.setString(3, site);

			rs = stat.executeQuery();

			if (rs.next()) {
				Good g = new Good();
				g.setId(rs.getInt("goodid"));
				g.setName(rs.getString("goodname"));
				g.setSite(rs.getString("goodsite"));
				g.setExplain(rs.getString("goodexplain"));
				g.setType(rs.getInt("goodtype"));
				g.setState(rs.getString("goodstate"));
				g.setFabuid(rs.getInt("fabuid"));
				g.setFabutime(rs.getTimestamp("fabutime"));
				g.setGoodtime(rs.getTimestamp("goodtime"));
				g.setFabucontact(rs.getString("fabucontact"));
				g.setValue(rs.getInt("goodvalue"));
				g.setPicture(rs.getString("goodpicture"));

				Good localGood1 = g;
				return localGood1;
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
	 * 通过类型获得物品信息
	 * @param typeid
	 * @return
	 */
	public ArrayList<Good> getGoodByType(int typeid) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		ArrayList list = new ArrayList();
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from good where goodtype=? order by fabutime desc";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, typeid);

			rs = stat.executeQuery();

			while (rs.next()) {
				Good g = new Good();
				g.setId(rs.getInt("goodid"));
				g.setName(rs.getString("goodname"));
				g.setSite(rs.getString("goodsite"));
				g.setExplain(rs.getString("goodexplain"));
				g.setType(rs.getInt("goodtype"));
				g.setState(rs.getString("goodstate"));
				g.setFabuid(rs.getInt("fabuid"));
				g.setFabutime(rs.getTimestamp("fabutime"));
				g.setGoodtime(rs.getTimestamp("goodtime"));
				g.setFabucontact(rs.getString("fabucontact"));
				g.setValue(rs.getInt("goodvalue"));
				g.setPicture(rs.getString("goodpicture"));

				list.add(g);
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
	 * 搜索
	 * @param search
	 * @return
	 */
	public ArrayList<Good> findGoodByName(String search) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		ArrayList list = new ArrayList();
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from good where goodname like '%" + search
					+ "%' or goodsite like '%" + search
					+ "%' or goodexplain like '%" + search + "%' "
					+ "order by fabutime desc";
			stat = conn.prepareStatement(sql);

			rs = stat.executeQuery();

			while (rs.next()) {
				Good g = new Good();
				g.setId(rs.getInt("goodid"));
				g.setName(rs.getString("goodname"));
				g.setSite(rs.getString("goodsite"));
				g.setExplain(rs.getString("goodexplain"));
				g.setType(rs.getInt("goodtype"));
				g.setState(rs.getString("goodstate"));
				g.setFabuid(rs.getInt("fabuid"));
				g.setFabutime(rs.getTimestamp("fabutime"));
				g.setGoodtime(rs.getTimestamp("goodtime"));
				g.setFabucontact(rs.getString("fabucontact"));
				g.setValue(rs.getInt("goodvalue"));
				g.setPicture(rs.getString("goodpicture"));

				list.add(g);
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
	 * 搜索计数
	 * @param search
	 * @return
	 */
	public String findGoodByNameAllCount(String search) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select COUNT(*) count from good where goodname like '%"
					+ search
					+ "%' or goodsite like '%"
					+ search
					+ "%' or goodexplain like '%" + search + "%'";
			stat = conn.prepareStatement(sql);

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
	 * 多条件查询
	 * @param search
	 * @param goodtype
	 * @return
	 */
	public ArrayList<Good> findGoodInType(String search, int goodtype) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		ArrayList list = new ArrayList();
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from good where (goodname like '%" + search
					+ "%' or goodsite like '%" + search
					+ "%' or goodexplain like '%" + search + "%') "
					+ "and goodtype=" + goodtype + " order by fabutime desc";
			stat = conn.prepareStatement(sql);

			rs = stat.executeQuery();

			while (rs.next()) {
				Good g = new Good();
				g.setId(rs.getInt("goodid"));
				g.setName(rs.getString("goodname"));
				g.setSite(rs.getString("goodsite"));
				g.setExplain(rs.getString("goodexplain"));
				g.setType(rs.getInt("goodtype"));
				g.setState(rs.getString("goodstate"));
				g.setFabuid(rs.getInt("fabuid"));
				g.setFabutime(rs.getTimestamp("fabutime"));
				g.setGoodtime(rs.getTimestamp("goodtime"));
				g.setFabucontact(rs.getString("fabucontact"));
				g.setValue(rs.getInt("goodvalue"));
				g.setPicture(rs.getString("goodpicture"));

				list.add(g);
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
	 * 多条件查询计数
	 * @param search
	 * @param goodtype
	 * @return
	 */
	public String findGoodInTypeCount(String search, int goodtype) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select COUNT(*) count from good where (goodname like '%"
					+ search
					+ "%' or goodsite like '%"
					+ search
					+ "%' or goodexplain like '%"
					+ search
					+ "%') "
					+ "and goodtype=" + goodtype;
			stat = conn.prepareStatement(sql);

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
	 * 物品类型计数
	 * @param typeid
	 * @return
	 */
	public String getGoodCountByType(int typeid) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select COUNT(*) count from good where goodtype=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, typeid);

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
	 * 统计发布者的发布
	 * @param fabuid
	 * @return
	 */
	public ArrayList<Good> getGoodByFabuId(int fabuid) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		ArrayList list = new ArrayList();
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from good where fabuid=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, fabuid);

			rs = stat.executeQuery();

			while (rs.next()) {
				Good g = new Good();
				g.setId(rs.getInt("goodid"));
				g.setName(rs.getString("goodname"));
				g.setSite(rs.getString("goodsite"));
				g.setExplain(rs.getString("goodexplain"));
				g.setType(rs.getInt("goodtype"));
				g.setState(rs.getString("goodstate"));
				g.setFabuid(rs.getInt("fabuid"));
				g.setFabutime(rs.getTimestamp("fabutime"));
				g.setGoodtime(rs.getTimestamp("goodtime"));
				g.setFabucontact(rs.getString("fabucontact"));
				g.setValue(rs.getInt("goodvalue"));
				g.setPicture(rs.getString("goodpicture"));

				list.add(g);
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
	 * 删除物品
	 * @param goodid
	 */
	public void deleteGood(int goodid) {
		Connection conn = null;
		PreparedStatement stat = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "DELETE FROM good WHERE goodid=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, goodid);

			stat.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, stat, conn);
		}
	}
	
	/**
	 * 通过物品名查找AJAX
	 * @param search
	 * @param goodtype
	 * @return
	 */
	public ArrayList<Good> findGoodByNameAJAX(String search) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		ArrayList list = new ArrayList();
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from good where goodname like '"+search+"%'";
			stat = conn.prepareStatement(sql);

			rs = stat.executeQuery();

			while (rs.next()) {
				Good g = new Good();
				g.setId(rs.getInt("goodid"));
				g.setName(rs.getString("goodname"));
				g.setSite(rs.getString("goodsite"));
				g.setExplain(rs.getString("goodexplain"));
				g.setType(rs.getInt("goodtype"));
				g.setState(rs.getString("goodstate"));
				g.setFabuid(rs.getInt("fabuid"));
				g.setFabutime(rs.getTimestamp("fabutime"));
				g.setGoodtime(rs.getTimestamp("goodtime"));
				g.setFabucontact(rs.getString("fabucontact"));
				g.setValue(rs.getInt("goodvalue"));
				g.setPicture(rs.getString("goodpicture"));

				list.add(g);
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
	 * 计算总物品数
	 * @return
	 * @throws SQLException
	 */
	public static int count() throws SQLException{
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		long l=(Long) qr.query("select count(*) from good", new ScalarHandler(1));
		return (int)l;
	}
	
	/**
	 * 全部物品分页实现
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws SQLException 
	 */
	public ArrayList<G> findGoodByPage(int currentPage, int pageSize) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		return (ArrayList<G>) qr.query("select * from good order by fabutime desc limit ?,?", new BeanListHandler<G>(G.class),(currentPage-1)*pageSize,pageSize);
	}
	
	/**
	 * 计算总物类别品数
	 * @return
	 * @throws SQLException
	 */
	public static int countType(int goodtype) throws SQLException{
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		long l=(Long) qr.query("select count(*) from good where goodtype=?", new ScalarHandler(1),goodtype);
		return (int)l;
	}
	
	/**
	 * 按类别物品分页实现
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws SQLException 
	 */
	public ArrayList<G> findGoodByPageType(int currentPage, int pageSize,int goodtype) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		return (ArrayList<G>) qr.query("select * from good where goodtype=? order by fabutime desc limit ?,? ", new BeanListHandler<G>(G.class),goodtype,(currentPage-1)*pageSize,pageSize);
	}
	
	/**
	 * 分页搜索
	 * @param search
	 * @return
	 * @throws SQLException 
	 */
	public ArrayList<G> searchGoodByName(int currentPage, int pageSize,String search) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from good where goodname like '%"
				+ search
				+ "%' or goodsite like '%"
				+ search
				+ "%' or goodexplain like '%" + search + "%' order by fabutime desc limit ?,?";
		return (ArrayList<G>) qr.query(sql, new BeanListHandler<G>(G.class),(currentPage-1)*pageSize,pageSize);
	}
	
	/**
	 * 搜索计数
	 * @param search
	 * @return
	 * @throws SQLException 
	 */
	public static int searchCount(String search) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select COUNT(*) from good where goodname like '%"
				+ search
				+ "%' or goodsite like '%"
				+ search
				+ "%' or goodexplain like '%" + search + "%'";
		long l=(Long) qr.query(sql, new ScalarHandler(1));
		return (int)l;
	}
	
	/**
	 * 分类分页搜索
	 * @param search
	 * @param goodtype
	 * @return
	 * @throws SQLException 
	 */
	public ArrayList<G> searchGoodInType(int currentPage, int pageSize,String search, int goodtype) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from good where (goodname like '%"
				+ search
				+ "%' or goodsite like '%"
				+ search
				+ "%' or goodexplain like '%" + search + "%') and goodtype=? order by fabutime desc limit ?,?";
		return (ArrayList<G>) qr.query(sql, new BeanListHandler<G>(G.class),goodtype,(currentPage-1)*pageSize,pageSize);
	}
	
	/**
	 * 分类搜索计数
	 * @param search
	 * @return
	 * @throws SQLException 
	 */
	public static int searchTypeCount(String search,int goodtype) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select COUNT(*) from good where (goodname like '%"
				+ search
				+ "%' or goodsite like '%"
				+ search
				+ "%' or goodexplain like '%" + search + "%') and goodtype=?";
		long l=(Long) qr.query(sql, new ScalarHandler(1),goodtype);
		return (int)l;
	}
}