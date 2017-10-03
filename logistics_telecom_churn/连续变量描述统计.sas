proc reg data=noncolin2;       *共线性;
model censor=var3-var38/vif collinoint;
run;
proc univariate data=Origin;   *var24 分组直方图;
	class state;
	histogram ;
	var var24;
	label var24=' 0 ：手机  2： 2G3G融合';
run;

proc univariate data=Origin;	 *var25;
	class state;
	histogram ;
	var var25;
	label var25='是否集团客户成员';
run;

proc univariate data=Origin;   *var27;
	class state;
	histogram ;
	var var27;
	label var27='当月使用最多的IMEI号是否智能机';
run;
proc univariate data=Origin;   *var31;
	class state;
	histogram ;
	var var31;
	label var31='1：预付费；0:后付费';
run;

proc sort data=origin out=sorted;  *名义变量直方图;
by state;
run;
proc gchart data=sorted;
by state;
vbar var26 var28-var30;
label var26='VIP类型' var28='当月使用最多的IMEI号智能机使用系统' var29='订购流量包信息' var30='主体套餐名称';
run;

proc univariate data=taocanfei;   *套餐费;
	class state;
	histogram ;
	var var32;
	label var32='套餐费';
run;

proc sort data=Originv2 out=sortedv2;
by state;
run;
proc gchart data=sortedv2;
by state;
vbar var26 ;
label var26='VIP类型';
run;



proc means data=Origin mean median min max std q1 maxdec=3;
var var21;
label var21='是否本期出帐';
run;

proc boxplot data=sorted;
plot var21*state;
label var21='是否本期出帐';
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
