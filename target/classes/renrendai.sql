create database renrendai;
select  * from user
--用户编号  --用户名(账号) --信誉积分--信誉等级	--手机号码		 --注册时间 --邮箱  check in('AA','A','B','C','D','HR')   u_status int,   用户的状态  默认为1  
create table User(
      u_id 	int primary key auto_increment,
      u_name varchar(100),
      u_password varchar(100),
      u_creditnumber int default 100,
      u_creditdegree	varchar(6) default 'HR',
      u_registerdate	long,
      u_tel	varchar(11),
	  u_email	varchar(50),
	  u_status int default 1,
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

drop table Userfund

--借贷表
--借贷主题(借贷介绍)--user的外键(借贷人id)--借贷金额--借贷状态  (0 筹款完成待放款状态  1 凑款状态  2 还款状态(借了未还) 3 完成还款 4，失败)
--借贷利率 --发出这个标的的日期 --借款成功日期(借成功时)--标的正常还贷日期     --实际还贷日期        --影响信额度 
    --借款用途--还款方式（月还贷 1，一次性还贷 0） --借贷类型          暂定              以后用的时候再说
udi_moneysure           number(10,2), --已借金额  		--去掉 		 修改	--把这个字段放在用户表中（可以统计每个用户每次借款的信息）
create table UserDebitIn(
       udi_id 			int primary key auto_increment,
       udi_title 		varchar(100) not null, 
       u_id			int, 
       udi_money 		double, 
       udi_status 		int , 
       udi_publishdate         long,
       udi_date 		long,
       udi_refundrealitydate	long,
       udi_use	                varchar(2000),
       udi_refundway		int, 	     
       udi_type          int,            
       udi_weight   int  default 0,       
	   udi_checkstatus int default 0,    --审核状态     默认为0   审核通过以后修改为1   只有通过审核才能显示在前台
	   temp2 varchar(100) default null,
	   temp3 varchar(100) default null		   
) --修改字段名称和属性：
-- 将test字段改为test1
-- ALTER TABLE 表名 CHANGE 原字段名 新字段名 字段类型 约束条件
ALTER TABLE user10 CHANGE test test1 CHAR(32) NOT NULL DEFAULT '123';

alter table UserDebitIn change temp1 udi_checkstatus int  default 0; 
--还款方式       --借贷类型              --	修改 --权重越大     越排在前面  

alter table UserDebitIn set udi_status=0 where udi_id = 5
drop table UserDebitIn 
select * from UserDebitIn
delete from UserDebitIn where udi_id=5 
update userdebitIn set udi_checkstatus=0 where udi_status=1

select udit_profit,udit_month from UserDebitInType;

insert into UserDebitIn,UserDebitInType
select * from UserDebitIn udi join  UserDebitInType udit on udi.udi_type=udit.udit_id

--借贷类型表     
create table UserDebitInType(
	udit_id int  primary key auto_increment,
	udit_name varchar(50),          --
	udit_profit  double,  
	udit_month double,			--借贷月数
	udit_status int default 1,  --1代表借款状态   0代表还款状态
	temp1 varchar(100) default null,
	temp2 varchar(100) default null,
	temp3 varchar(100) default null
)
select * from UserDebitInType

drop table UserDebitInType

truncate table UserDebitInType


--查询U计划中所有的钱数
select sum(udi_money) from UserDebitIn , UserDebitInType   
	where udit_id = udi_type and udit_name ='U计划' 

select udit_id,udit_name from UserDebitInType

--查询U计划中的所有数据
select udi_id,udi_money,udit_profit,udit_month from UserDebitInType , UserDebitIn where udit_id=udi_type

--查询U计划的历史期数与利息收益
select udi_title, peopleCount,totalMoney,udit_profit,udit_month  from
(select udi_type,udi_title,count(u_id) as peopleCount,sum(udi_money) as totalMoney 
	from UserDebitIn group by udi_type
)a left join
(select udit_id,udit_profit,udit_month
	from UserDebitInType
)b on b.udit_id=a.udi_type

--查询u计划的记录
select
		udi_id,udi_title,
		peopleCount,totalMoney,udi_money,udit_profit,udit_month,udi_status
		from
		( (select
		udi_id,udi_type,udi_title,udi_status,count(u_id) as
		peopleCount,udi_money,sum(udi_money) as
		totalMoney
		from UserDebitIn
		group by udi_type
		)a left join
		(select
		udit_id,udit_profit,udit_month
		from UserDebitInType
		)b on
		b.udit_id=a.udi_type
		) where udi_title = 'U计划'
--查询u计划的历史记录跟放贷给每个散标的金额
select a.*,b.totalMoney , b.peopleCount from
		(select
			udi_id,udi_title,
			udi_money,udit_profit,udit_month,udi_status
			from
			( (select
			udi_id,udi_type,udi_title,udi_status,udi_money
			from UserDebitIn
			group by udi_type
			)a left join
			(select
			udit_id,udit_profit,udit_month
			from UserDebitInType
			)b on
			b.udit_id=a.udi_type
			) where udi_title = 'U计划' 
		)a left join (
			select udi_id,sum(udo_money) as totalMoney,count(udi_id) peopleCount from UserDebitOut group by udi_id
		)b on a.udi_id = b.udi_id
		

--查询除u计划之外的散标记录		
		select
		udi_id,udi_title,totalMoney,udi_money,udit_profit,udit_month,udi_status
		from
		( (select
		udi_id,udi_type,udi_title,udi_status,udi_money,sum(udi_money) as
		totalMoney
		from UserDebitIn
		group by udi_type
		)a left join
		(select
		udit_id,udit_profit,udit_month
		from UserDebitInType
		)b on
		b.udit_id=a.udi_type
		) where udi_title !=
		'U计划'
		--查询除u计划之外的散标记录数
				select
		count(udi_id)
		from
		( (select
		udi_id,udi_type,udi_title,udi_status,count(u_id) as
		peopleCount,udi_money,sum(udi_money) as
		totalMoney
		from UserDebitIn
		group by udi_type
		)a left join
		(select
		udit_id,udit_profit,udit_month
		from UserDebitInType
		)b on
		b.udit_id=a.udi_type
		) where udi_title != 'U计划'
		




--放贷表
--借贷表的外键(借贷表id)  --user的外键(放贷人id)  一对多--放贷开始的时间()--放贷贷日期(放贷成功时)  
--放贷的金额  --放贷类型 (已删除)         暂定              以后用的时候再说 
create table UserDebitOut(
       udo_id 			int primary key auto_increment,      
       udi_id 			int, 
       u_id 		int,  
       udo_startdate		long, 
       udo_date 		long,  
       udo_money 		double,	
	   temp1 varchar(100) default null,
	   temp2 varchar(100) default null,
	   temp3 varchar(100) default null       
)
drop table UserDebitOut

select * from UserDebitOut;

insert into UserDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) 
	values(6 , 1 , 1502574941 , 1503020059726,1000 );
