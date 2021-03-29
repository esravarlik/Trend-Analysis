clc;
clear;
excel = 'dataset2.xlsx';
year = xlsread(excel,'A:A');
sale = xlsread(excel,'B:B');
 
sale=sale'
average = 3;
simplemoving=ones(1,length(sale));

for i=1:length(sale)
    if i == 1 
        simplemoving(i) = (sale(i)+sale(i+1))/2;
    elseif i == length(sale)
        simplemoving(i) = (sale(i-1)+sale(i))/2;
    else
        simplemoving(i) = (sale(i-1)+sale(i)+sale(i+1))/average;
    end
end

x = movmean(sale,average)
if x == simplemoving
    disp('Same')
end

plot(year,sale)
hold on
xlabel('Time');
ylabel('Sale');
plot(year,simplemoving)