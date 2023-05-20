
%    Filtering the noise using fft


clear all; close all; clc;

n = 1:188;
load('ecg.mat');
x=ecg(1,:);
zz= [100 -5 0 -100];
noise=repmat(zz,[1,47]);

y = x + noise; % noisy signal

figure(1);
subplot(3,1,1); plot(n,x,'r','LineWidth',1.5); % let's use plot instead of stem
xlabel('n---->'); ylabel('Magnitude---->');
title('Original Signal'); 
%axis([0 260 0 15]);

subplot(3,1,2);plot(n,y,'b','LineWidth',1.5); % since it is a long sequence
xlabel('n---->'); ylabel('Magnitude---->');
title('Noisy Signal'); 
%axis([0 260 0 15]); 

X = fft(x);
Y = fft(y);

figure(2);subplot(3,1,1);plot(fftshift(abs(X)),'r','LineWidth',1.5 );
%fftshift(X) rearranges a Fourier transform X by shifting the 
%zero-frequency component to the center of the array.
xlabel('Frequency ---->'); ylabel('Magnitude---->');
title('Spectrum of Original Signal');
%axis([0 260 0 1200]);

subplot(3,1,2);plot(fftshift(abs(Y)),'k','LineWidth',1.5 );
xlabel('Frequency ---->'); ylabel('Magnitude---->');
title('Spectrum of Noisy Signal');
%axis([0 260 0 1200]);

% H = [ones(1,15) zeros(1,226), ones(1,15)]; % the filter response
H = [ones(1,20) zeros(1,148), ones(1,20)]; % the filter response

figure(3);
plot(fftshift(H),'m','LineWidth',1.5);
xlabel('Frequency ---->'); ylabel('Magnitude---->');
title('Spectrum of Filter');
%axis([0 260 0 1.2]);


Z = Y.*H; % filter in frequency domain
z = ifft(Z);
figure(1);subplot(3,1,3);plot(n, real(z),'b','LineWidth',1.5);
xlabel('n---->'); ylabel('Magnitude---->');
title('Denoised Signal'); %axis([0 260 0 15]); 
%axis([0 260 0 15]);

p = fft(z);
figure(2);
subplot(3,1,3);plot(fftshift(abs(p)),'k','LineWidth',1.5 );
xlabel('Frequency ---->'); ylabel('Magnitude---->');
title('Spectrum of Denoised Signal');
%axis([0 260 0 1200]);

