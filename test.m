clear;
clc;
close all;

% u10{1} = importdata('D:\�ļ�\�������\10v\������ֵ20V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u10{2} = importdata('D:\�ļ�\�������\10v\������ֵ40V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u10{3} = importdata('D:\�ļ�\�������\10v\������ֵ60V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u10{4} = importdata('D:\�ļ�\�������\10v\������ֵ80V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u10{5} = importdata('D:\�ļ�\�������\10v\������ֵ100V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u10{6} = importdata('D:\�ļ�\�������\10v\������ֵ120V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u10{7} = importdata('D:\�ļ�\�������\10v\������ֵ140V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u10{8} = importdata('D:\�ļ�\�������\10v\������ֵ160V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u10{9} = importdata('D:\�ļ�\�������\10v\������ֵ180V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u10{10} = importdata('D:\�ļ�\�������\10v\������ֵ200V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% 
% u20{1} = importdata('D:\�ļ�\�������\20v\������ֵ20V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u20{2} = importdata('D:\�ļ�\�������\20v\������ֵ40V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u20{3} = importdata('D:\�ļ�\�������\20v\������ֵ60V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u20{4} = importdata('D:\�ļ�\�������\20v\������ֵ80V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u20{5} = importdata('D:\�ļ�\�������\20v\������ֵ100V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u20{6} = importdata('D:\�ļ�\�������\20v\������ֵ120V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u20{7} = importdata('D:\�ļ�\�������\20v\������ֵ140V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u20{8} = importdata('D:\�ļ�\�������\20v\������ֵ160V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u20{9} = importdata('D:\�ļ�\�������\20v\������ֵ180V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');
% u20{10} = importdata('D:\�ļ�\�������\20v\������ֵ200V_����Ƶ��10kHz_����Ƶ��10V_ԭʼ����.txt');

load('testdata.mat');
pos = 12000;
 for k = 1:1
%     figure(k);
    for i = 1:5
        figure(i)
%         subplot(5,1,i);
        plot(u10{k}(:,i));
        xlabel('������'); 
        ylabel('��ѹ/V');
        xlim([1,1000]);
        ylim([-5,5]);
        set(gcf,'position',[20,20,2000,200])
        if i<5
            tit = [num2str(k*20),'km/h ',num2str(i),'ͨ��'];
        else
            tit = '����';
        end
        title(tit);
    end
%     saveas(figure(k),['C:\Users\72984\OneDrive\��ҵ����\ͼƬ\',num2str(3),' ',num2str(k)],'png')
 end

%   for k = 1:10
%     figure(k+10);
%     for i = 1:5
%         subplot(5,1,i);
%         plot(u20{k}(:,i));
%         xlabel('������');
%         ylabel('�����ѹ/V');
%         xlim([0,1000]);
%         ylim([-5,5]);
%         if i<5
%             tit = [num2str(k*20),'km',num2str(i),'ͨ��'];
%         else
%             tit = '����';
%         end
%         title(tit);
%     end
%     saveas(figure(k),['C:\Users\72984\OneDrive\��ҵ����\ͼƬ\',num2str(3),' ',num2str(k+10)],'png');
%   end
 