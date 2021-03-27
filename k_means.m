clear;
clc;
close all;

load ('data_tocarve.mat');
X1 = (data-min(data))/(max(data)-min(data));
X = X1;
figure(1)
plot(X);
hold on;
sigma=sqrt(var(X));

X = smooth(X,3000);
X = Gaussianfilter(4,sigma,X')';
X = smooth(X,1000);
[~,locs] = findpeaks(-X);
figure(2)
plot(X1);
hold on;
% plot(locs,data(locs),'x');
plot(X);
grid on;
xlabel('采样点数');
ylabel('电压/V');
set(gcf,'position',[20,20,2000,400])



