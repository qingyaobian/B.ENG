clear;
clc;

load('data_sp1tosp2.mat');

len = [];
lenQ = [];
lenM = [];
lench2 = [];
lenQch2 = [];
lenMch2 = [];

%输入为特定的一段信号
%计算每段信号的长度
for i = 1:length(data1)
    len = [len, length(data1{i})];
    data1{i} = data1{i}/(max(data1{i})-min(data1{i}));
end

for i = 1:length(dataQ1)
    lenQ = [lenQ, length(dataQ1{i})];
    dataQ1{i} = dataQ1{i}/(max(dataQ1{i})-min(dataQ1{i}));
end

for i = 1:length(dataM1)
    lenM = [lenM, length(dataM1{i})];
    dataM1{i} = dataM1{i}/(max(dataM1{i})-min(dataM1{i}));
end

for i = 1:length(data1ch2)
    lench2 = [lench2, length(data1ch2{i})];
    data1ch2{i} = data1ch2{i}/(max(data1ch2{i})-min(data1ch2{i}));
end

for i = 1:length(dataQ1ch2)
    lenQch2 = [lenQch2, length(dataQ1ch2{i})];
    dataQ1ch2{i} = dataQ1ch2{i}/(max(dataQ1ch2{i})-min(dataQ1ch2{i}));
end

for i = 1:length(dataM1ch2)
    lenMch2 = [lenMch2, length(dataM1ch2{i})];
    dataM1ch2{i} = dataM1ch2{i}/(max(dataM1ch2{i})-min(dataM1ch2{i}));
end

%将data按等步长采样存在data2里面
for i = 1:length(data1)
    for j = 1:256
        data2{i}(j) = data1{i}(floor(length(data1{i})*j/256));
    end
end

for i = 1:length(dataQ1)
    for j = 1:256
        dataQ2{i}(j) = dataQ1{i}(floor(length(dataQ1{i})*j/256));
    end
end

for i = 1:length(dataM1)
    for j = 1:256
        dataM2{i}(j) = dataM1{i}(floor(length(dataM1{i})*j/256));
    end
end

for i = 1:length(data1ch2)
    for j = 1:256
        data2ch2{i}(j) = data1ch2{i}(floor(length(data1ch2{i})*j/256));
    end
end

for i = 1:length(dataQ1ch2)
    for j = 1:256
        dataQ2ch2{i}(j) = dataQ1ch2{i}(floor(length(dataQ1ch2{i})*j/256));
    end
end

for i = 1:length(dataM1ch2)
    for j = 1:256
        dataM2ch2{i}(j) = dataM1ch2{i}(floor(length(dataM1ch2{i})*j/256));
    end
end

%CNN的输入      
for i = 1:length(data2)
    data3{i} = reshape(data2{i},16,16);
end

for i = 1:length(dataQ2)
    dataQ3{i} = reshape(dataQ2{i},16,16);
end

for i = 1:length(dataM2)
    dataM3{i} = reshape(dataM2{i},16,16);
end

for i = 1:length(data2ch2)
    data3ch2{i} = reshape(data2ch2{i},16,16);
end

for i = 1:length(dataQ2ch2)
    dataQ3ch2{i} = reshape(dataQ2ch2{i},16,16);
end

for i = 1:length(dataM2ch2)
    dataM3ch2{i} = reshape(dataM2ch2{i},16,16);
end