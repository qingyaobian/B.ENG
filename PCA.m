clear;
clc;
load('data_BP.mat');
tic;
X=input; 
%����������һ������
[F,rate,maxlamda,maxVV]=mainfactor(X);
input = input*maxVV;
toc;
disp('���ɷַ������ϵ��  ');
disp(maxVV);
disp('���׶�');
disp(rate);

bar(rate)
hold on;
plot(rate,'-*');
xlabel('��������');
ylabel('�ۼƹ��׶�');