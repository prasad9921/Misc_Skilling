clear all; close all; clc;
x = [1,1,1,1,zeros(1,12)];
N = 16;
n = 0:N-1;              
X = fft(x,N);
k = 0:N-1;               
magX = abs(X); phaX = angle(X)*180/pi;
subplot(3,1,1); stem(n,x); grid
xlabel('n---->'); ylabel('Magnitude---->');
title('Original Sequence'); 
axis([-1 N -0.2 1.2]);
subplot(3,1,2); stem(k,magX); grid
xlabel('frequency K ---->'); ylabel('Magnitude ---->') ;
title('Magnitude Spectrum'); 
axis([-1 N -0.2 4.2]);
subplot(3,1,3); stem(k,phaX); grid
xlabel('frequency K ---->');  ylabel('Radians---->');
title('Phase Spectrum');
axis([-1 N  min(phaX)-10 max(phaX)+10]);