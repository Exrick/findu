package com.findu.service;

import java.sql.SQLException;

import com.findu.dao.UserDao;
import com.findu.entity.User;
import com.findu.exception.ChangeUserException;
import com.findu.exception.RegisterException;
import com.findu.exception.UserExistsException;
import com.findu.utils.Judge;

public class UserService {
	
	private UserDao dao = new UserDao();
	
	/**
	 * 登录操作
	 * @param name
	 * @param password
	 * @return
	 * @throws UserExistsException
	 */
	public User login(String name,String password) throws UserExistsException{
		User user=null;
		try {
			
			//判断邮箱或手机登录
			if (Judge.isEmail(name))
				user = UserDao.findUserByEmail(name);
			else if (Judge.isPhone(name)) {
				user = UserDao.findUserByPhone(name);
			}

			if (user != null) {
				// 密码正确
				if (user.getPassword().equals(password)) {
					return user;
				}
				throw new UserExistsException("密码不正确，请重新输入！");		
			}
			throw new UserExistsException("手机号或邮箱不存在，请重新输入！");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserExistsException("登录失败");
		}
	}
	
	/**
	 * 注册
	 * @param user
	 * @throws UserExistsException
	 */
	public void register(User user,String checkbox,String password) throws RegisterException {
		try {
			//判断是否被注册
			User newUser = dao.findUserByPhone(user.getPhone());
			User newUser2 = dao.findUserByPhone(user.getEmail());
			User newUser3 = dao.findUserByName(user.getName());
			
			if ((newUser != null) || (newUser2 != null)) {
				throw new RegisterException("手机号或邮箱已被注册!");
			}else if((checkbox == null) || ("".equals(checkbox))){
				throw new RegisterException("您未同意勾选本网站使用协议!");
			}else if(Judge.isName(user.getName())){
				throw new RegisterException("用户名不得含特殊字符!");
			}else if(!Judge.isPhone(user.getPhone())){
				throw new RegisterException("请输入正确的手机号!");
			}else if(!user.getPassword().equals(password)){
				throw new RegisterException("两次输入的密码不一致!");
			}else if((user.getPassword().length() < 6) || (user.getPassword().length() > 16)){
				throw new RegisterException("密码长度为6-16位!");
			}else if(newUser3 != null){
				throw new RegisterException("用户名存在!");
			}else{
				dao.save(user);
			}		
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RegisterException("注册失败");
		}
		
	}

	public User findUserById(int userid) throws UserExistsException, SQLException {
		return dao.findUserById(userid);
	}

	public User findUserByName(String username) throws UserExistsException, SQLException {
		return dao.findUserByName(username);
	}
	
	/**
	 * 修改用户资料
	 * @param user
	 * @throws Exception
	 */
	public void changeUserData(User user) throws ChangeUserException {
		
		try {	
			dao.changeUserData(user);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ChangeUserException("修改失败");
		}	
	}
	
	/**
	 * 修改密码
	 * @param newpass
	 * @param userid
	 * @throws Exception
	 */
	public void changePass(User user,String oldpass,String newpass,String renewpass) throws ChangeUserException {
		
		try {	
			if(user.getPassword().equals(oldpass)){
		    	if(newpass.length()<6){
		    		throw new ChangeUserException("您输入的新密码长度不得小于6位!");
		    	}else{
			    	if(newpass.equals(renewpass)){
			    		dao.changePass(newpass, user.getId());
			    	}else{
			    		throw new ChangeUserException("您两次输入的新密码不一致!");
			    	}
		    	}
		    }else{
		    	throw new ChangeUserException("您输入的旧密码不正确!");
		    }
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ChangeUserException("修改失败");
		}	
	}
}