clear;
clc;
close all;

load('v20u50.mat');

data = v20u50I(45000:118000,1);
dataQ = v20u50Q(45000:118000,1);
dataM = v20u50M(45000:118000,1);

datach2 = v20u50I(45000:118000,2);
dataQch2 = v20u50Q(45000:118000,2);
dataMch2 = v20u50M(45000:118000,2);

%阈值法生成分割的位置
t = 1:length(data);
t = t';
[pks1,locs1] = findpeaks(data(1:50000),'minpeakheight',4.92);
[pks2,locs2] = findpeaks(data(50000:end),'minpeakheight',4.94);
pks = [pks1;pks2];
locs = [locs1;locs2+50000];
for i = 1:length(locs)
    if i<=1
        pos(i) = 1;
    else
        pos(i) = floor((locs(i)+locs(i-1))/2);
    end
end

pos = pos';
pos = [pos;length(data)];

figure(1);
plot(t,data);
grid on;
xlabel('采样点个数');
ylabel('电压');
set(gcf,'position',[20,20,2000,400])

%I路分割示意图
figure(2);
plot(t,data);
grid on;
hold on;
plot(locs,pks,'*');
hold on;
plot(pos,data(pos),'x');
xlabel('采样点个数');
ylabel('电压/V');
set(gcf,'position',[20,20,2000,400])

%Q路分割示意图
figure(3)
plot(t,dataQ);
grid on;
hold on;
% plot(locs,pks,'*');
hold on;
plot(pos,dataQ(pos),'x');
xlabel('采样点个数');
ylabel('电压/V');
set(gcf,'position',[20,20,2000,400])

%M分割示意图
figure(4);
plot(t,dataM);
grid on;
hold on;
% plot(locs,pks,'*');
hold on;
plot(pos,dataM(pos),'x');
xlabel('采样点个数');
ylabel('电压/V');
set(gcf,'position',[20,20,2000,400])

%将数据进行切片
for i = 1:(length(pos)-1)
    data1{i} = data(pos(i):pos(i+1))';
end

for i = 1:(length(pos)-1)
    dataQ1{i} = dataQ(pos(i):pos(i+1))';
end

for i = 1:(length(pos)-1)
    dataM1{i} = dataM(pos(i):pos(i+1))';
end

for i = 1:(length(pos)-1)
    data1ch2{i} = datach2(pos(i):pos(i+1))';
end

for i = 1:(length(pos)-1)
    dataQ1ch2{i} = dataQch2(pos(i):pos(i+1))';
end

for i = 1:(length(pos)-1)
    dataM1ch2{i} = dataMch2(pos(i):pos(i+1))';
end

%data1是切割好的数据集
figure(5);
plot(data1{3});
figure(6);
plot(dataQ1{3});
figure(7);
plot(dataM1{3});

%将数据进行特征提取
for i = 1:length(data1)
    data1{i} = data1{i}-min(data1{i});
    input(i,1) = length(data1{i});
    input(i,2) = max(data1{i})-min(data1{i});
    input(i,3) = sqrt(sum(data1{i}.^2)/length(data1{i}));
    
    dataQ1{i} = dataQ1{i}-min(dataQ1{i});
    input(i,4) = length(dataQ1{i});
    input(i,5) = max(dataQ1{i})-min(dataQ1{i});
    input(i,6) = sqrt(sum(dataQ1{i}.^2)/length(dataQ1{i}));
    
    dataM1{i} = dataM1{i}-min(dataM1{i});
    input(i,7) = length(dataM1{i});
    input(i,8) = max(dataM1{i})-min(dataM1{i});
    input(i,9) = sqrt(sum(dataM1{i}.^2)/length(dataM1{i}));
    
    data1ch2{i} = data1ch2{i}-min(data1ch2{i});
    input(i,10) = length(data1ch2{i});
    input(i,11) = max(data1ch2{i})-min(data1ch2{i});
    input(i,12) = sqrt(sum(data1ch2{i}.^2)/length(data1ch2{i}));
    
    dataQ1ch2{i} = dataQ1ch2{i}-min(dataQ1ch2{i});
    input(i,13) = length(dataQ1ch2{i});
    input(i,14) = max(dataQ1ch2{i})-min(dataQ1ch2{i});
    input(i,15) = sqrt(sum(dataQ1ch2{i}.^2)/length(dataQ1ch2{i}));
    
    dataM1ch2{i} = dataM1ch2{i}-min(dataM1ch2{i});
    input(i,16) = length(dataM1ch2{i});
    input(i,17) = max(dataM1ch2{i})-min(dataM1ch2{i});
    input(i,18) = sqrt(sum(dataM1ch2{i}.^2)/length(dataM1ch2{i}));
end

figure(8);
plot(dataQ);
xlabel('采样点个数');
ylabel('电压/V');
grid on;
set(gcf,'position',[20,20,2000,400])

figure(9);
plot(dataM);
xlabel('采样点个数');
ylabel('电压/V');
grid on;
set(gcf,'position',[20,20,2000,400])

output = [4	4 4 4 2 6 8 4 4 4 4 4 4 4 4 4 4 4 4;...
          0.2 0.6 0.8 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4;...
          90 90	90 90 90 90	90 90 90 90	90 75 60 45	30 60 60 45 45;...
          90 90	90 90 90 90	90 75 60 45	30 90 90 90	90 60 45 45 60];