proc surveyselect data=origin out=testing samprate=0.5 Method=srs;
run;                                                                    *抽样 testing 是测试集;

proc sql;
create table training as
select * from origin
where ID not in (select ID from testing);
quit;                                          *training是训练集;

proc logistic data=training outest=param outmodel=model;
class VAR24-VAR31 (param=ref ref=first);
model state(event='1')=VAR3-VAR31/selection=forward influence ctable lackfit rsquare;
label var3='网龄' var4='沃家庭期限' var5='合约剩余日期' var6='当月国际长途计费时长' var7='当月国内漫游主叫计费时长'
var8='当月国际漫游主叫计费时长' var9='当月3G数据流量' var10='套餐内流量' var11='当月手机上网时长(秒)' var12='合约承诺套餐金额'
var13='本月欠费金额' var14='当前可用积分' var15='本期兑换积分' var16='信用额度' var17='套外出账收入' var18='套餐外短信出账收入' var19='套餐内语音通话时长'
var20='套餐外语音通话时长' var21='是否本期出账'var22='ARPU差' var23='总计费时长差' var24=' 0 ：手机  2： 2G3G融合' var25='是否集团客户成员' var26='VIP类型' var27='当月使用最多的IMEI号是否智能机'
var28='当月使用最多的IMEI号智能机使用系统' var29='订购流量包信息' var30='主体套餐名称' var31='1：预付费；0:后付费';
run;

ods graphics on;
proc logistic data=training plots(only)=roc;
class VAR24-VAR31;
model state(event='1')=VAR3-VAR31/selection=forward;
run;
ods graphics off;


*分组logistic;
proc logistic data=training outest=param outmodel=model;
by var30;
class VAR24-VAR31 (param=ref ref=first);
model state(event='1')=VAR3-VAR31/selection=forward influence ctable lackfit rsquare;
label var3='网龄' var4='沃家庭期限' var5='合约剩余日期' var6='当月国际长途计费时长' var7='当月国内漫游主叫计费时长'
var8='当月国际漫游主叫计费时长' var9='当月3G数据流量' var10='套餐内流量' var11='当月手机上网时长(秒)' var12='合约承诺套餐金额'
var13='本月欠费金额' var14='当前可用积分' var15='本期兑换积分' var16='信用额度' var17='套外出账收入' var18='套餐外短信出账收入' var19='套餐内语音通话时长'
var20='套餐外语音通话时长' var21='是否本期出账'var22='ARPU差' var23='总计费时长差' var24=' 0 ：手机  2： 2G3G融合' var25='是否集团客户成员' var26='VIP类型' var27='当月使用最多的IMEI号是否智能机'
var28='当月使用最多的IMEI号智能机使用系统' var29='订购流量包信息' var30='主体套餐名称' var31='1：预付费；0:后付费';
run;

ods graphics on;
proc logistic data=training plots(only)=roc;
class VAR24-VAR31;
model state(event='1')=VAR3-VAR31/selection=forward;
run;
ods graphics off;



