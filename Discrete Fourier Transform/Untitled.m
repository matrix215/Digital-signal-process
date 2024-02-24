% Initialization
clc; clear all; close all;
COL = 256; ROW = 256; %행렬 사이즈 선언을 통해 이미지 load. 

% Read image
filename = 'lena256.raw'; %이미지 load.
fid1 = fopen(filename,'rb'); %읽기 전용.
temp = fread(fid1, [COL, ROW], 'uchar'); 
origin = temp'; %temp에 저장된 원본 이미지를 불러옴.

% Print original image
figure, imshow(origin,[0 255]); %0~255 범위를 갖고 출력.
title('original image');

% DFT
N = 256; % M=N (N = M = 256)
x=0:N-1; y=0:N-1; u=0:N-1; v=0:N-1; % x,y,u,v의 범위 설정.
xu = x'*u; yv = y'*v; % 행과 열에 대한 변환.
WN = exp(-j*2*pi/N);
WNxu = WN.^xu;
WNyv = WN.^yv;
DFT = WNxu*origin*WNyv; % Origin의 형태와 동일하게 만듬. 

% centering (스팩트럼 분석을 조금 더 쉽게하기 위한 것) (필수적임)
DFT_shift = fftshift(DFT); % using fftshift() function
DFT_Log = log(DFT_shift); % using log() function

% print result of DFT (real part)
figure,imshow(DFT_Log, [2 16]); % scale : [2 16]
title('discrete fourier transform');

% IDFT
WN_idft = exp(j*2*pi/N); % IDFT에서는 -j가 아닌 j를 대입.
WNxu2 = WN_idft.^xu;
WNyv2 = WN_idft.^yv;
IDFT = (1/(N*N))*WNxu2*DFT*WNyv2;

% print result of IDFT
figure,imshow(IDFT, [0 255]); % scale : [0 255]
title('inverse discrete fourier transform');

% Calculate PSNR
MSE = mean2((origin - IDFT) .^2 ); % MSE = 평균제곱오차를 구하는 것임(계산하기 위해 mean2가 필요함).
PSNR = 10*log10(255^2 / MSE) % MSE를 이용해서 PSNR을 구하는데, 값을 통해서 DFT와 IDFT를 비교. 