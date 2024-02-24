% Initiallization
clc; clear all close all
COL = 256; ROW = 256;

% Read image
filename = 'GIRL256.raw';
fid1 = fopen(filename,'rb');
temp= fread(fid1, [COL, ROW], 'uchar');
original_img = temp';

% Print original image
figure(1), imshow(original_img,[0 255]);
title('original image');

% 3 x 3
smooth_filter1 = [1 1 1 ; 1 1 1 ; 1 1 1]/9;
output1 = filter2( smooth_filter1, temp);
figure(2), imshow(output1',[0 255]);
title('3 x 3 smooting filtered image');

% 5 x 5
smooth_filter2 = [1 1 1 1 1 ; 1 1 1 1 1 ; 1 1 1 1 1 ; 1 1 1 1 1 ; 1 1 1 1 1]/25;
output2 = filter2( smooth_filter2, temp);
figure(3), imshow(output2',[0 255]);
title('5 x 5 smooting filtered image');

% 3 x 3 gaussian filter
g_filter1 = [ 1 2 1 ; 2 4 2 ; 1 2 1]/16;
output3 = filter2 (g_filter1 ,temp);
figure(4), imshow(output3',[0 255]);
title('3 x 3 gaussian filtered image');

% 5 x 5 gaussian filter
g_filter2 = [ 2 4 5 4 2 ; 4 9 12 9 4 ; 5 12 15 12 5 ;4 9 12 9 4 ; 2 4 5 4 2 ]/159;
output4 = filter2 (g_filter2, temp);
figure(5), imshow(output4',[0 255]);
title('5 x 5 gaussian filtered image');