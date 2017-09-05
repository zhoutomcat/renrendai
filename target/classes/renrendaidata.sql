 --long型    1970年到个时间段的毫秒数
 --      2014年08月12日 23时04分53秒   1407855893  2015年08月12日 13时04分53秒    1439355893    2015年09月16日 06时24分53秒   1442355893   
 --       2016年08月12日 06时51分33秒   1470955893     2017/8/13 上午8:43:5   1502584941 
-- 2018年08月14日 02时19分03秒   1534184343         2019年08月13日 16时29分01秒    1534284941   
--2020年08月15日 17时49分01秒                 1597484941
-------------------------------------------
create database renrendai;
user  renrendai;
--用户表         


insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('a','a',default,default,1407855893,'1','a@qq.com');
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('b','a',default,default,1407855893,'1','b@qq.com');
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('c','a',2,'A',1439355893,'1','c@163.com');
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('d','a',5,'B',1502584941 ,'1','d@163.com');
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('e','a',default,default,1407855893,'1','e@qq.com');
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('f','a',default,default,1407855893,'1','f@qq.com');
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('g','a',2,'A',1439355893,'1','g@163.com');
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('h','a',5,'B',1502584941 ,'1','h@163.com');
update user set u_password='6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2'
update user set u_password='a'; 
select * from user;


-------------------------------------------------------------------
--用户的账户表
insert into userFund(u_id,uf_balance,uf_available,uf_freeze) values(1,0.00,0.00,0.00);
insert into userFund(u_id,uf_balance,uf_available,uf_freeze) values(2,0.00,0.00,0.00);
insert into userFund(u_id,uf_balance,uf_available,uf_freeze) values(3,0.00,0.00,0.00);
insert into userFund(u_id,uf_balance,uf_available,uf_freeze) values(4,0.00,0.00,0.00);
select * from userFund;
update userFund set uf_balance = uf_balance + 1000 ,uf_available = uf_available + 1000
commit;

------------------------------------------


select * from userDebitIn

--借贷表
--U计划
insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('U计划',null,100000,1,
 1439355893,
1470955893,
1502584941,
'平台众筹',1,1);

insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('U计划',null,100000,1,
 1470955893,
 1439355893,
1534184343 ,
'平台众筹',1,2);
insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('U计划',null,100000,1,
1439355893,
1442355893,
1532184121,
'平台众筹',1,3);
insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('U计划',null,100000,1,
1502584941 ,
1512584321 ,
1597484941,   
'平台众筹',0,4);
insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('U计划',null,100000,1,
1502584941 ,
1512584321 ,
1597484941,   
'平台众筹',0,5);

--借贷表
--散标
insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('教育培训',5,100000,1,
 1439355893,
1470955893,
1502584941,
'教育培训',1,6);

insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('资金周转',6,100000,1,
 1470955893,
 1439355893,
1534184343 ,
'资金周转',1,7);

insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('装修',7,100000,1,
1439355893,
1442355893,
1532184121,
'装修',1,8);

insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('扩大生产/经营',8,100000,1,
1439355893,
1442355893,
1532184121,
'扩大生产/经营',1,9);
--插入2条a用户筹款成功过的数据
insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('资金周转',1,100000,2,
1439355893,
1442355893,
1532184121,
'资金周转',1,7);

insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('扩大生产/经营',1,100000,2,
1439355893,
1442355893,
1532184121,
'扩大生产/经营',1,9);

select * from userDebitIn
--实例还贷日期不确定，到时候前段需要修改    显示正在还款
select * from userDebitIn;     --uid唯一       只能借贷一次，除非已经还款
-----------------------------------

--借贷类型表
insert into UserDebitInType(udit_name , udit_profit , udit_month) values('U计划' , 6  , 1);
insert into UserDebitInType(udit_name , udit_profit , udit_month) values('U计划' , 6.6 , 3);
insert into UserDebitInType(udit_name , udit_profit , udit_month) values('U计划' , 7.2 , 6);
insert into UserDebitInType(udit_name , udit_profit , udit_month) values('U计划' , 8.8 , 12);
insert into UserDebitInType(udit_name , udit_profit , udit_month) values('U计划' , 10  , 24);
insert into UserDebitInType(udit_name , udit_profit , udit_month) values('教育培训' , 11  , 1);
insert into UserDebitInType(udit_name , udit_profit , udit_month) values('资金周转' , 11  , 1);
insert into UserDebitInType(udit_name , udit_profit , udit_month) values('装修' , 11  , 1);
insert into UserDebitInType(udit_name , udit_profit , udit_month) values('扩大生产/经营' , 11  , 1);
select * from  UserDebitInType
--放贷表
--新数据    散标
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
--u计划  	
insert into UserDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) 
	values(1 , 5 , 1502574941 , 1503020059726,10000 );
insert into UserDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) 
	values(2 , 6 , 1502584941 , 1503020069726,20000 );
