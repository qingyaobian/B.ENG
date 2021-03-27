clc;
clear;
close all
nntwarn off;

%% 载入数据
load ('data_GRNN');
p = input;

for i = 1:4
    t(i,:) = (output(i,:)-min(output(i,:)))/(max(output(i,:))-min(output(i,:)));
end
t = t';
% 载入数据并将数据分成训练和预测两类
p_train=p(4:19,:);
t_train=t(4:19,4);
p_test=p(1:3,:);
t_test=t(1:3,4);
%% 交叉验证
desired_spread=[];
mse_max=10e20;
desired_input=[];
desired_output=[];
result_perfp=[];
[m,~] = size(p_train);
indices = crossvalind('Kfold',m,4);
h=waitbar(0,'正在寻找最优化参数....');
k=1;
for i = 1:4
    perfp=[];
    disp(['以下为第',num2str(i),'次交叉验证结果'])
    test = (indices == i); train = ~test;
    p_cv_train=p_train(train,:);
    t_cv_train=t_train(train,:);
    p_cv_test=p_train(test,:);
    t_cv_test=t_train(test,:);
    p_cv_train=p_cv_train';
    t_cv_train=t_cv_train';
    p_cv_test= p_cv_test';
    t_cv_test= t_cv_test';
    [p_cv_train,minp,maxp,t_cv_train,mint,maxt]=premnmx(p_cv_train,t_cv_train);
    p_cv_test=tramnmx(p_cv_test,minp,maxp);
    for spread=0.1:0.1:2;
        net=newgrnn(p_cv_train,t_cv_train,spread);
        waitbar(k/80,h);
        disp(['当前spread值为', num2str(spread)]);
        test_Out=sim(net,p_cv_test);
        test_Out=postmnmx(test_Out,mint,maxt);
        error=t_cv_test-test_Out;
        disp(['当前网络的mse为',num2str(mse(error))])
        perfp=[perfp mse(error)];
        if mse(error)<mse_max
            mse_max=mse(error);
            desired_spread=spread;
            desired_input=p_cv_train;
            desired_output=t_cv_train;
        end
        k=k+1;
    end
    result_perfp(i,:)=perfp;
end;
close(h)
% disp(['最佳spread值为',num2str(desired_spread)])
% disp(['此时最佳输入值为'])
% desired_input;
% disp(['此时最佳输出值为']);
% desired_output;
%% 采用最佳方法建立GRNN网络
tic;
net=newgrnn(desired_input,desired_output,desired_spread);
p_test=p_test';
p_test=tramnmx(p_test,minp,maxp);
grnn_prediction_result=sim(net,p_test);
grnn_prediction_result=postmnmx(grnn_prediction_result,mint,maxt);
grnn_error=t_test-grnn_prediction_result';
toc;
save best desired_input desired_output p_test t_test grnn_error mint maxt

figure(1);
bar(grnn_error(:,1));
hold on;
plot(grnn_error(:,1),'-*');
xlabel('测试集样本序号');
ylabel('相对误差');
% figure(2);
% bar(grnn_error(:,2));
% hold on;
% plot(grnn_error(:,2),'-*');
% xlabel('测试集样本序号');
% ylabel('相对误差');
% figure(3);
% bar(grnn_error(:,3));
% hold on;
% plot(grnn_error(:,3),'-*');
% xlabel('测试集样本序号');
% ylabel('相对误差');
% figure(4);
% bar(grnn_error(:,4));
% hold on;
% plot(grnn_error(:,4),'-*');
% xlabel('测试集样本序号');
% ylabel('相对误差');