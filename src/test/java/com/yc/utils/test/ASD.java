package com.yc.utils.test;

/**
 * 如何从1970年1月1日0时开始的毫秒数得到通用时间
 */
	import java.text.SimpleDateFormat;
	import java.util.Date;
	public class ASD {
	    public static void main(String[] args) {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E");
	        sdf.applyPattern("yyyy年MM月dd日 HH时mm分ss秒 E ");//设置日期显示格式
	        Date date0 = new Date();
	        long test = (long) 1504530191.344 ;//这个表示秒数，这里如果直接用*1000的毫秒会越界，所以用秒
	        System.out.println(test);
	        //    1502684941   2017年08月14日 12时29分01秒 星期一 
//	        date0.setTime(test*1000);//因为settime的时候需要使用毫秒数，所以要用秒*1000
	        date0.setTime( (long) (1504530191.344 * 1000));
	        String dateStr1 = sdf.format(date0);
	        System.out.println(dateStr1);
	    }
	} 


