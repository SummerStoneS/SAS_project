proc reg data=noncolin2;       *������;
model censor=var3-var38/vif collinoint;
run;
proc univariate data=Origin;   *var24 ����ֱ��ͼ;
	class state;
	histogram ;
	var var24;
	label var24=' 0 ���ֻ�  2�� 2G3G�ں�';
run;

proc univariate data=Origin;	 *var25;
	class state;
	histogram ;
	var var25;
	label var25='�Ƿ��ſͻ���Ա';
run;

proc univariate data=Origin;   *var27;
	class state;
	histogram ;
	var var27;
	label var27='����ʹ������IMEI���Ƿ����ܻ�';
run;
proc univariate data=Origin;   *var31;
	class state;
	histogram ;
	var var31;
	label var31='1��Ԥ���ѣ�0:�󸶷�';
run;

proc sort data=origin out=sorted;  *�������ֱ��ͼ;
by state;
run;
proc gchart data=sorted;
by state;
vbar var26 var28-var30;
label var26='VIP����' var28='����ʹ������IMEI�����ܻ�ʹ��ϵͳ' var29='������������Ϣ' var30='�����ײ�����';
run;

proc univariate data=taocanfei;   *�ײͷ�;
	class state;
	histogram ;
	var var32;
	label var32='�ײͷ�';
run;

proc sort data=Originv2 out=sortedv2;
by state;
run;
proc gchart data=sortedv2;
by state;
vbar var26 ;
label var26='VIP����';
run;



proc means data=Origin mean median min max std q1 maxdec=3;
var var21;
label var21='�Ƿ��ڳ���';
run;

proc boxplot data=sorted;
plot var21*state;
label var21='�Ƿ��ڳ���';
run;

proc means data=Origin mean median min max std q1 maxdec=3;
var var3-var22;
label var3='����' var4='�ּ�ͥ����' var5='��Լʣ������' var6='���¹��ʳ�;�Ʒ�ʱ��' var7='���¹����������мƷ�ʱ��'
var8='���¹����������мƷ�ʱ��' var9='����3G��������' var10='�ײ�������' var11='�����ֻ�����ʱ��(��)' var12='��Լ��ŵ�ײͽ��'
var13='����Ƿ�ѽ��' var14='��ǰ���û���' var15='���ڶһ�����' var16='���ö��' var17='�����������' var18='�ײ�����ų�������' var19='�ײ�������ͨ��ʱ��'
var20='�ײ�������ͨ��ʱ��' var21='ARPU��' var22='�ܼƷ�ʱ����';
run;

proc gchart data=noncolin2;
vbar var44-var46;
label var46='�����ײ�����' var45='������������Ϣ' var44='����ʹ������IMEI�����ܻ�ʹ��ϵͳ';
run;

proc sort data=origin out=sorted;
by censor;
run;

proc boxplot data=sorted(rename=(censor=State));
plot (var3-var22)*state;
label var3='����' var4='�ּ�ͥ����' var5='��Լʣ������' var6='���¹��ʳ�;�Ʒ�ʱ��' var7='���¹����������мƷ�ʱ��'
var8='���¹����������мƷ�ʱ��' var9='����3G��������' var10='�ײ�������' var11='�����ֻ�����ʱ��(��)' var12='��Լ��ŵ�ײͽ��'
var13='����Ƿ�ѽ��' var14='��ǰ���û���' var15='���ڶһ�����' var16='���ö��' var17='�����������' var18='�ײ�����ų�������' var19='�ײ�������ͨ��ʱ��'
var20='�ײ�������ͨ��ʱ��' var21='ARPU��' var22='�ܼƷ�ʱ����';
run;
