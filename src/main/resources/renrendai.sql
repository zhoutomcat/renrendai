create database renrendai;

--用户编号  --用户名(账号) --信誉积分--信誉等级	--手机号码		 --注册时间 --邮箱  check in('AA','A','B','C','D','HR')
create table User(
      u_id 			int primary key auto_increment,
      u_name 			varchar(100),
      u_password 		varchar(100), 
      u_creditnumber int default 0, 
      u_creditdegree	varchar(6) default 'HR', 
      u_registerdate	date,  
      u_tel	varchar(11),						
	  u_email	varchar(50) ,			
	  temp1 varchar(100) default null,
	  temp2 varchar(100) default null,
	  temp3 varchar(100) default null
);
drop table user;
--用户的账户表--user的外键   一对一    --账户余额(可用余额+冻结余额) --可用余额--冻结余额
create table UserFund(
       uf_id 			int primary key auto_increment,
       u_id 			int,  
       uf_balance 		double,
       uf_available 	double,
       uf_freeze 		double,   
	   temp1 varchar(100) default null,
	   temp2 varchar(100) default null,
	   temp3 varchar(100) default null
)

--借贷表
--借贷主题(借贷介绍)--user的外键(借贷人id)--借贷金额--借贷状态  (1 凑款状态  2 还款状态(借了未还) 3 完成还款 4，失败)
--借贷利率 --发出这个标的的日期 --借款成功日期(借成功时)--标的正常还贷日期     --实际还贷日期        --影响信额度 
    --借款用途--还款方式（月还贷 1，一次性还贷 0） --借贷类型          暂定              以后用的时候再说
udi_moneysure           number(10,2), --已借金额  		--去掉 		 修改	--把这个字段放在用户表中（可以统计每个用户每次借款的信息）
create table UserDebitIn(
       udi_id 			int primary key auto_increment,
       udi_title 		varchar(100) not null, 
       u_id			int, 
       udi_money 		double, 
       udi_status 		int , 
       udi_profit 		double,  
       udi_publishdate         date,
       udi_date 		date,
       udi_refundnormaldate 	date, 
       udi_refundrealitydate	date,
       udi_use	                varchar(2000),	  
       udi_refundway		int, 	
       udi_type          varchar(100),     
	   temp1 varchar(100) default null,
	   temp2 varchar(100) default null,
	   temp3 varchar(100) default null	   
)
drop table UserDebitIn 
--放贷表
--借贷表的外键(借贷表id)  --user的外键(放贷人id)  一对多--放贷开始的时间()--放贷贷日期(放贷成功时)  
--放贷的金额  --放贷类型          暂定              以后用的时候再说 
create table UserDebitOut(
       udo_id 			int primary key auto_increment,      
       udi_id 			int, 
       u_id 		int,  
       udo_startdate		date, 
       udo_date 		date,  
       udo_money 		double,	
       udo_type     varchar(100),           
	   temp1 varchar(100) default null,
	   temp2 varchar(100) default null,
	   temp3 varchar(100) default null       
)

--还贷详情.  : 一个借贷计划每月实际的还款情况
--借贷表外键--还贷状态(0 正在还款， 1 已还，2，逾期)  --影响信额度--每月还贷金额	--还贷时间	
create table PerRefund(
	pr_id 			int primary key auto_increment,
	udi_id 			int, 			
	pr_status 		int default 0,		
	pr_money 		double,  		
	pr_date 		date,		
	temp1 varchar(100) default null,
	temp2 varchar(100) default null,
	temp3 varchar(100) default null
)


--关注投标表: 
  --关注人的id--借贷表id外键 --关注时间--关注状态   0代表取消关注   1代表正在关注			修改 --权重越大     越排在前面
create table AttentionMark(
	am_id 			int primary key auto_increment,
	u_id  			int, 
	udi_id  		int, 
	am_time 		date,  
	am_status	int, 	
	am_weight   int  default 0,       
	temp1 varchar(100) default null,
	temp2 varchar(100) default null,
	temp3 varchar(100) default null
)
drop table AttentionMark 


--关注用户表: 
 --关注人的id--被关注人的id --关注时间 --关注状态   0代表取消关注   1代表正在关注        	修改 
create table AttentionUser(
	au_id 			 int primary key auto_increment,
	u_id 			 int,   
	u_idbyAttention 	 int, 
	au_time 		 date , 
	au_status int,    
	temp1 varchar(100) default null,
	temp2 varchar(100) default null,
	temp3 varchar(100) default null	
)

--管理员表
 --0表示普通管理员  1 表示超级管理员
  --0 表示无效  1  表示有效
create table Admin(
	a_id 			int primary key auto_increment,
	a_name 			varchar(100) not null,       
	a_password 		varchar(100) not null,
	a_role			int default 0 , 
	a_status 		int default 1, 
	temp1 varchar(100) default null,
	temp2 varchar(100) default null,
	temp3 varchar(100) default null
)

