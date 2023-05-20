clear all;
close all;
a=imread('Angio.jpg');
b1=rgb2gray(a);
b2=im2double(b1);   %normalize%
bn=imnoise(b2,'gaussian',0.04);
% to filter the noise%
h1=(1/9)*ones(3); %impule h(n)%
h2=(1/25)*ones(5);

g1=conv2(bn,h1,'same');
g2=conv2(bn,h2,'same');


subplot(1,3,1);imshow(bn);
subplot(1,3,2);imshow(g1,[]); %convert datatype%
subplot(1,3,3);imshow(g2,[]);