insert into UserDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) 
	values(7 , 2 , 1502584941 , 1503020069726,2000 );
insert into UserDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) 
	values(8 , 3 , 1502594941 , 1503020079726,3000 );
insert into UserDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) 
	values(9 , 4 , 1502604941 , 1503020089726,4000 );
insert into UserDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) 
	values(9 , 3 , 1502604941 , 1503020089726,6000 );

	--查询散标的历史记录跟放贷给每个散标的金额
select a.*,b.totalMoney from (select
		udi_id,udi_title,udi_money,udit_profit,udit_month,udi_status
		from
		( (select
		udi_id,udi_type,udi_title,udi_status,udi_money
		from UserDebitIn
		group by udi_type
		)a left join
		(select
		udit_id,udit_profit,udit_month
		from UserDebitInType
		)b on
		b.udit_id=a.udi_type
		) where udi_title !=
		'U计划' 
)a left join (
		select 	udi_id,sum(udo_money) as totalMoney from UserDebitOut group by udi_id
	)b on a.udi_id = b.udi_id

--还贷详情.  : 一个借贷计划每月实际的还款情况
--借贷表外键--还贷状态(0 正在还款， 1 已还，2，逾期)  --影响信额度--每月还贷金额	--还贷时间	
create table PerRefund(
	pr_id 			int primary key auto_increment,
	udi_id 			int, 			
	pr_status 		int default 0,		
	pr_money 		double,  		
	pr_date 		long,		
	temp1 varchar(100) default null,
	temp2 varchar(100) default null,
	temp3 varchar(100) default null
)
drop table  PerRefund

--关注投标表: 
  --关注人的id--借贷表id外键 --关注时间--关注状态   0代表取消关注   1代表正在关注	     	
create table AttentionMark(
	am_id 			int primary key auto_increment,
	u_id  			int, 
	udi_id  		int,    
	am_time 		long,  
	am_status	int default 1, 	
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
	au_time 		 long , 
	au_status int,    
	temp1 varchar(100) default null,
	temp2 varchar(100) default null,
	temp3 varchar(100) default null
)
drop table  AttentionUser
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

drop table admin;

