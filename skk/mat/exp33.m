clear all; close all; clc;
format long; 
 
n = [0:20]; x = (1/4).^n ; xic = [1, -2];
b = [1]; a = [1, -1.5 +0.5];
 
y1 = filter(b,a,x,xic);
 
figure(); 
subplot(2,1,1);stem(n,y1);
xlabel('Time-index n---->');ylabel('Amplitude');
title('Response of the system');grid on
 

y = (1/3)*(1/4).^n+(1/2).^n+(2/3)*ones(1,21);
subplot(2,1,2);stem(n,y);
xlabel('Time-index n---->');ylabel('Amplitude');
title('Response of the System (Analytical)');grid on
