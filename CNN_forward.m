clear;
clc;
close all;

load('data_toCNN.mat');
tic;
%卷积核为锐化卷积核
kernel = [0 -1 0;-1 5 -1;0 -1 0];

%CNN前馈部分
for gen = 1:3
    for i = 1:length(data3)
        data3{i} = conv2(data3{i},kernel,'same');
        
        [m,n] = size(data3{i});
        a = 2*ones(1,round(m/2));
        temp = mat2cell(data3{i},a,a);
        for j = 1:round(m/2)
            for k = 1:round(m/2)
                temp1(j,k) = max(max(temp{j,k}));
            end
        end
        data3{i} = temp1;
        data3{i} = max(data3{i},0);
        temp1 = [];
    end
end

for gen = 1:3
    for i = 1:length(dataQ3)
        dataQ3{i} = conv2(dataQ3{i},kernel,'same');
        
        [m,n] = size(dataQ3{i});
        a = 2*ones(1,round(m/2));
        temp = mat2cell(dataQ3{i},a,a);
        for j = 1:round(m/2)
            for k = 1:round(m/2)
                temp1(j,k) = max(max(temp{j,k}));
            end
        end
        dataQ3{i} = temp1;
        dataQ3{i} = max(dataQ3{i},0);
        temp1 = [];
    end
end

for gen = 1:3
    for i = 1:length(dataM3)
        dataM3{i} = conv2(dataM3{i},kernel,'same');
        
        [m,n] = size(dataM3{i});
        a = 2*ones(1,round(m/2));
        temp = mat2cell(dataM3{i},a,a);
        for j = 1:round(m/2)
            for k = 1:round(m/2)
                temp1(j,k) = max(max(temp{j,k}));
            end
        end
        dataM3{i} = temp1;
        dataM3{i} = max(dataM3{i},0);
        temp1 = [];
    end
end

for gen = 1:3
    for i = 1:length(data3ch2)
        data3ch2{i} = conv2(data3ch2{i},kernel,'same');
        
        [m,n] = size(data3ch2{i});
        a = 2*ones(1,round(m/2));
        temp = mat2cell(data3ch2{i},a,a);
        for j = 1:round(m/2)
            for k = 1:round(m/2)
                temp1(j,k) = max(max(temp{j,k}));
            end
        end
        data3ch2{i} = temp1;
        data3ch2{i} = max(data3ch2{i},0);
        temp1 = [];
    end
end

for gen = 1:3
    for i = 1:length(dataQ3ch2)
        dataQ3ch2{i} = conv2(dataQ3ch2{i},kernel,'same');
        
        [m,n] = size(dataQ3ch2{i});
        a = 2*ones(1,round(m/2));
        temp = mat2cell(dataQ3ch2{i},a,a);
        for j = 1:round(m/2)
            for k = 1:round(m/2)
                temp1(j,k) = max(max(temp{j,k}));
            end
        end
        dataQ3ch2{i} = temp1;
        dataQ3ch2{i} = max(dataQ3ch2{i},0);
        temp1 = [];
    end
end

for gen = 1:3
    for i = 1:length(dataM3ch2)
        dataM3ch2{i} = conv2(dataM3ch2{i},kernel,'same');
        
        [m,n] = size(dataM3ch2{i});
        a = 2*ones(1,round(m/2));
        temp = mat2cell(dataM3ch2{i},a,a);
        for j = 1:round(m/2)
            for k = 1:round(m/2)
                temp1(j,k) = max(max(temp{j,k}));
            end
        end
        dataM3ch2{i} = temp1;
        dataM3ch2{i} = max(dataM3ch2{i},0);
        temp1 = [];
    end
end

data4 = [];
for i = 1:length(data3)
    data4 = [data4;reshape(data3{i},1,4)];
end

dataQ4 = [];
for i = 1:length(dataQ3)
    dataQ4 = [dataQ4;reshape(dataQ3{i},1,4)];
end

dataM4 = [];
for i = 1:length(dataM3)
    dataM4 = [dataM4;reshape(dataM3{i},1,4)];
end

data4ch2 = [];
for i = 1:length(data3ch2)
    data4ch2 = [data4ch2;reshape(data3ch2{i},1,4)];
end

dataQ4ch2 = [];
for i = 1:length(dataQ3ch2)
    dataQ4ch2 = [dataQ4ch2;reshape(dataQ3ch2{i},1,4)];
end

dataM4ch2 = [];
for i = 1:length(dataM3ch2)
    dataM4ch2 = [dataM4ch2;reshape(dataM3ch2{i},1,4)];
end
%CNN反向传播的部分的输入
data4 = [data4,len'];
dataQ4 = [dataQ4,lenQ'];
dataM4 = [dataM4,lenM'];
data4ch2 = [data4ch2,lench2'];
dataQ4ch2 = [dataQ4ch2,lenQch2'];
dataM4ch2 = [dataM4ch2,lenMch2'];
toc;
input = [data4,dataQ4,dataM4,data4ch2,dataQ4ch2,dataM4ch2];
output = [4	4 4 4 2 6 8 4 4 4 4 4 4 4 4 4 4 4 4;...
          0.2 0.6 0.8 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4;...
          90 90	90 90 90 90	90 90 90 90	90 75 60 45	30 60 60 45 45;...
          90 90	90 90 90 90	90 75 60 45	30 90 90 90	90 60 45 45 60];