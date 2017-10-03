proc gchart data=model;
vbar var39-var49;
label var39=' 0 ���ֻ�  2�� 2G3G�ں�' var40='�Ƿ�����' var41='���ŷּ�����' var42='�Ƿ��ſͻ���Ա' var43='VIP����' var44='�Ƿ��ڳ���' var45='����ʹ������IMEI���Ƿ����ܻ�' var46='����ʹ������IMEI�����ܻ�ʹ��ϵͳ' var47='������������Ϣ' var48='�����ײ�����' var49='1��Ԥ���ѣ�0:�󸶷�';
run;

proc reg data=noncolin2;
model censor=var3-var38/vif collinoint;
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
