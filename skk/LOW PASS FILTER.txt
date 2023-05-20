%LPF filter design
R = 10;
c = 0.01;
f = 0:0.1:3;
fc = 1/(2*pi*R*c);
h = 1./(1 + 2*1i*pi*f*R*c);
figure();
subplot(3,2,1);
loglog(f,h);
title('LPF magnitude response');
%generate a noisy signal
Fs = 40;
st = 1/Fs;
t = 0:st:10;
Fc = 8;
x = sin(2*pi*Fc/Fs*t);
t = t/Fs;
%add random noise
n = rand(1,length(x));
xn = x + n;
subplot(3,2,2);
plot(t,xn);
title('Noisy sine wave');
%use your LPF to remove noise using convolution
X = conv(xn,h,'same');
subplot(3,2,3);
plot(t,X);
title('Filtered sine');

%compare with autocorrelation of input signal
Xcxx = xcorr(x,x);
Xcxnx = xcorr(xn,x); %corr b/n noisy and filtered
XcxX = xcorr(x,X);
figure()
subplot(3,2,4),plot(Xcxx),title('Auto_{Corr} b/n Orignial_{signal}');
subplot(3,2,5),plot(Xcxnx),title('Cross Corr noisy_{signal} and original_signal');
subplot(3,2,6),plot(XcxX),title('Cross Corr Filtered_{signal} and Original signal');