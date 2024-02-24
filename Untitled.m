clear, clear all, close all

N = 1; %원점 기준 양쪽 1씩으로 범위를 잡는다. 
Fc = 640; %아날로그 신호의 주기 

t = ((-1*N*Fc) : (N*Fc)) / Fc; %x축 범위
Analog_signal = cos(2*pi*t); %t에 대한 cos함수

figure(1); %새로운 피규어(화면) 표시
plot(t, Analog_signal); %x축의 값과 그에 대응하는 신호값을 표시
set(gca, 'ylim', [-1.2 1.2]); %y축의 범위 설정

hold on; %이 그래프와 밑의 그래프를 같이 나타내주기. 

Ns = 16; 
Fs = Fc / Ns; 
index = 1; %index 변수 생성 후 1로 초기화 
for i = 1:Fs:length(t) %1부터 x축의 Fs 간격으로 t의 길이까지
    n(index) = t(i); %배열 t로부터 x축의 값을 가져와 저장
    Sampled_Signal(index) = Analog_signal(i); %배열 Analog_signal로부터 해당 위치 값을 가져와 저장
    index = index + 1; %index 값 1 증가 
end
stem(n, Sampled_Signal, 'r'); %결과물을 빨간색 선으로 출력
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