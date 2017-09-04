package com.yc.utils.test;

import java.util.Calendar;
import java.util.Date;

//获取从1970 1 1到当前毫秒数  
public class A {
	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		 System.out.println(Calendar.getInstance().getTimeInMillis());
	}
}