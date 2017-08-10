-------------------------------------------
create database renrendai;
user  renrendai;
--用户表
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('a','a','','',to_date('2017/7/25','yyyy/MM/dd'),17674756360,1226225589@qq.com);
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('b','b','','',to_date('2017/7/26','yyyy/MM/dd'),15386028352,1046051715@qq.com);
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('c','c','','',to_date('2017/7/27','yyyy/MM/dd'),18273474977,dadad@163.com);
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('d','d','','',to_date('2017/7/28','yyyy/MM/dd'),18874610678,dad@163.com);
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('e','e','','',to_date('2017/7/28','yyyy/MM/dd'),17674737157,dadadadawr@163.com);
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('f','f','','',to_date('2017/7/28','yyyy/MM/dd'),18570461942,dadadawr@163.com);
insert into user(u_name,u_password,u_creditnumber,u_creditdegree,u_registerdate,u_tel,u_email) values('g','g','','',to_date('2017/7/28','yyyy/MM/dd'),18473481898,dadawr@163.com);
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
insert into userDebitIn(udi_title,u_idin,udi_money,udi_status,udi_profit, udi_publishdate, udi_date,
udi_refundnormaldate,udi_refundrealitydate,udi_use,udi_refundway)
 values('买房',1,100000,1,12.50,
to_date('2013/7/28','yyyy/MM/dd'),
to_date('2013/7/28','yyyy/MM/dd'),
to_date('2013/7/28','yyyy/MM/dd'),
to_date('2013/7/28','yyyy/MM/dd'),
'计划在海边买一栋别墅',1);
insert into userDebitIn(udi_title,u_idin,udi_money,udi_status,udi_profit, udi_publishdate, udi_date,
udi_refundnormaldate,udi_refundrealitydate,udi_use,udi_refundway)
 values('买车',2,100000,1,12.50,
to_date('2013/7/28','yyyy/MM/dd'),
to_date('2013/7/28','yyyy/MM/dd'),
to_date('2013/7/28','yyyy/MM/dd'),
to_date('2013/7/28','yyyy/MM/dd'),
'计划在海边买一栋别墅',1);
insert into userDebitIn(udi_title,u_idin,udi_money,udi_status,udi_profit, udi_publishdate, udi_date,
udi_refundnormaldate,udi_refundrealitydate,udi_use,udi_refundway)
 values('买药',3,100000,1,12.50,
to_date('2013/7/28','yyyy/MM/dd'),
to_date('2013/7/28','yyyy/MM/dd'),
to_date('2013/7/28','yyyy/MM/dd'),
to_date('2013/7/28','yyyy/MM/dd'),
'计划在海边买一栋别墅',1);
insert into userDebitIn(udi_title,u_idin,udi_money,udi_status,udi_profit, udi_publishdate, udi_date,
udi_refundnormaldate,udi_refundrealitydate,udi_use,udi_refundway)
 values('投资',4,100000,1,12.50,
to_date('2013/7/28','yyyy/MM/dd'),
to_date('2013/7/28','yyyy/MM/dd'),
to_date('2013/7/28','yyyy/MM/dd'),
to_date('2013/7/28','yyyy/MM/dd'),
'计划在海边买一栋别墅',0);
select * from userDebitIn;     --uid唯一       只能借贷一次，除非已经还款
-----------------------------------
--放贷表
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(1,5,to_date('2013/7/28','yyyy/MM/dd'),to_date('2013/7/28','yyyy/MM/dd'),10000);
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(1,6,to_date('2013/7/28','yyyy/MM/dd'),to_date('2013/7/28','yyyy/MM/dd'),10000);
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(1,7,to_date('2013/7/28','yyyy/MM/dd'),to_date('2013/7/28','yyyy/MM/dd'),10000);
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(2,8,to_date('2013/7/28','yyyy/MM/dd'),to_date('2013/7/28','yyyy/MM/dd'),10000);
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(2,9,to_date('2013/7/28','yyyy/MM/dd'),to_date('2013/7/28','yyyy/MM/dd'),10000);
insert into userDebitOut(udi_id,u_id,udo_startdate,udo_date,udo_money) values(2,7,to_date('2013/7/28','yyyy/MM/dd'),to_date('2013/7/28','yyyy/MM/dd'),10000);
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
insert into AttentionMark(u_id,udi_id,am_time,am_status,am_weight) values(6,1,to_date('2013/7/28','yyyy/MM/dd'),1,default);
insert into AttentionMark(u_id,udi_id,am_time,am_status,am_weight) values(7,1,to_date('2013/7/28','yyyy/MM/dd'),1,10);
insert into AttentionMark(u_id,udi_id,am_time,am_status,am_weight) values(8,1,to_date('2013/7/28','yyyy/MM/dd'),1,default);
insert into AttentionMark(u_id,udi_id,am_time,am_status,am_weight) values(9,2,to_date('2013/7/28','yyyy/MM/dd'),1,default);
select * from AttentionMark;
--------------------------------------------------------------------
--关注用户表: 
insert into AttentionUser(u_id,u_idbyAttention,au_time,au_status) values(1,5,to_date('2013/7/28','yyyy/MM/dd'),1);
insert into AttentionUser(u_id,u_idbyAttention,au_time,au_status) values(2,6,to_date('2013/7/28','yyyy/MM/dd'),1);
insert into AttentionUser(u_id,u_idbyAttention,au_time,au_status) values(3,6,to_date('2013/7/28','yyyy/MM/dd'),1);
insert into AttentionUser(u_id,u_idbyAttention,au_time,au_status) values(4,6,to_date('2013/7/28','yyyy/MM/dd'),0);
select * from AttentionUser;
----------------------------------------------------------------------
---------后台管理员表--------------
select * from admin ;
insert into admin values('a','a',0,1);--后台管理员
insert into  admin(a_name,a_password,a_role,a_status) values('yc','a',default,default);
commit;
--消息表
-------------------------------------------------------------------
insert into AdminToUserMessage(u_id,atum_time,atum_content,atum_status) values(1,to_date('2013/7/28','yyyy/MM/dd'),'请的借款期限快到了，请及时还款',1);
insert into AdminToUserMessage(u_id,atum_time,atum_content,atum_status) values(2,to_date('2013/7/28','yyyy/MM/dd'),'请的借款期限快到了，请及时还款',0);
insert into AdminToUserMessage(u_id,atum_time,atum_content,atum_status) values(3,to_date('2013/7/28','yyyy/MM/dd'),'请的借款期限快到了，请及时还款',1);
insert into AdminToUserMessage(u_id,atum_time,atum_content,atum_status) values(4,to_date('2013/7/28','yyyy/MM/dd'),'请的借款期限快到了，请及时还款',0);
-------------------------------------------------------------------
--个人资料表        --通过身份证或者 sex，age，birthday,居住地
insert into UserMessage(u_id,um_reallyName,um_idCard,um_nowPlace,um_workinfo,um_incomeinfo,um_image) values(1,'黄凌翔',439004199611206214,'湖南省岳阳市汨罗市','yc带头人','8000',default);  
commit;
--------------------------------------------------------------------
--银行卡信息表
insert into AdminToUserMessage(bi_name,bi_idCard,u_id,bi_status) values('zsc','3114433543655634643',1,1);
insert into AdminToUserMessage(bi_name,bi_idCard,u_id,bi_status) values('zzz','1123438568050350545',2,1);
insert into AdminToUserMessage(bi_name,bi_idCard,u_id,bi_status) values('hlx','2193050425309043058',3,0);
insert into AdminToUserMessage(bi_name,bi_idCard,u_id,bi_status) values('zzc','3239450455430545454',4,0);
--------------------------------------------------------------------