insert into UserDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) 
	values(2 , 6 , 1502584941 , 1503020069726,15000 );
insert into UserDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) 
	values(3 , 7 , 1502594941 , 1503020079726,30000 );
insert into UserDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) 
	values(4 , 8 , 1502604941 , 1503020089726,40000 );
insert into UserDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) 
	values(5 , 6 , 1502604941 , 1503020089726,60000 );
select * from userdebitout
--久数据（可以不使用）
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(1,1,1439355893,1439355893 ,10000);
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(1,2,1439355893,1439355893 ,10000);
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(1,3,1470955893,1439355893 ,10000);
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(2,4,1470955893,1502584941,10000);
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(2,1,1470955893,1502584941,10000);
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(2,2,1502584941,1502584941,10000);
select * from userDebitOut
truncate table userDebitOut
------------------------------------
--自动生成
--insert into r_PerRefund values(1,to_date('2013/8/28','yyyy/MM/dd'),10000,0,1)
--还贷表  --还贷详情.    还贷可以考虑一下自动生成
insert into perRefund(udi_id,pr_status,pr_money,pr_date) values(1,0,1000,1534284941);    
insert into perRefund(udi_id,pr_status,pr_money,pr_date) values(2,1,6000,1597484941);   
insert into perRefund(udi_id,pr_status,pr_money,pr_date) values(3,2,5000,1534184343);   
insert into perRefund(udi_id,pr_status,pr_money,pr_date) values(4,0,1000,1534284941);  
select * from perRefund
-------------------------------------
--关注投标表: 
update AttentionMark set am_status=1 where am_id=9
insert into AttentionMark(u_id,udi_id,am_time,am_status) values(4,1,1407855893,1);
insert into AttentionMark(u_id,udi_id,am_time,am_status) values(3,1,1502584941 ,1);
insert into AttentionMark(u_id,udi_id,am_time,am_status) values(2,1,1439355893,1);
insert into AttentionMark(u_id,udi_id,am_time,am_status) values(1,2,1502584941 ,0);
insert into AttentionMark(u_id,udi_id,am_time,am_status) values(1,3,1502584941 ,1);
select * from AttentionMark;

select count(1) from User u join AttentionMark a on u.u_id=a.u_id join
		UserDebitIn udi
		on udi.udi_id=a.udi_id join UserDebitInType udt on
		udi.udi_type=udt.udit_id where a.u_id= 1 and a.am_status = 1
--------------------------------------------------------------------
--关注用户表: 
insert into AttentionUser(u_id,u_idbyAttention,au_time,au_status) values(1,4,1407855893,1);
insert into AttentionUser(u_id,u_idbyAttention,au_time,au_status) values(2,3, 1439355893,1);
insert into AttentionUser(u_id,u_idbyAttention,au_time,au_status) values(3,2,1470955893,1);
insert into AttentionUser(u_id,u_idbyAttention,au_time,au_status) values(4,1,1502584941,0);
select * from AttentionUser;
----------------------------------------------------------------------
---------后台管理员表--------------
select * from admin ;
insert into admin(a_name,a_password,a_role,a_status) values('a','a',0,1);--后台管理员
insert into  admin(a_name,a_password,a_role,a_status) values('yc','a',default,default);
commit;
--消息表
-------------------------------------------------------------------
insert into AdminToUserMessage(u_id,atum_time,atum_content,atum_status) values(1,1502584941,'请的借款期限快到了，请及时还款',1);
insert into AdminToUserMessage(u_id,atum_time,atum_content,atum_status) values(2,1502584941,'请的借款期限快到了，请及时还款',0);
insert into AdminToUserMessage(u_id,atum_time,atum_content,atum_status) values(3,1534184343,'请的借款期限快到了，请及时还款',1);
insert into AdminToUserMessage(u_id,atum_time,atum_content,atum_status) values(4,1534184343,'请的借款期限快到了，请及时还款',0);
select * from AdminToUserMessage ;
-------------------------------------------------------------------
--个人资料表        --通过身份证或者 sex，age，birthday,居住地
insert into UserMessage(u_id,um_reallyName,um_idCard,um_sex,um_age,um_nowPlace,um_workinfo,um_incomeinfo,um_description) values(1,'黄凌翔',439004199611206214,'男','21','湖南省岳阳市汨罗市','yc带头人','8000','12112');  
select * from UserMessage ;
commit;
--------------------------------------------------------------------
--银行卡信息表
insert into bankInfo(bi_name,bi_idCard,u_id,bi_status) values('a','3114433543655634643',1,1);
insert into bankInfo(bi_name,bi_idCard,u_id,bi_status) values('b','1123438568050350545',2,1);
insert into bankInfo(bi_name,bi_idCard,u_id,bi_status) values('c','2193050425309043058',3,0);
insert into bankInfo(bi_name,bi_idCard,u_id,bi_status) values('d','3239450455430545454',4,0);
select * from bankInfo ;
----------------------------------------