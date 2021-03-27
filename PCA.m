clear;
clc;
load('data_BP.mat');
tic;
X=input; 
%列向量代表一个变量
[F,rate,maxlamda,maxVV]=mainfactor(X);
input = input*maxVV;
toc;
disp('主成分分析结果系数  ');
disp(maxVV);
disp('贡献度');
disp(rate);

bar(rate)
hold on;
plot(rate,'-*');
xlabel('变量个数');
ylabel('累计贡献度');