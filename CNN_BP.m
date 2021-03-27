clc;
clear;
close all;

%���������������
load ('data_CNNtoBP'); 
tic;
%��1��2000���������
k=rand(1,19);
[m,n]=sort(k);

%�ҳ�ѵ�����ݺ�Ԥ������
input_train=input(n(1:16),:)';
output_train=output(4,n(1:16));
input_test=input(n(17:19),:)';
output_test=output(4,n(17:19));

%ѡ����������������ݹ�һ��
[inputn,inputps]=mapminmax(input_train);
[outputn,outputps]=mapminmax(output_train);


% %��ʼ������ṹ
net=newff(inputn,outputn,[5]);

net.trainParam.epochs=100;
net.trainParam.lr=0.1;
net.trainParam.goal=0.00004;

%����ѵ��
net=train(net,inputn,outputn);

%Ԥ�����ݹ�һ��
inputn_test=mapminmax('apply',input_test,inputps);
 
%����Ԥ�����
an=sim(net,inputn_test);
 
%�����������һ��
BPoutput=mapminmax('reverse',an,outputps);

%Ԥ�����
error=BPoutput-output_test;
toc;
figure(3)
bar((output_test-BPoutput)./BPoutput);
hold on;
plot((output_test-BPoutput)./BPoutput,'-*');
xlabel('���Լ��������');
ylabel('������');
errorsum=sum(abs(error));