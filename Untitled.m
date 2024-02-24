clear, clear all, close all

N = 1; %���� ���� ���� 1������ ������ ��´�. 
Fc = 640; %�Ƴ��α� ��ȣ�� �ֱ� 

t = ((-1*N*Fc) : (N*Fc)) / Fc; %x�� ����
Analog_signal = cos(2*pi*t); %t�� ���� cos�Լ�

figure(1); %���ο� �ǱԾ�(ȭ��) ǥ��
plot(t, Analog_signal); %x���� ���� �׿� �����ϴ� ��ȣ���� ǥ��
set(gca, 'ylim', [-1.2 1.2]); %y���� ���� ����

hold on; %�� �׷����� ���� �׷����� ���� ��Ÿ���ֱ�. 

Ns = 16; 
Fs = Fc / Ns; 
index = 1; %index ���� ���� �� 1�� �ʱ�ȭ 
for i = 1:Fs:length(t) %1���� x���� Fs �������� t�� ���̱���
    n(index) = t(i); %�迭 t�κ��� x���� ���� ������ ����
    Sampled_Signal(index) = Analog_signal(i); %�迭 Analog_signal�κ��� �ش� ��ġ ���� ������ ����
    index = index + 1; %index �� 1 ���� 
end
stem(n, Sampled_Signal, 'r'); %������� ������ ������ ���
title('Sampled signal(period 16)');

hold off;



N = 1; 
Fc = 640; 

t = ((-1*N*Fc) : (N*Fc)) / Fc; 
Analog_signal = cos(2*pi*t); 

figure(2); 
plot(t,Analog_signal); 
set(gca, 'ylim', [-1.2 1.2]);

hold on;

Ns1 = 3*pi;
Fs = Fc / Ns1;
index  = 1;
for i= 1:round(Fs):length(t)
    n1(index) = t(i);
    Sampled_Signal1(index) = Analog_signal(i);
    index = index + 1;
end 
figure(2);
stem(n1,Sampled_Signal1,'r');
title('(Sampled signal(period 3pi)');

hold off;