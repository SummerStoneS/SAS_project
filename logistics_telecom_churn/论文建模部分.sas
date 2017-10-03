proc surveyselect data=origin out=testing samprate=0.5 Method=srs;
run;                                                                    *���� testing �ǲ��Լ�;

proc sql;
create table training as
select * from origin
where ID not in (select ID from testing);
quit;                                          *training��ѵ����;

proc logistic data=training outest=param outmodel=model;
class VAR24-VAR31 (param=ref ref=first);
model state(event='1')=VAR3-VAR31/selection=forward influence ctable lackfit rsquare;
label var3='����' var4='�ּ�ͥ����' var5='��Լʣ������' var6='���¹��ʳ�;�Ʒ�ʱ��' var7='���¹����������мƷ�ʱ��'
var8='���¹����������мƷ�ʱ��' var9='����3G��������' var10='�ײ�������' var11='�����ֻ�����ʱ��(��)' var12='��Լ��ŵ�ײͽ��'
var13='����Ƿ�ѽ��' var14='��ǰ���û���' var15='���ڶһ�����' var16='���ö��' var17='�����������' var18='�ײ�����ų�������' var19='�ײ�������ͨ��ʱ��'
var20='�ײ�������ͨ��ʱ��' var21='�Ƿ��ڳ���'var22='ARPU��' var23='�ܼƷ�ʱ����' var24=' 0 ���ֻ�  2�� 2G3G�ں�' var25='�Ƿ��ſͻ���Ա' var26='VIP����' var27='����ʹ������IMEI���Ƿ����ܻ�'
var28='����ʹ������IMEI�����ܻ�ʹ��ϵͳ' var29='������������Ϣ' var30='�����ײ�����' var31='1��Ԥ���ѣ�0:�󸶷�';
run;

ods graphics on;
proc logistic data=training plots(only)=roc;
class VAR24-VAR31;
model state(event='1')=VAR3-VAR31/selection=forward;
run;
ods graphics off;


*����logistic;
proc logistic data=training outest=param outmodel=model;
by var30;
class VAR24-VAR31 (param=ref ref=first);
model state(event='1')=VAR3-VAR31/selection=forward influence ctable lackfit rsquare;
label var3='����' var4='�ּ�ͥ����' var5='��Լʣ������' var6='���¹��ʳ�;�Ʒ�ʱ��' var7='���¹����������мƷ�ʱ��'
var8='���¹����������мƷ�ʱ��' var9='����3G��������' var10='�ײ�������' var11='�����ֻ�����ʱ��(��)' var12='��Լ��ŵ�ײͽ��'
var13='����Ƿ�ѽ��' var14='��ǰ���û���' var15='���ڶһ�����' var16='���ö��' var17='�����������' var18='�ײ�����ų�������' var19='�ײ�������ͨ��ʱ��'
var20='�ײ�������ͨ��ʱ��' var21='�Ƿ��ڳ���'var22='ARPU��' var23='�ܼƷ�ʱ����' var24=' 0 ���ֻ�  2�� 2G3G�ں�' var25='�Ƿ��ſͻ���Ա' var26='VIP����' var27='����ʹ������IMEI���Ƿ����ܻ�'
var28='����ʹ������IMEI�����ܻ�ʹ��ϵͳ' var29='������������Ϣ' var30='�����ײ�����' var31='1��Ԥ���ѣ�0:�󸶷�';
run;

ods graphics on;
proc logistic data=training plots(only)=roc;
class VAR24-VAR31;
model state(event='1')=VAR3-VAR31/selection=forward;
run;
ods graphics off;



