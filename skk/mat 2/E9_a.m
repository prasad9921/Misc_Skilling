clc
load('ecg.mat');
s=ecg(1,:);
fs=128;
NFFT=2^nextpow2(length(s));
Y=fft(double(s),NFFT)/length(s);
f=(double(fs)/2*linspace(0,1,NFFT/2));
amp=2*abs(Y(1:NFFT/2));
figure;
plot (f,amp);
title ('NORMAL 16265');
xlabel('Frequency (Hz)');
ylabel ('Power');