--消息
   --用户id
    --时间 --内容   --  0 表示已读  1  表示未读
create table AdminToUserMessage(
	atum_id 			int primary key auto_increment,
	u_id 			int ,                
	atum_time 			long,              
	atum_content 		varchar(2000),  
	atum_status 		int default 1,
	temp1 varchar(100) default null,
	temp2 varchar(100) default null,
	temp3 varchar(100) default null
)
drop table  AdminToUserMessage
--个人资料
   
       --用户表id--真实姓名 --身份证    只能为18位数字--工作信息--收入信息 --图像
       --性别    年龄     出生日期    居住地    都通过身份证获取
         --出生日期 
       --资料就先写这么多，像人人贷一样,到时候可以接一些接口,个人征信报告，微粒贷记录
create table UserMessage(
       um_id   		int primary key auto_increment,	   
       u_id          int,        
       um_reallyName 	varchar(20),	   
       um_idCard     	varchar(18),	  
       um_nowPlace varchar(200),  
	   um_workinfo    varchar(1000),     
	   um_incomeinfo  varchar(1000),  
	   um_sex       	 varchar(4),	         
       um_age         int,               
   	   um_description  text, 
   	   bi_idCard varchar(20) unique,
	   temp1 varchar(100) default null,
	   temp2 varchar(100) default null,
	   temp3 varchar(100) default null,
	   temp4 varchar(100) default null,
	   temp5 varchar(100) default null	   
);
drop table UserMessage

insert into UserMessage(u_id,um_reallyName,um_idCard,um_sex,um_age,um_nowPlace,um_workinfo,um_incomeinfo,um_description, bi_idCard) values(1,'黄凌翔',439004199611206214,'男','21','湖南省岳阳市汨罗市','yc带头人','8000','12112',13232342442535);  
select * from UserMessage
delete from UserMessage where um_id=2 
update userMessage set um_nowPlace='湖南省岳阳市' where um_reallyName='张三'

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


drop table bankinfo







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

drop table userlogger;



create table Dictionary()


  
delete u.*,a.*,udi.*,udt.* from  User u  join AttentionMark a  on  u.u_id=a.u_id  join UserDebitIn udi  
  on  udi.udi_id=a.udi_id  join UserDebitInType udt on udi.udi_type=udt.udit_id where a.am_id=1  
 --关注投标的多表连接
 select  u.u_name,u.u_creditnumber,u.u_creditdegree,u.u_tel,a.am_status,udt.udit_profit,udt.udit_name,udt.udit_month,
udi.udi_money,udi.udi_title,udi.udi_refundway,udi.udi_status,udi.udi_weight from  User u  join AttentionMark a  on  u.u_id=a.u_id  join UserDebitIn udi  
  on  udi.udi_id=a.udi_id  join UserDebitInType udt on udi.udi_type=udt.udit_id 
 
 update User u  join AttentionMark a  on  u.u_id=a.u_id  join UserDebitIn udi  
  on  udi.udi_id=a.udi_id  join UserDebitInType udt on udi.udi_type=udt.udit_id set 
	u.u_name='b',u.u_creditnumber=100,
u.u_creditdegree='A',u.u_tel=1,a.am_status=0,udt.udit_profit=6.6,udt.udit_name='U计划',
udt.udit_month=3.0,udi.udi_money=1000,udi.udi_title='A计划',
udi.udi_refundway=1,udi.udi_status=1,udi.udi_weight=0
  where a.am_id=1
  --用户个人关注投标的多表连接
  select  a.am_id,u.u_name,u.u_creditnumber,u.u_creditdegree,u.u_tel,a.am_status,udt.udit_profit,udt.udit_name,udt.udit_month,
udi.udi_money,udi.udi_title,udi.udi_refundway,udi.udi_status,udi.udi_weight from  User u  join AttentionMark a  on  u.u_id=a.u_id  join UserDebitIn udi  
  on  udi.udi_id=a.udi_id  join UserDebitInType udt on udi.udi_type=udt.udit_id where u.u_id=1 
  
  
  --放贷信息的多表连接
select * from user u join UserDebitIn udi on u.u_id=udi.u_id 
join UserDebitOut udo on udi.udi_id=udo.udi_id
--借贷信息的多表连接
select * from user u join UserDebitIn udi on u.u_id=udi.u_id  
join  UserDebitInType udt on udi.udi_type=udt.udit_id  


  
delete from UserDebitOut where udo_id=1 
  
select * from AttentionMark
select * from UserDebitIn
select * from user
select * from UserDebitInType

select * from userMessage
delete from usermessage where um_id=5

  

