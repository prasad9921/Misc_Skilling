clear all;
close all;
a=imread('Angio.jpg');
b1=rgb2gray(a);
b2=im2double(b1);   %normalize%
bn=imnoise(b2,'gaussian',0.04);
% to filter the noise%
h=(1/9)*ones(3,3); %impule h(n)%

g=conv2(bn,h,'same');
subplot(1,2,1);imshow(bn);
subplot(1,2,2);imshow(g,[]); %convert datatype%  search in HELP : Image types in toolbox





