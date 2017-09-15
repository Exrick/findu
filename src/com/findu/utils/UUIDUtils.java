package com.findu.utils;

import java.util.UUID;

public class UUIDUtils {
	
	//获得唯一标示
	public static String getUUID() {
		
		return UUID.randomUUID().toString();
	}
}