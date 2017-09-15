package com.findu.dao;

import com.findu.entity.User;
import com.findu.utils.JDBCUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
	
	/**
	 * 通过用户名查找用户
	 * @param name
	 * @return
	 */
	public static User findUserByName(String name) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		
		try {
			//3.获取连接后发送sql语句访问数据库
			conn = JDBCUtils.getConnection();
			if(conn!=null){
				conn.setAutoCommit(false);//关闭自动提交，即开启手动事务
			}

			String sql = "select * from user where username=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, name);

			rs = stat.executeQuery();
			
			conn.commit();//提交事务

			if (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("userid"));
				u.setName(rs.getString("username"));
				u.setPassword(rs.getString("userpassword"));
				u.setEmail(rs.getString("useremail"));
				u.setPhone(rs.getString("userphone"));
				u.setBirthday(rs.getDate("userbirthday"));
				u.setAddress(rs.getString("useraddress"));
				u.setHead(rs.getString("userhead"));
				u.setExplain(rs.getString("userexplain"));
				u.setQq(rs.getString("userqq"));
				u.setGender(rs.getString("usergender"));
				User localUser1 = u;
				return localUser1;
			}
		} catch (Exception e) {
			if(conn!=null){
				try{
					conn.rollback();//发生异常回滚事务
				}catch(Exception e1){
					e1.printStackTrace();
					System.out.println("回滚出错");
				}	
			}
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return null;
	}
	
	/**
	 * 通过手机号查找用户
	 * @param phone
	 * @return
	 */
	public static User findUserByPhone(String phone) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from user where userphone=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, phone);

			rs = stat.executeQuery();

			if (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("userid"));
				u.setName(rs.getString("username"));
				u.setPassword(rs.getString("userpassword"));
				u.setEmail(rs.getString("useremail"));
				u.setPhone(rs.getString("userphone"));
				u.setBirthday(rs.getDate("userbirthday"));
				u.setAddress(rs.getString("useraddress"));
				u.setHead(rs.getString("userhead"));
				u.setExplain(rs.getString("userexplain"));
				u.setQq(rs.getString("userqq"));
				u.setGender(rs.getString("usergender"));
				return u;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return null;
	}
	
	/**
	 * 通过邮箱查找用户
	 * @param email
	 * @return
	 */
	public static User findUserByEmail(String email) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from user where useremail=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, email);

			rs = stat.executeQuery();

			if (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("userid"));
				u.setName(rs.getString("username"));
				u.setPassword(rs.getString("userpassword"));
				u.setEmail(rs.getString("useremail"));
				u.setPhone(rs.getString("userphone"));
				u.setBirthday(rs.getDate("userbirthday"));
				u.setAddress(rs.getString("useraddress"));
				u.setHead(rs.getString("userhead"));
				u.setExplain(rs.getString("userexplain"));
				u.setQq(rs.getString("userqq"));
				u.setGender(rs.getString("usergender"));
				return u;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return null;
	}
	
	/**
	 * 通过用户id查找用户
	 * @param id
	 * @return
	 */
	public static User findUserById(int id) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from user where userid=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id);

			rs = stat.executeQuery();

			if (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("userid"));
				u.setName(rs.getString("username"));
				u.setPassword(rs.getString("userpassword"));
				u.setEmail(rs.getString("useremail"));
				u.setPhone(rs.getString("userphone"));
				u.setBirthday(rs.getDate("userbirthday"));
				u.setAddress(rs.getString("useraddress"));
				u.setHead(rs.getString("userhead"));
				u.setExplain(rs.getString("userexplain"));
				u.setQq(rs.getString("userqq"));
				u.setGender(rs.getString("usergender"));
				return u;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return null;
	}
	
	/**
	 * 保存用户信息，注册
	 * @param user
	 */
	public void save(User user) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "insert into user(username,userpassword,useremail,userphone)";
			sql = sql + "values(?,?,?,?)";
			stat = conn.prepareStatement(sql);

			stat.setString(1, user.getName());
			stat.setString(2, user.getPassword());
			stat.setString(3, user.getEmail());
			stat.setString(4, user.getPhone());

			stat.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, stat, conn);
		}
	}

	/**
	 * 修改数据
	 * @param user
	 */
	public void changeUserData(User user) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "UPDATE USER SET usergender=?,userbirthday=?,userqq=?,useraddress=?,userexplain=? WHERE userid=?";
			stat = conn.prepareStatement(sql);

			stat.setString(1, user.getGender());
			java.sql.Date date = null;
			if (user.getBirthday() != null) {
				date = new java.sql.Date(user.getBirthday().getTime());
			}
			stat.setDate(2, date);
			stat.setString(3, user.getQq());
			stat.setString(4, user.getAddress());
			stat.setString(5, user.getExplain());
			stat.setInt(6, user.getId());

			stat.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, stat, conn);
		}
	}

	/**
	 * 修改密码
	 * @param newpass
	 * @param userid
	 */
	public void changePass(String newpass, int userid) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "UPDATE USER SET userpassword=? where userid=?";
			stat = conn.prepareStatement(sql);

			stat.setString(1, newpass);
			stat.setInt(2, userid);

			stat.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, stat, conn);
		}
	}
}