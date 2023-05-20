clc;
clear all;
close all;
%% Exp-8. Design of IIR filters
% T1: Note the IIR filter parameters required for the design.
% T2: Use the Design methods of IIR filter - Butterworth and Chebechev models
% T3: Use the LPF to filter a random noisy signal.

%% T1 & T2:: To Design We need the basic info
alphap=2;  %passband attenuation in dB
alphas=20; %stopband attenuation in dB
wp=[.2*pi,.4*pi]; % passband freq. in radians
ws=[.1*pi,.5*pi]; % stopband freq. in radians
%to find cutoff freq. and order of the filter
[n,wn]=buttord(wp/pi,ws/pi,alphap,alphas) %syatem function of the filter
[b,a]=butter(n,wn)
w=0:.01:pi;
[h,ph]=freqz(b,a,w);
m=20*log10(abs(h));
an=angle(h);
subplot(2,3,1);plot(ph/pi,m);grid;
ylabel('Gain in dB');
xlabel('NORMALISED FREQUENCY')
title('Butterworth Magnitude Response')
subplot(2,3,4);plot(ph/pi,an);grid
ylabel('phase in radians');
xlabel('noramlised frequency')
title('Butterworth phase Response')
% Chebyshev type - 1 and 2 filter responses
[n,wn] = cheb1ord(wp/10,ws/10,alphap,alphas)  % Gives mimimum order of filter
[b,a] = cheby1(n,alphap,wn);        % Chebyshev Type I filter design
w=0:.01:pi;
[h,ph]=freqz(b,a,w);
m=20*log10(abs(h));
an=angle(h);
subplot(2,3,2);plot(ph/pi,m);grid;
ylabel('Gain in dB');
xlabel('NORMALISED FREQUENCY')
title('Cheby Type - I Magnitude Response')
subplot(2,3,5);plot(ph/pi,an);grid
ylabel('phase in radians');
xlabel('noramlised frequency')
title('Cheby Type - I phase Response')
% Chebyshev Type - II
[n,wn] = cheb2ord(wp/10,ws/10,alphap,alphas)  % Gives mimimum order of filter
[b,a] = cheby2(n,alphap,wn);        % Chebyshev Type II filter design
w=0:.01:pi;
[h,ph]=freqz(b,a,w);
m=20*log10(abs(h));
an=angle(h);
subplot(2,3,3);plot(ph/pi,m);grid;
ylabel('Gain in dB');
xlabel('NORMALISED FREQUENCY')
title('Cheby Type - II Magnitude Response')
subplot(2,3,6);plot(ph/pi,an);grid
ylabel('phase in radians');
xlabel('noramlised frequency')
title('Cheby Type - II phase Response')
% Q. Idnetify filter type.
% Q. Use the above code to create Other types.
%% T3
Fs = 40; %Sampling Rate/Frequency Hz
st = 1/Fs;  % Sample in between time interval in Sec
t = 0:st:10;
Fc = 8;  % Sine wave frequency Hz
x = sin(2*pi*Fc/Fs*t);
t = t/Fs;
Noisy_dataIn = randn(1,401)+x;
figure
subplot(211),plot(t,Noisy_dataIn)
% Butter LPF
fc = 100;
fs = 10000;
[b,a] = butter(6,fc/(fs/2));
% Apply on Data
Filtered_dataOut = filter(b,a,Noisy_dataIn);
subplot(212),plot(t,Filtered_dataOut)
%figure,freqz(b,a)
% Q. What are the filter parameters that need adjustments to arrive at the
% desired output.
% Q. Tell how order of the filter influences the output
% Q. Calculate the filter performance using MSE and PSNR by comparing with
% other IIR filters.
%% T4 - Impulse Invarient Method based IIR filter Design
% Analog and Digital Butterworth Filters
% f = 2;
% fs = 10;
% [b,a] = butter(6,2*pi*f,'s'); % Analog Filter
% [bz,az] = impinvar(b,a,fs); % Digital Filter
% figure
% freqz(bz,az,1024,fs)
% title('Digital BW Filter')
% figure 
% impz(bz,az,[],fs)
% title('Analog BW Filter')
% figure
% zplane(bz,az)
% %% T5: Bilinear Transformation
% % Fs = 0.5;                             % Sampling frequency
% [z,p,k] = butter(n,wn);            % Lowpass filter prototype
% [num,den] = zp2tf(z,p,k);             % Convert to transfer function form
% [numd,dend] = bilinear(num,den,fs);   % Analog to digital conversion
% figure
% freqz(numd,dend)                     % Visualize the filter
% figure 
% impz(p,z,[],fs)
% title('Analog BW Filter')
% figure
% zplane(p,z)
