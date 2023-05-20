clear all; close all; clc;
n = 0:255;
x = n.*exp(-0.03*n); 
y = x + randn(size(x)); 
figure(1);
subplot(3,1,1); plot(n,x,'r','LineWidth',1.5); 
xlabel('n---->'); ylabel('Magnitude---->');
title('Original Signal'); axis([0 260 0 15]);
subplot(3,1,2);plot(n,y,'b','LineWidth',1.5); 
xlabel('n---->'); ylabel('Magnitude---->');
title('Noisy Signal'); axis([0 260 0 15]); 
X = fft(x);
Y = fft(y);
figure(2);subplot(3,1,1);plot(fftshift(abs(X)),'r','LineWidth',1.5 );
xlabel('Frequency ---->'); ylabel('Magnitude---->');
title('Spectrum of Original Signal');
axis([0 260 0 1200]);
subplot(3,1,2);plot(fftshift(abs(Y)),'k','LineWidth',1.5 );
xlabel('Frequency ---->'); ylabel('Magnitude---->');
title('Spectrum of Noisy Signal');
axis([0 260 0 1200]);
H = [ones(1,5) zeros(1,246), ones(1,5)]; 
figure(3);
plot(fftshift(H),'m','LineWidth',1.5);
xlabel('Frequency ---->'); ylabel('Magnitude---->');
title('Spectrum of Filter');
axis([0 260 0 1.2]);
Z = Y.*H; 
z = ifft(Z);
figure(1);subplot(3,1,3);plot(n, real(z),'b','LineWidth',1.5);
xlabel('n---->'); ylabel('Magnitude---->');
title('Denoised Signal'); axis([0 260 0 15]); 
axis([0 260 0 15]);
p = fft(z);
figure(2);
subplot(3,1,3);plot(fftshift(abs(p)),'k','LineWidth',1.5 );
xlabel('Frequency ---->'); ylabel('Magnitude---->');
title('Spectrum of Denoised Signal');
axis([0 260 0 1200]);