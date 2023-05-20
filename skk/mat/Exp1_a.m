% Q. How to define a filter - LPF
R=10;
c=0.01;
f = 0:0.1:3;
fc = 1/(2*pi*R*c)
h = 1./(1+j*2*pi*f*R*c);
% hm = 20.*log10(abs(1+h));
figure, subplot(311)
loglog(f,h)
title('LPF Magnitude Response')
% Generate a noisy sine wave
Fs = 40; %Sampling Rate/Frequency Hz
st = 1/Fs;  % Sample in between time interval in Sec
t = 0:st:10;
Fc = 8;  % Sine wave frequency Hz
x = sin(2*pi*Fc/Fs*t);
t = t/Fs;
% Add Random noise
n = rand(1,length(x));
xn = x+n;
subplot(312)
plot(t,xn)
title('Noisy sine wave')
% Use your LPF to remove noise using convolution
X = conv(xn,h,'same');
subplot(313)
plot(t,X)
title('Filtered Sine')
% Q. Decode the physical changes in the noisy and recovered sines.

% Q. Compare with autocorrelation of input signal
Xcxx = xcorr(x,x);
Xcxnx = xcorr(xn,x); % Corr b/n noisy and filtered
XcxX = xcorr(x,X);
figure
subplot(311), plot(Xcxx),title('Auto_{Corr} b/n Original_{signal}');
subplot(312), plot(Xcxnx),title('Cross Corr noisy_{signal} and original_{Signal}');
subplot(313), plot(XcxX),title('Cross Corr Filtered_{signal} and Original_{Signal}');

