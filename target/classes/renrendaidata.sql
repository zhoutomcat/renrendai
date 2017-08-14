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

select * from user;


-------------------------------------------------------------------
--用户的账户表
insert into userFund(u_id,uf_balance,uf_available,uf_freeze) values(1,0.00,0.00,0.00);
insert into userFund(u_id,uf_balance,uf_available,uf_freeze) values(2,0.00,0.00,0.00);
insert into userFund(u_id,uf_balance,uf_available,uf_freeze) values(3,0.00,0.00,0.00);
insert into userFund(u_id,uf_balance,uf_available,uf_freeze) values(4,0.00,0.00,0.00);
select * from userFund;
commit;

------------------------------------------


select * from userDebitIn

--借贷表
insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('U计划',1,100000,1,
 1439355893,
1470955893,
1502584941,
'平台众筹',1,1);

insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('U计划',2,100000,1,
 1470955893,
 1439355893,
1534184343 ,
'平台众筹',1,2);
insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('U计划',3,100000,1,
1439355893,
1442355893,
1532184121,
'平台众筹',1,3);
insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('U计划',4,100000,1,
1502584941 ,
1512584321 ,
1597484941,   
'平台众筹',0,4);
insert into userDebitIn(udi_title,u_id,udi_money,udi_status, udi_publishdate, udi_date,
udi_refundrealitydate,udi_use,udi_refundway,udi_type)
 values('U计划',4,100000,1,
1502584941 ,
1512584321 ,
1597484941,   
'平台众筹',0,5);
--实例还贷日期不确定，到时候前段需要修改    显示正在还款
select * from userDebitIn;     --uid唯一       只能借贷一次，除非已经还款
-----------------------------------

--借贷类型表
insert into UserDebitInType(udit_name , udit_profit , udit_month) values('U计划' , 6  , 1);
insert into UserDebitInType(udit_name , udit_profit , udit_month) values('U计划' , 6.6 , 3);
insert into UserDebitInType(udit_name , udit_profit , udit_month) values('U计划' , 7.2 , 6);
insert into UserDebitInType(udit_name , udit_profit , udit_month) values('U计划' , 8.8 , 12);
insert into UserDebitInType(udit_name , udit_profit , udit_month) values('U计划' , 10   , 24);


--放贷表
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
insert into AttentionMark(u_id,udi_id,am_time,am_status,am_weight) values(1,1,1407855893,1,default);
insert into AttentionMark(u_id,udi_id,am_time,am_status,am_weight) values(2,1,1502584941 ,1,10);
insert into AttentionMark(u_id,udi_id,am_time,am_status,am_weight) values(3,1,1439355893,1,default);
insert into AttentionMark(u_id,udi_id,am_time,am_status,am_weight) values(4,2,1502584941 ,0,default);
select * from AttentionMark;
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
insert into UserMessage(u_id,um_reallyName,um_idCard,um_nowPlace,um_workinfo,um_incomeinfo,um_image) values(1,'黄凌翔',439004199611206214,'湖南省岳阳市汨罗市','yc带头人','8000',default);  
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