--消息
   --用户id
    --时间 --内容   --  0 表示已读  1  表示未读
create table AdminToUserMessage(
	atum_id 			int primary key auto_increment,
	u_id 			int ,                
	atum_time 			date,              
	atum_content 		varchar(2000),  
	atum_status 		int default 1,
	temp1 varchar(100) default null,
	temp2 varchar(100) default null,
	temp3 varchar(100) default null
)

--个人资料
       um_sex       	 int,	         --性别    年龄     出生日期    居住地    都通过身份证获取
       um_age         int,
       um_birthday  date,                  --出生日期 
       --用户表id--真实姓名 --身份证    只能为18位数字--工作信息--收入信息 --图像
       --资料就先写这么多，像人人贷一样,到时候可以接一些接口,个人征信报告，微粒贷记录
create table UserMessage(
       um_id   		int primary key auto_increment,	   
       u_id          int,        
       um_reallyName 	varchar(20),	   
       um_idCard     	varchar(18),	  
       um_nowPlace varchar(200),  
	   um_workinfo    varchar(1000),     
	   um_incomeinfo  varchar(1000),     
       um_image     varchar(2000)  default null,    
	   temp1 varchar(100) default null,
	   temp2 varchar(100) default null,
	   temp3 varchar(100) default null,
	   temp4 varchar(100) default null,
	   temp5 varchar(100) default null	   
);



--银行卡信息表
		--银行卡持有人姓名	--银行卡号--用户id    外键约束--银行卡状态（是否在用）   0表示不可用  1表示可用
create table bankInfo(
	bi_id int ,		
	bi_name varchar(20),			
	bi_idCard varchar(20) unique,	
	u_id int ,					
	bi_status int ,				
	temp1 varchar(100) default null,
	temp2 varchar(100) default null,
	temp3 varchar(100) default null
)















---注意每项都加两个冗余
  分别以类每个单词首字母+1/2
   如: User   u1 和  u2
UserMessage  um1 和  um2


