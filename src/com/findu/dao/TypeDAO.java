package com.findu.dao;

import com.findu.entity.Type;
import com.findu.utils.JDBCUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TypeDAO {
	
	/**
	 * 通过id获得相应分类对象
	 * @param id
	 * @return
	 */
	public static Type findTypeById(int id) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from type where typeid=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id);

			rs = stat.executeQuery();

			if (rs.next()) {
				Type t = new Type();
				t.setTypeid(rs.getInt("typeid"));
				t.setTypename(rs.getString("typename"));
				Type localType1 = t;
				return localType1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		JDBCUtils.release(rs, stat, conn);

		return null;
	}
	
	/**
	 * 通过分类名称获得相应分类对象
	 * @param name
	 * @return
	 */
	public static Type findTypeByName(String name) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from type where typename=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, name);

			rs = stat.executeQuery();

			if (rs.next()) {
				Type t = new Type();
				t.setTypeid(rs.getInt("typeid"));
				t.setTypename(rs.getString("typename"));
				Type localType1 = t;
				return localType1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		JDBCUtils.release(rs, stat, conn);

		return null;
	}
	
	/**
	 * 通过分类名查找分类id
	 * @param name
	 * @return
	 */
	public int findTypeIdByName(String name) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select typeid from type where typename=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, name);

			rs = stat.executeQuery();

			if (rs.next()) {
				int i = rs.getInt("typeid");
				return i;
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return -1;
	}
	
	/**
	 * 通过分类id找分类名
	 * @param typeid
	 * @return
	 */
	public String findTypeNameById(int typeid) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select typename from type where typeid=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, typeid);

			rs = stat.executeQuery();

			if (rs.next()) {
				String str1 = rs.getString("typename");
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
	 * 获得所有分类
	 * @return
	 */
	public ArrayList<Type> getAllTypes() {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		ArrayList list = new ArrayList();
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from type";
			stat = conn.prepareStatement(sql);

			rs = stat.executeQuery();

			while (rs.next()) {
				Type t = new Type();
				t.setTypeid(rs.getInt("typeid"));
				t.setTypename(rs.getString("typename"));

				list.add(t);
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
}