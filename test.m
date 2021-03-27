clear;
clc;
close all;

% u10{1} = importdata('D:\文件\毕设仿真\10v\激励峰值20V_采样频率10kHz_激励频率10V_原始数据.txt');
% u10{2} = importdata('D:\文件\毕设仿真\10v\激励峰值40V_采样频率10kHz_激励频率10V_原始数据.txt');
% u10{3} = importdata('D:\文件\毕设仿真\10v\激励峰值60V_采样频率10kHz_激励频率10V_原始数据.txt');
% u10{4} = importdata('D:\文件\毕设仿真\10v\激励峰值80V_采样频率10kHz_激励频率10V_原始数据.txt');
% u10{5} = importdata('D:\文件\毕设仿真\10v\激励峰值100V_采样频率10kHz_激励频率10V_原始数据.txt');
% u10{6} = importdata('D:\文件\毕设仿真\10v\激励峰值120V_采样频率10kHz_激励频率10V_原始数据.txt');
% u10{7} = importdata('D:\文件\毕设仿真\10v\激励峰值140V_采样频率10kHz_激励频率10V_原始数据.txt');
% u10{8} = importdata('D:\文件\毕设仿真\10v\激励峰值160V_采样频率10kHz_激励频率10V_原始数据.txt');
% u10{9} = importdata('D:\文件\毕设仿真\10v\激励峰值180V_采样频率10kHz_激励频率10V_原始数据.txt');
% u10{10} = importdata('D:\文件\毕设仿真\10v\激励峰值200V_采样频率10kHz_激励频率10V_原始数据.txt');
% 
% u20{1} = importdata('D:\文件\毕设仿真\20v\激励峰值20V_采样频率10kHz_激励频率10V_原始数据.txt');
% u20{2} = importdata('D:\文件\毕设仿真\20v\激励峰值40V_采样频率10kHz_激励频率10V_原始数据.txt');
% u20{3} = importdata('D:\文件\毕设仿真\20v\激励峰值60V_采样频率10kHz_激励频率10V_原始数据.txt');
% u20{4} = importdata('D:\文件\毕设仿真\20v\激励峰值80V_采样频率10kHz_激励频率10V_原始数据.txt');
% u20{5} = importdata('D:\文件\毕设仿真\20v\激励峰值100V_采样频率10kHz_激励频率10V_原始数据.txt');
% u20{6} = importdata('D:\文件\毕设仿真\20v\激励峰值120V_采样频率10kHz_激励频率10V_原始数据.txt');
% u20{7} = importdata('D:\文件\毕设仿真\20v\激励峰值140V_采样频率10kHz_激励频率10V_原始数据.txt');
% u20{8} = importdata('D:\文件\毕设仿真\20v\激励峰值160V_采样频率10kHz_激励频率10V_原始数据.txt');
% u20{9} = importdata('D:\文件\毕设仿真\20v\激励峰值180V_采样频率10kHz_激励频率10V_原始数据.txt');
% u20{10} = importdata('D:\文件\毕设仿真\20v\激励峰值200V_采样频率10kHz_激励频率10V_原始数据.txt');

load('testdata.mat');
pos = 12000;
 for k = 1:1
%     figure(k);
    for i = 1:5
        figure(i)
%         subplot(5,1,i);
        plot(u10{k}(:,i));
        xlabel('采样点'); 
        ylabel('电压/V');
        xlim([1,1000]);
        ylim([-5,5]);
        set(gcf,'position',[20,20,2000,200])
        if i<5
            tit = [num2str(k*20),'km/h ',num2str(i),'通道'];
        else
            tit = '激励';
        end
        title(tit);
    end
%     saveas(figure(k),['C:\Users\72984\OneDrive\毕业论文\图片\',num2str(3),' ',num2str(k)],'png')
 end

%   for k = 1:10
%     figure(k+10);
%     for i = 1:5
%         subplot(5,1,i);
%         plot(u20{k}(:,i));
%         xlabel('采样点');
%         ylabel('输出电压/V');
%         xlim([0,1000]);
%         ylim([-5,5]);
%         if i<5
%             tit = [num2str(k*20),'km',num2str(i),'通道'];
%         else
%             tit = '激励';
%         end
%         title(tit);
%     end
%     saveas(figure(k),['C:\Users\72984\OneDrive\毕业论文\图片\',num2str(3),' ',num2str(k+10)],'png');
%   end
 