--后台系统日志:   
 --主键 --  管理员id --内容(xxx用户，进行了xxx操作，）   --操作类型（。。。）  --操作的表名     --时间
create table AdminLogger(
	al_id 			int primary key auto_increment ,  
	a_id 			int  ,
	al_content 		varchar(2000),   
	al_optype 		int ,               
	al_opclassname 	varchar(100),     
	al_time 		date           
)

--用户日志：
  --主键 --  用户id--操作类型（。。。）--操作金额 --时间
create table UserLogger(
	ul_id 			int primary key auto_increment , 
	u_id 		        int,
	ul_optype	        int ,                 
	ul_money 		double,         
	ul_time 		date,               
	temp1 varchar(100) default null,
	temp2 varchar(100) default null,
	temp3 varchar(100) default null
)



create table Dictionary()





-------------------------------------------
create database renrendai;
user  renrendai;
--用户表
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('a','a',default,default,now(),'17674756360','1226225589@qq.com');
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('b','b',default,default,now(),'15386028352','1046051715@qq.com');
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('c','c',default,default,now(),'18273474977','dadad@163.com');
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('d','d',default,default,now(),'18874610678','dad@163.com');
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('e','e',default,default,now(),'17674737157','dadadadawr@163.com');
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('f','f',2,'A',now(),'18570461942','dadadawr@163.com');
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('g','g',5,'B',now(),'18473481898','dadawr@163.com');
select * from user;


-------------------------------------------------------------------
--用户的账户表
insert into userFund(u_id,uf_balance,uf_available,uf_freeze) values(1,0.00,0.00,0.00);
insert into userFund(u_id,uf_balance,uf_available,uf_freeze) values(2,0.00,0.00,0.00);
insert into userFund(u_id,uf_balance,uf_available,uf_freeze) values(3,0.00,0.00,0.00);
select * from userFund;
commit;

------------------------------------------




--借贷表
insert into userDebitIn(udi_title,u_id,udi_money,udi_status,udi_profit, udi_publishdate, udi_date,
udi_refundnormaldate,udi_refundrealitydate,udi_use,udi_refundway)
 values('买房',1,100000,1,12.50,
'2016/7/28',
now(),
'2018/7/28',
'2018/7/28',
'计划在海边买一栋别墅',1);
insert into userDebitIn(udi_title,u_id,udi_money,udi_status,udi_profit, udi_publishdate, udi_date,
udi_refundnormaldate,udi_refundrealitydate,udi_use,udi_refundway)
 values('买车',2,100000,1,12.50,
'2016/7/28',
now(),
'2019/7/28',
'2019/7/28',
'计划在海边买一栋别墅',1);
insert into userDebitIn(udi_title,u_id,udi_money,udi_status,udi_profit, udi_publishdate, udi_date,
udi_refundnormaldate,udi_refundrealitydate,udi_use,udi_refundway)
 values('买药',3,100000,1,12.50,
now(),
'2016/7/28',
'2019/7/28',
'2020/7/28',
'计划在海边买一栋别墅',1);
insert into userDebitIn(udi_title,u_id,udi_money,udi_status,udi_profit, udi_publishdate, udi_date,
udi_refundnormaldate,udi_refundrealitydate,udi_use,udi_refundway)
 values('投资',4,100000,1,12.50,
'2017/7/28',
now(),
'2019/7/28',
'2019/1/28',
'计划在海边买一栋别墅',0);
select * from userDebitIn;     --uid唯一       只能借贷一次，除非已经还款
-----------------------------------
--放贷表
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(1,5,now(),now(),10000);
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(1,6,now(),'2019/7/28',10000);
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(1,7,now(),'2019/7/28',10000);
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(2,8,now(),'2020/7/28',10000);
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(2,9,now(),'2018/7/28',10000);
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(2,7,now(),'2019/7/28',10000);
select * from userDebitOut
------------------------------------
--自动生成
--insert into r_PerRefund values(1,to_date('2013/8/28','yyyy/MM/dd'),10000,0,1)
--还贷表  --还贷详情. 
--insert into perRefund(udi_id,pr_status,pr_money,pr_date) values(1,0,1000,'2019/8/8');    
--insert into perRefund(udi_id,pr_status,pr_money,pr_date) values(2,1,6000,'2020/8/8');   
--insert into perRefund(udi_id,pr_status,pr_money,pr_date) values(3,2,5000,'2018/8/8');   
--insert into perRefund(udi_id,pr_status,pr_money,pr_date) values(4,0,1000,'2019/8/8');   
-------------------------------------
--关注投标表: 
insert into AttentionMark(u_id,udi_id,am_time,am_status,am_weight) values(6,1,'2016/7/28',1,default);
insert into AttentionMark(u_id,udi_id,am_time,am_status,am_weight) values(7,1,'2017/8/8',1,10);
insert into AttentionMark(u_id,udi_id,am_time,am_status,am_weight) values(8,1,'2015/7/28',1,default);
insert into AttentionMark(u_id,udi_id,am_time,am_status,am_weight) values(9,2,now(),0,default);
select * from AttentionMark;
--------------------------------------------------------------------
--关注用户表: 
insert into AttentionUser(u_id,u_idbyAttention,au_time,au_status) values(1,5,now(),1);
insert into AttentionUser(u_id,u_idbyAttention,au_time,au_status) values(2,6,'2016/7/28',1);
insert into AttentionUser(u_id,u_idbyAttention,au_time,au_status) values(3,6,'2015/7/28',1);
insert into AttentionUser(u_id,u_idbyAttention,au_time,au_status) values(4,6,'2016/7/28',0);
select * from AttentionUser;
----------------------------------------------------------------------
---------后台管理员表--------------
select * from admin ;
insert into admin(a_name,a_password,a_role,a_status) values('a','a',0,1);--后台管理员
insert into  admin(a_name,a_password,a_role,a_status) values('yc','a',default,default);
commit;
--消息表
-------------------------------------------------------------------
insert into AdminToUserMessage(u_id,atum_time,atum_content,atum_status) values(1,now(),'请的借款期限快到了，请及时还款',1);
insert into AdminToUserMessage(u_id,atum_time,atum_content,atum_status) values(2,'2018/7/28','请的借款期限快到了，请及时还款',0);
insert into AdminToUserMessage(u_id,atum_time,atum_content,atum_status) values(3,'2017/7/28','请的借款期限快到了，请及时还款',1);
insert into AdminToUserMessage(u_id,atum_time,atum_content,atum_status) values(4,'2017/8/28','请的借款期限快到了，请及时还款',0);
-------------------------------------------------------------------
--个人资料表        --通过身份证或者 sex，age，birthday,居住地
insert into UserMessage(u_id,um_reallyName,um_idCard,um_nowPlace,um_workinfo,um_incomeinfo,um_image) values(1,'黄凌翔',439004199611206214,'湖南省岳阳市汨罗市','yc带头人','8000',default);  
commit;
--------------------------------------------------------------------
--银行卡信息表
insert into bankInfo(bi_name,bi_idCard,u_id,bi_status) values('zsc','3114433543655634643',1,1);
insert into bankInfo(bi_name,bi_idCard,u_id,bi_status) values('zzz','1123438568050350545',2,1);
insert into bankInfo(bi_name,bi_idCard,u_id,bi_status) values('hlx','2193050425309043058',3,0);
insert into bankInfo(bi_name,bi_idCard,u_id,bi_status) values('zzc','3239450455430545454',4,0);
--------------------------------------------------------------------









