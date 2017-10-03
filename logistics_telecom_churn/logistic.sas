proc surveyselect data=origin out=testing samprate=0.3 Method=srs;
run;
proc sql;
create table training as
select * from origin
where ID not in (select ID from testing);
quit;
proc logistic data=training outest=param outmodel=model;
class VAR48-VAR69;
model Censor(event='1')=VAR3-VAR75 /selection=forward;

run;
proc logistic inmodel=model;
score data=testing out=predict;
run;
data pred2;
set predict;
if Censor eq 1 then f=1;
else f=0;
if P_1 ge 0.4 then i =1;
else i=0;
keep f i;
run;
proc sql;
select sum(I*F)/sum(F) as pos,
sum((1-I)*(1-F))/sum(1-F) as neg 
from pred2;
quit;
