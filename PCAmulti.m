clear;
clc;
close all;

load('data_CNNtoBP');
input1 = input;
load('data_BP');
input = [input,input1];

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
ylabel('�ۼƹ��׶�')