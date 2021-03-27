ck20=importdata('����Ƶ��240kHz_����ٶ�20kmperh_�ο��ź�.txt');jc20=importdata('����Ƶ��240kHz_����ٶ�20kmperh_����ź�.txt');

%��ͨ�˲� �õ�©���ź�
jc20_1=filter(Hd4k,jc20);jc20_1=jc20_1(2000:end);figure;plot(jc20_1);title('10kHz 10Vpp 50V 20km/h')

%��ͨ�˲� �������
carrier=ck20;data=jc20;
l=length(data);%���ݳ��ȣ������ͼ���źų�����ͬ��
fs=240000;%����Ƶ��
fc=10000;%����Ƶ��
Ts=fs/fc;%�ź�һ�����ڲɼ����ٸ���
Qs=round(Ts/4);%1/4���ڶ��ٵ�
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
I1=data1.*carrier1;%����cos��wt��,I·�ź�
Q1=data1.*carrier1_90;%����sin��wt����Q·�ź�
I20=filter(Hd2k,I1);
Q20=filter(Hd2k,Q1);
I20=I20(4000:end);I20=I20-mean(I20);
Q20=Q20(4000:end);Q20=Q20-mean(Q20);
figure;
subplot(2,1,1)
plot(I20)
title('20km/h')
ylabel('I·�ź�');
grid on
subplot(2,1,2)
plot(Q20)
ylabel('Q·�ź�')
grid on
l1=length(I20);
for i=1:1:l1
    A20(i)=sqrt(I20(i)*I20(i)+Q20(i)*Q20(i));%��ֵA
    P20(i)=atan(Q20(i)/I20(i))*180/pi;%��λ��
end
figure;plot(A20);
title('10kHz 10Vpp 50V 20km/h')
ylabel('��ֵ/V')