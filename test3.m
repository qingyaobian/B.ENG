clear
clc
clear all
load('v20u50.mat');
data = v20u50Ori;

for i = 1:5
    figure(i);
    plot(data(1:1000,i));
end
    