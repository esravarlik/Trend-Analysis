clc;
clear;
% 1960-2016 Dataset 
excel = 'SAMSUN17030.xlsx';
year = xlsread(excel,'B:B');
month = xlsread(excel,'C:C');
day = xlsread(excel,'D:D');
value = xlsread(excel,'E:E');

sizevalue = size(value);
jd = juliandate([year,month,day]);

ort = (sizevalue(1) - 1)/2;
x1ort = mean(value(1:ort));
x2ort = mean(value(ort:end));

orttime = (length(jd));
orttime1 = jd(fix(orttime/4));
orttime2 = jd(fix(3*orttime/4));
XX=[orttime1;orttime2];
YY=[x1ort;x2ort]; 

figure
plot(jd,value,'r');
hold on
plot(XX,YY)

legend('Original Data');
xlabel('Time');
ylabel('Sunbathing Data')