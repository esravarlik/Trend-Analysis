clc;
clear;
excel = 'SAMSUN17030.xlsx';
year = xlsread(excel,'B:B');
month = xlsread(excel,'C:C');
day = xlsread(excel,'D:D');
value = xlsread(excel,'E:E');

[m,n]=size(value);
A(:,1)=mjuliandate(year,month,day);
y = value;
x = A(:,1);
xs = mean(x);
ys = mean(y);

xx = x - xs;
yy = y - ys;

cx = sqrt(xx'*xx)/500;
cy = sqrt(yy'*yy)/500;

xxx = xx/cx;
yyy = yy/cy;

Anew(:,1) = xxx;
Anew(:,2) = 1;
ynew = yyy;
regression = (inv(Anew'*Anew))*(Anew'*ynew);

a1 = regression(1);
a0 = regression(2);

ymodel = (a0 + a1*Anew(:,1)) ;

plot(A(:,1),value,'r');
hold on
plot(A(:,1),ymodel);

V = Anew*regression - value;

Qxx=inv(Anew'*Anew);
u = 2;
m0=sqrt((V'*V)/(m-u));

ma1=m0*sqrt(Qxx(1,1));
ma0=m0*sqrt(Qxx(2,2));

Ta0=(abs(a0))/(ma0);
Ta1=(abs(a1))/(ma1);
T = [Ta0;Ta1];
F = m - u;
S = tinv(1-(0.05),F);
if T< S
    disp('regression parameters are meaningful')
else T> S
    disp('regression parameters are meaningless')
end
