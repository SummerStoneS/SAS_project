proc gchart data=model;
vbar var39-var49;
label var39=' 0 ：手机  2： 2G3G融合' var40='是否靓号' var41='靓号分级规则' var42='是否集团客户成员' var43='VIP类型' var44='是否本期出帐' var45='当月使用最多的IMEI号是否智能机' var46='当月使用最多的IMEI号智能机使用系统' var47='订购流量包信息' var48='主体套餐名称' var49='1：预付费；0:后付费';
run;

proc reg data=noncolin2;
model censor=var3-var38/vif collinoint;
run;

proc means data=Origin mean median min max std q1 maxdec=3;
var var3-var22;
label var3='网龄' var4='沃家庭期限' var5='合约剩余日期' var6='当月国际长途计费时长' var7='当月国内漫游主叫计费时长'
var8='当月国际漫游主叫计费时长' var9='当月3G数据流量' var10='套餐内流量' var11='当月手机上网时长(秒)' var12='合约承诺套餐金额'
var13='本月欠费金额' var14='当前可用积分' var15='本期兑换积分' var16='信用额度' var17='套外出账收入' var18='套餐外短信出账收入' var19='套餐内语音通话时长'
var20='套餐外语音通话时长' var21='ARPU差' var22='总计费时长差';
run;

proc gchart data=noncolin2;
vbar var44-var46;
label var46='主体套餐名称' var45='订购流量包信息' var44='当月使用最多的IMEI号智能机使用系统';
run;

proc sort data=origin out=sorted;
by censor;
run;

proc boxplot data=sorted(rename=(censor=State));
plot (var3-var22)*state;
label var3='网龄' var4='沃家庭期限' var5='合约剩余日期' var6='当月国际长途计费时长' var7='当月国内漫游主叫计费时长'
var8='当月国际漫游主叫计费时长' var9='当月3G数据流量' var10='套餐内流量' var11='当月手机上网时长(秒)' var12='合约承诺套餐金额'
var13='本月欠费金额' var14='当前可用积分' var15='本期兑换积分' var16='信用额度' var17='套外出账收入' var18='套餐外短信出账收入' var19='套餐内语音通话时长'
var20='套餐外语音通话时长' var21='ARPU差' var22='总计费时长差';
run;
