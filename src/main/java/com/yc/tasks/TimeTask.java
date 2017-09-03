package com.yc.tasks;

import java.text.SimpleDateFormat;
/**
 * 0 0 10,14,16 * * ? 每天上午10点，下午2点，4点
0 0/30 9-17 * * ?   朝九晚五工作时间内每半小时
0 0 12 ? * WED 表示每个星期三中午12点 
"0 0 12 * * ?" 每天中午12点触发 
"0 15 10 ? * *" 每天上午10:15触发 
"0 15 10 * * ?" 每天上午10:15触发 
"0 15 10 * * ? *" 每天上午10:15触发 
"0 15 10 * * ? 2005" 2005年的每天上午10:15触发 
"0 * 14 * * ?" 在每天下午2点到下午2:59期间的每1分钟触发 
"0 0/5 14 * * ?" 在每天下午2点到下午2:55期间的每5分钟触发 
"0 0/5 14,18 * * ?" 在每天下午2点到2:55期间和下午6点到6:55期间的每5分钟触发 
"0 0-5 14 * * ?" 在每天下午2点到下午2:05期间的每1分钟触发 
"0 10,44 14 ? 3 WED" 每年三月的星期三的下午2:10和2:44触发 
"0 15 10 ? * MON-FRI" 周一至周五的上午10:15触发 
"0 15 10 15 * ?" 每月15日上午10:15触发 
"0 15 10 L * ?" 每月最后一日的上午10:15触发 
"0 15 10 ? * 6L" 每月的最后一个星期五上午10:15触发 
"0 15 10 ? * 6L 2002-2005" 2002年至2005年的每月的最后一个星期五上午10:15触发 
"0 15 10 ? * 6#3" 每月的第三个星期五上午10:15触发 
 */
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class TimeTask {
	//@Scheduled(fixedDelay = 3000)//间隔时间
	@Scheduled(cron ="0 0 1 ? * *")//间隔时间  "0 15 10 ? * *" 每天傍晚一点触发 
	/*public void test() {
		System.out.println("job 开始执行" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
	}*/
	
	public void count(){
		//完成还款       没完成一次信誉积分加一分到一定积分   升等级
		//失败一次      扣一分                                                    降等级
		//U计划       逾期一月         扣一分                               降等级
		//                没逾期，提前还一月      加一分                  生等级
		//下面这套规则用在了user     javabean中         修改积分等级会变化  
		/*	1.用户表中有一个积分和一个信誉度
		public String getU_credit_degree(){   // default('HR') in('AA','A','B','C','D','HR'), --信誉等级
		    	String str=null;
		    	if(this.u_credit_number>=160){
		    		str="AA";
		    	}else if(this.u_credit_number>=145){
		    		str="A";
		    	}else if(this.u_credit_number>=130){
		    		str="B";
		    	}else if(this.u_credit_number>=120){
		    		str="C";
		    	}else if(this.u_credit_number>=110){
		    		str="D";
		    	}else if(this.u_credit_number>=100){
		    		str="E";
		    	}else{
		    		str="HR";
		    	}
		    	return str;
		    }       根据积分来给用户设置等级，新用户默认为HR,积分为100，我们是根据
		private long udi_refundrealitydate;     //实际还贷日期     来给用户做积分判定的                  影响信誉度
*/		
		
	}

	
	
}



