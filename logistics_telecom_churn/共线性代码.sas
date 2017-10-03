data delete10;
set origin;
drop var10;
proc print;
run;
proc reg data=origin;
model censor=var3-var7 var9-var16 var19 var20 var22-var32 var34-var39/vif collinoint;
run;

