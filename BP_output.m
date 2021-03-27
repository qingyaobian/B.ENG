close all;
%下载输入输出数据
load ('data_PCAtoBP'); 
%从1到2000间随机排序
k=rand(1,19);
[m,n]=sort(k);

%找出训练数据和预测数据
input_train=input(n(1:16),:)';
output_train=output(:,n(1:16));
input_test=input(n(17:19),:)';
output_test=output(:,n(17:19));

%选连样本输入输出数据归一化
[inputn,inputps]=mapminmax(input_train);
[outputn,outputps]=mapminmax(output_train);


% %初始化网络结构
net=newff(inputn,outputn,[16]);

net.trainParam.epochs=100;
net.trainParam.lr=0.1;
net.trainParam.goal=0.00004;

%网络训练
net=train(net,inputn,outputn);


%预测数据归一化
inputn_test=mapminmax('apply',input_test,inputps);
 
%网络预测输出
an=sim(net,inputn_test);
 
%网络输出反归一化
BPoutput=mapminmax('reverse',an,outputps);

%预测误差
error=(BPoutput-output_test)./BPoutput;
figure(3)
bar((output_test-BPoutput)./BPoutput);
hold on;
plot((output_test-BPoutput)./BPoutput,'-*');
xlabel('测试集样本序号');
ylabel('相对误差');

errorsum=sum(abs(error));