package com.findu.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Judge {
	
	public static Boolean hasPic(String str) {
		if(str==null||"".equals(str)){
			return false;
		}
		
		StringBuffer stb = new StringBuffer();
		for (int i = str.length() - 1; (str.charAt(i) != '.') && (i > 0); i--) {
			stb.append(str.charAt(i));
		}
		StringBuffer stb2 = new StringBuffer();
		for (int i = stb.length() - 1; i >= 0; i--) {
			stb2.append(stb.charAt(i));
		}
		if ((stb2.toString() == null) || ("".equals(stb2.toString()))) {
			return false;
		}
		return true;
	}

	public static Boolean isValue(String value) {
		if (value.matches("[0-9]*")) {
			return Boolean.valueOf(true);
		}
		return Boolean.valueOf(false);
	}

	public static Boolean isEmail(String email) {
		if (email.matches("[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+")) {
			return Boolean.valueOf(true);
		}
		return Boolean.valueOf(false);
	}

	public static Boolean isName(String name) {
		if (name.matches("[0-9a-zA-Z一-龥]+")) {
			return Boolean.valueOf(false);
		}
		return Boolean.valueOf(true);
	}

	public static Boolean isPhone(String phone) {
		if (phone.matches("^[1][3,4,5,8][0-9]{9}$")) {
			return Boolean.valueOf(true);
		}
		return Boolean.valueOf(false);
	}

	public static String countTime(String time) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = df.parse(GetTime.getTime());
		Date date = df.parse(time);
		long l = now.getTime() - date.getTime();
		long day = l / 86400000L;
		long hour = l / 3600000L - day * 24L;
		long min = l / 60000L - day * 24L * 60L - hour * 60L;
		long s = l / 1000L - day * 24L * 60L * 60L - hour * 60L * 60L - min
				* 60L;
		long month=l/(86400000*30L);
		long year=l/(86400000*365L);
		String timecount = "";
		if(year>0){
			timecount = year + "年前";
		}else if(month>0){
			timecount = month + "月前";
		}else if (day > 0L){
			timecount = day + "天前";
		}else if (hour > 0L){
			timecount = hour + "小时前";
		}else if (min > 0L){
			timecount = min + "分前";
		}else if (s > 0L){ 
			timecount = s + "秒前";
		}
		return timecount;
	}
}