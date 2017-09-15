package com.findu.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class GetTime {
	
	/**
	 * 获得当前时间方法
	 * @return
	 */
	public static String getTime() {
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = df.format(date);
		return s;
	}
}