close all;
clc;
clear all;

%
img = imread('Fig4.11(a).jpg');
img = mat2gray(img);
figure;
subplot(1,3,1);
imshow(img);
title('原图像');

% 产生滤波函数
[M, N] = size(img);
P = 2 * M;
Q = 2 * N;

alf = 100;
H = zeros(P, Q);
for i = 1:P
    for j = 1:Q
        H(i, j) = exp(-((i-P/2)^2 + (j-Q/2)^2) / (2 * alf^2));
    end
end

% H = ones(P, Q);
subplot(1,3,2);
imshow(H);
title('滤波函数');

% 
% 图像填充
[M, N] = size(img);
P = 2 * M;
Q = 2 * N;

img_fp = zeros(P, Q);
img_fp(1:M, 1:N) = img(1:M, 1:N);

% [X, Y] = meshgrid(1:P, 1:Q);
% ones = (-1)^(X+Y);

% img_f = ones .* img_fp;
img_f = zeros(P, Q);
for x = 1:P
    for y = 1:Q
        img_f(x, y) = img_fp(x, y) .* (-1)^(x+y);
    end
end

img_F = fft2(img_f);

img_G = img_F .* H;
img_g = real(ifft2(img_G));

% img_g = ones .* img_g;

for x = 1:P
    for y = 1:Q
        img_g(x, y) = img_g(x, y) .* (-1)^(x+y);
    end
end

img_o = img_g(1:M, 1:N);

subplot(1,3,3);
imshow(img_o, []);
title('高斯低通滤波后的图像');
