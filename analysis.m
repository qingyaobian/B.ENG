ck20=importdata('采样频率240kHz_检测速度20kmperh_参考信号.txt');jc20=importdata('采样频率240kHz_检测速度20kmperh_检测信号.txt');

%低通滤波 得到漏磁信号
jc20_1=filter(Hd4k,jc20);jc20_1=jc20_1(2000:end);figure;plot(jc20_1);title('10kHz 10Vpp 50V 20km/h')

%高通滤波 正交解调
carrier=ck20;data=jc20;
l=length(data);%数据长度（激励和检测信号长度相同）
fs=240000;%采样频率
fc=10000;%激励频率
Ts=fs/fc;%信号一个周期采集多少个点
Qs=round(Ts/4);%1/4周期多少点
carrier_90=zeros(l,1);
for i=1:1:Qs
    carrier_90(i)=carrier(l+i-Qs);
end
for j=1:1:l-Qs
    carrier_90(j+Qs)=carrier(j);
end
data1=filter(Ht5k,data);
carrier1=filter(Ht5k,carrier);
carrier1_90=filter(Ht5k,carrier_90);
I1=data1.*carrier1;%乘以cos（wt）,I路信号
Q1=data1.*carrier1_90;%乘以sin（wt），Q路信号
I20=filter(Hd2k,I1);
Q20=filter(Hd2k,Q1);
I20=I20(4000:end);I20=I20-mean(I20);
Q20=Q20(4000:end);Q20=Q20-mean(Q20);
figure;
subplot(2,1,1)
plot(I20)
title('20km/h')
ylabel('I路信号');
grid on
subplot(2,1,2)
plot(Q20)
ylabel('Q路信号')
grid on
l1=length(I20);
for i=1:1:l1
    A20(i)=sqrt(I20(i)*I20(i)+Q20(i)*Q20(i));%幅值A
    P20(i)=atan(Q20(i)/I20(i))*180/pi;%相位φ
end
figure;plot(A20);
title('10kHz 10Vpp 50V 20km/h')
ylabel('幅值/V')