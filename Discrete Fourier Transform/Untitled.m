% Initialization
clc; clear all; close all;
COL = 256; ROW = 256; %��� ������ ������ ���� �̹��� load. 

% Read image
filename = 'lena256.raw'; %�̹��� load.
fid1 = fopen(filename,'rb'); %�б� ����.
temp = fread(fid1, [COL, ROW], 'uchar'); 
origin = temp'; %temp�� ����� ���� �̹����� �ҷ���.

% Print original image
figure, imshow(origin,[0 255]); %0~255 ������ ���� ���.
title('original image');

% DFT
N = 256; % M=N (N = M = 256)
x=0:N-1; y=0:N-1; u=0:N-1; v=0:N-1; % x,y,u,v�� ���� ����.
xu = x'*u; yv = y'*v; % ��� ���� ���� ��ȯ.
WN = exp(-j*2*pi/N);
WNxu = WN.^xu;
WNyv = WN.^yv;
DFT = WNxu*origin*WNyv; % Origin�� ���¿� �����ϰ� ����. 

% centering (����Ʈ�� �м��� ���� �� �����ϱ� ���� ��) (�ʼ�����)
DFT_shift = fftshift(DFT); % using fftshift() function
DFT_Log = log(DFT_shift); % using log() function

% print result of DFT (real part)
figure,imshow(DFT_Log, [2 16]); % scale : [2 16]
title('discrete fourier transform');

% IDFT
WN_idft = exp(j*2*pi/N); % IDFT������ -j�� �ƴ� j�� ����.
WNxu2 = WN_idft.^xu;
WNyv2 = WN_idft.^yv;
IDFT = (1/(N*N))*WNxu2*DFT*WNyv2;

% print result of IDFT
figure,imshow(IDFT, [0 255]); % scale : [0 255]
title('inverse discrete fourier transform');

% Calculate PSNR
MSE = mean2((origin - IDFT) .^2 ); % MSE = ������������� ���ϴ� ����(����ϱ� ���� mean2�� �ʿ���).
PSNR = 10*log10(255^2 / MSE) % MSE�� �̿��ؼ� PSNR�� ���ϴµ�, ���� ���ؼ� DFT�� IDFT�� ��. 