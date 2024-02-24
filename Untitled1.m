clc; clear all; close all;
N = 1; 
Fc = 500; 
t = ((-1*N*Fc) : (N*Fc)) / Fc; 
 
Analog_signal = 2*sin(4*pi*t); 
figure(1), subplot(3,1,1),plot(t,Analog_signal); %figure1에는 3칸 중 첫번 째 칸에 크기 1로 표시
title('original continous signal');
set(gca, 'ylim', [-2 2]);
 


Ns = 50;
Fs = Fc/Ns;
index = 1;
 
for i= 1:Fs:length(t)
    n(index) = t(i);
    Sampled_Signal(index) = Analog_signal(i);
    index = index + 1;
end
 
figure(1),subplot(3,1,2),plot(t,Analog_signal);
title('periodic sampled signal');
hold on;
stem(n,Sampled_Signal,'r');
hold off;
 


Ns1 = 2*pi;
Fs = Fc/Ns1;
index = 1;
 
for i= 1:round(Fs):length(t)
    n1(index) = t(i);
    Sampled_Signal2(index) = Analog_signal(i);
    index = index + 1;
end
 
figure(1),subplot(3,1,3), plot(t,Analog_signal);
title('non-periodic sampled signal');
hold on;
stem(n1,Sampled_Signal2,'r-');
hold off;