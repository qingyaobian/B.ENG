clear;
clc;
close all;

load('data_GA.mat');
X = (data-min(data))/(max(data)-min(data))-0.1;
locs = round(locs);

%随机生成10组初始值
for i = 1:10
    gene(i,:) = sort(randperm(length(locs),19));
end

%选择并按照目标值升序排列
tar = tarGA(X,gene,locs);
[val,pos] = sort(tar);
for i = 1:10
    temp(i,:) = gene(pos(i),:);
end
gene = temp;
best = gene(end,:);

for gen = 1:5000
    %交叉
    %生成参考序列
    gene_ref = zeros(10, 31);
    for i = 1:10
        for j = 1:19
            gene_ref(i,gene(i,j)) = 1;
        end
    end

    gene1 = zeros(10,19);
    gene1_ref = zeros(10,31);

    for i = 1:5
        temp1 = gene_ref(i,:);
        temp2 = gene_ref(i+5,:);
        temp = round(abs(temp1-temp2));
        temp0 = round(abs(temp1+temp2-temp)/2);
        k = find(temp ~= 0);
        pos = sort(randperm(length(k),round(length(k)/2)));

        gene1_ref(i,k(pos)) = 1;
        gene1_ref(i,:) = gene1_ref(i,:)+temp0;
        gene1(i,:) = find(round(gene1_ref(i,:))~=0);
        k(pos) = [];
        gene1_ref(i+5,k) = 1;
        gene1_ref(i+5,:) = gene1_ref(i+5,:)+temp0;
        gene1(i+5,:) = find(round(gene1_ref(i+5,:))~=0);
    end
    gene = [gene;gene1];

    %交叉后选择
    temp = [];
    tar = tarGA(X,gene,locs);
    [val,pos] = sort(tar);
    for i = 1:20
        temp(i,:) = gene(pos(i),:);
    end
    gene = temp;
    gene(1:10,:) = [];
    best = gene(end,:);

    %变异
    gene_ref = zeros(10, 31);
    for i = 1:10
        for j = 1:19
            gene_ref(i,gene(i,j)) = 1;
        end
    end

    gene1 = zeros(10,19);
    gene1_ref = zeros(10,31);

    for i = 1:10
        temp = gene_ref(i,:);
        pos_out = round(18*rand())+1;
        k = find(temp==0);
        pos_in = round((length(k)-1)*rand())+1;
        temp(gene(i,pos_out)) = 0;
        temp(k(pos_in)) = 0;
        gene1_ref(i,:) = temp;
        gene1(i,:) = find(gene_ref(i,:)~=0);
    end
    gene = [gene;gene1];

    %变异后选择
    temp = [];
    tar = tarGA(X,gene,locs);
    [val,pos] = sort(tar);
    for i = 1:20
        temp(i,:) = gene(pos(i),:);
    end
    gene = temp;
    gene(1:10,:) = [];
    best = gene(end,:);
end

plot(X);
hold on;
plot(locs(best),X(locs(best)),'x');