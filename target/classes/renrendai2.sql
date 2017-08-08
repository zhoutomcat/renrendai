create database renrendai;

--用户编号
create table User(
      u_id 			int primary key auto_increment,
      u_name 			varchar(100) not null unique,  --用户名(账号)
      u_password 		varchar(100) not null, 
      u_creditnumber  		int default(0) not null,  --信誉积分
      u_creditdegree   	varchar(6) default('HR') check in('AA','A','B','C','D','HR'), --信誉等级
      u_registerdate 		date   --注册时间
	  temp varchar(100) default null,
	  temp varchar(100) default null,
	  temp varchar(100) default null
  							  	  
);
--用户的账户表
create table UserFund(
       uf_id 			int primary key auto_increment,
       u_id 			int  --user的外键   一对一   
       uf_balance 		number(10,2), --账户余额(可用余额+冻结余额)
       uf_available 		number(10,2), --可用余额
       uf_freeze 		number(10,2)   --冻结余额
	   temp varchar(100) default null,
	   temp varchar(100) default null,
	   temp varchar(100) default null
	   
)

--借贷表
udi_moneysure           number(10,2), --已借金额  		--去掉 		 修改	--把这个字段放在用户表中（可以统计每个用户每次借款的信息）
create table UserDebitIn(
       udi_id 			int primary key auto_increment,
       udi_title 		varchar(100) not null, --借贷主题(借贷介绍)
       u_id			int, --user的外键(借贷人id)
       udi_money 		number(10,2), --借贷金额
       udi_status 		int  --借贷状态  (1 凑款状态  2 还款状态(借了未还) 3 完成还款 4，失败)
       udi_profit 		number(4,2)  --借贷利率
       udi_publishdate         date, --发出这个标的的日期
       udi_date 		date, --借款成功日期(借成功时)
       udi_refundnormaldate 	date, --标的正常还贷日期    
       udi_refundrealitydate	date, --实际还贷日期        --影响信额度 
       udi_use	                varchar(2000)	      --借款用途
       udi_refundway		int 	--还款方式（月还贷 1，一次性还贷 0）
	   temp varchar(100) default null,
	   temp varchar(100) default null,
	   temp varchar(100) default null	   
)

--放贷表
create table UserDebitOut(
       udo_id 			int primary key auto_increment,      
       udi_id 			int, --借贷表的外键(借贷表id)  
       u_id 		int  --user的外键(放贷人id)  一对多
       udo_startdate		date, --放贷开始的时间()
       udo_date 		date, --放贷贷日期(放贷成功时)   
       udo_money 		number(10,2)	--放贷的金额
	   temp varchar(100) default null,
	   temp varchar(100) default null,
	   temp varchar(100) default null       
										  
)

--还贷详情.  : 一个借贷计划每月实际的还款情况
create table PerRefund(
	pr_id 			int primary key auto_increment,
	udi_id 			int, 			--借贷表外键
	pr_status 		int default(0),		--还贷状态(0 正在还款， 1 已还，2，逾期)  --影响信额度
	pr_money 		number(10,2)  		--每月还贷金额
	pr_date 		date			--还贷时间	
	temp varchar(100) default null,
	temp varchar(100) default null,
	temp varchar(100) default null
)

--用户日志：
create table UserLogger(
	ul_id 			int primary key auto_increment ,   --主键
	u_id 		        int --  用户id
	ul_optype	        int ,                 --操作类型（。。。）
	ul_money 		number(10,2),         --操作金额
	ul_time 		date                --时间
	temp varchar(100) default null,
	temp varchar(100) default null,
	temp varchar(100) default null
)


--关注投标表: 
create table AttentionMark(
	am_id 			int primary key auto_increment,
	u_id  			int,   --关注人的id
	udi_id  		int, --借贷表id外键
	am_time 		date,   --关注时间
	am_stauts	int, 	--关注状态   0代表取消关注   1代表正在关注			修改
	am_weight   int  default 0,        --权重越大     越排在前面
	temp varchar(100) default null,
	temp varchar(100) default null,
	temp varchar(100) default null
)


--关注用户表: 
create table AttentionUser(
	au_id 			 int primary key auto_increment,
	u_id 			 int,    --关注人的id
	u_idbyAttention 	 int, --被关注人的id
	au_time 		 date ,  --关注时间
	au_status int     --关注状态   0代表取消关注   1代表正在关注        	修改 
	temp varchar(100) default null,
	temp varchar(100) default null,
	temp varchar(100) default null	
)

--后台系统日志:   
create table AdminLogger(
	al_id 			int primary key auto_increment ,   --主键
	a_id 			int   --           管理员id
	al_content 		varchar(2000),    --内容(xxx用户，进行了xxx操作，） 
	al_optype 		int ,                 --操作类型（。。。）
	al_opclassname 	varchar(100),       --操作的表名
	al_time 		date                --时间
)
--管理员表
create table Admin(
	a_id 			int primary key auto_increment,
	a_name 			varchar(100) not null,       
	a_password 		varchar(100) not null,
	a_role			int default 0 ,  --0表示普通管理员  1 表示超级管理员
	a_status 		int default 1  --0 表示无效  1  表示有效
	temp varchar(100) default null,
	temp varchar(100) default null,
	temp varchar(100) default null
)

--消息
create table AdminToUserMessage(
	atum_id 			int primary key auto_increment,
	u_id 			int ,                   --用户id
	atum_time 			date,               --时间
	atum_content 		varchar(2000),   --内容
	atum_status 		int default 1   --  0 表示已读  1  表示未读
)



--个人资料
create table UserMessage(
       um_id   		int primary key auto_increment,	   --
       u_id          int,
       udi_id       int,
       um_reallyName 	varchar(100),	   --真实姓名
       um_idCard     	varchar(100),	   --身份证
       um_tel  	     	varchar(100),	   --手机号码
       um_sex       	 int,	   --性别 1 男  0 女      
       um_nowPlaceTel   varchar(100),   --居住地电话
       um_email varchar(100),
       um_image           --图像
       
);

create table Dictionary()






---注意每项都加两个冗余
  分别以类每个单词首字母+1/2
   如: User   u1 和  u2
UserMessage  um1 和  um2






