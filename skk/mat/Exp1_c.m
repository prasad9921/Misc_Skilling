% Q. How to define a filter - LPF
R=10;
c=0.08;
f = 0:0.1:3;
fc = 1/(2*pi*R*c)
h = 1./(1+j*2*pi*f*R*c);
% hm = 20.*log10(abs(1+h));


n = 1:255;
% x = n.*exp(-0.03*n); % desired signal
e_csv=csvread('eeg_data.csv',1,0);
s1=e_csv(:,1);
s=s1';
% Add Random noise
zz= [10 -8 0 8 -10];
noise=repmat(zz,[1,51]);

xn = s + noise; % noisy signal
% Fs = 40; %Sampling Rate/Frequency Hz
% st = 1/Fs;  % Sample in between time interval in Sec
% t = 0:st:10;
% Fc = 8;  % Sine wave frequency Hz
% x = sin(2*pi*Fc/Fs*t);
%t = t/Fs;

figure, 
subplot(411)
plot(n,s)
%axis([min(n)-1 max(n)+1 min(s)-1 max(s)+1])
title('original EEG')

subplot(412)
loglog(f,h)
title('LPF Magnitude Response')

subplot(413)
plot(n,xn)
title('Noisy EEG wave')
% Use your LPF to remove noise using convolution
X = conv(xn,h,'same');
subplot(414)
plot(n,X)
title('Filtered EEG')
% Q. Decode the physical changes in the noisy and recovered sines.
% Q. Can you reconstruct HPF and repeat the operation.
%% T4
%Q. Find the relativity b/n noisy and filtered sines
% Q. Compare with autocorrelation of input signal
Xcxx = xcorr(s,s);
Xcxnx = xcorr(xn,s); % Corr b/n noisy and filtered
XcxX = xcorr(s,X);
figure
subplot(311), plot(Xcxx),title('Auto_{Corr} b/n Original_{signal}');
subplot(312), plot(Xcxnx),title('Cross Corr noisy_{signal} and original_{Signal}');
subplot(313), plot(XcxX),title('Cross Corr Filtered_{signal} and Original_{Signal}');

