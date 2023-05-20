clc;
clear all;
close all;
%% Exp-6. Design of FIR Filters
% T1: Note the parameters required for desiginig a filter
% T2: Design a simple FIR LPF & HPF using your defined parameters.
% T3: Define metrics for filter performance indicator.

%% -------------------------------------------------------------------- %%
%% T1...Low-pass FIR digital filter specification
% omega_p – normalized cut-off frequency in the passband;
% omega_s – normalized cut-off frequency in the stopband;
% delta1 – maximum ripples in the passband;
% delta2 – minimum attenuation in the stopband [dB];
% attan_p – maximum ripples in the passband; and
% attan_s – minimum attenuation in the stopband [dB];
% attan_p = 20log10(1+delta1)/(1-delta1)
% attan_s = -20log10(delta2)
% Normalized_freq = 2*pi*f/fs.
%% T2
% rp=input('enter the passband ripple(Example:0.02):');
% rs=input('enter the stopband ripple(Example:0.01):');
% fp=input('enter the passband freq(Example:1500):');
% fs=input('enter the stopband freq(Example:2000):');
% f=input('enter the sampling freq(Example:6000):');
rp = 0.02;rs=0.01;fp=1500;fs=2000;f=6000;
wp=2*fp/f;ws=2*fs/f; % Normalized Frequency
num=-20*log10(sqrt(rp*rs))-13;
dem=14.6*(fs-fp)/f;
n=ceil(num/dem);
n1=n+1;
if (rem(n,2)~=0)
n1=n;
n=n-1;
end
y=hamming(n1);
% low-pass filter
b=fir1(n,wp,y);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
figure,plot(o/pi,m);title('FIR Filter Response');
ylabel('Gain in dB');xlabel('Normalised frequency');
%% T3 - FIR Use
%% Define Window
m=80;  % The length of the Karnel% 
n=0:1:m-1; %Defines Range of position value% 
s=2*pi*(n/(m-1));              %Angle% 
wh=0.54-0.46*cos(s);  %Define Hamming window function% 
figure, stem(n,wh);grid 
title('Hamming Window') 
xlabel('n') 
ylabel('w')
% % % Define a signal - Sinc function
p=n-(m-1)/2; %Angle
fc=0.1;  %Define Cutoff frequency
Z=sin(2*pi*fc*p)./(pi*p)+0.001*rand(1,80);  %Truncated Sinc function
figure,stem(n,Z);grid  
title('Unit Sample Response of the sin function') 
xlabel('n') 
ylabel('Z') 
[h,w]=freqz(Z);  %get Frequency Response% 
figure,plot(w/pi,abs(h));grid 
title('Frequency response of the sin function') 
xlabel('Frequency') 
ylabel('Amplitude') 
% % % Use FIR filter on sinc function
t=Z.*wh;   %Multiplication of Hamming Window and sin function% 
figure,stem(n,t);grid 
title('Multiplication of Hamming Window and sin function') 
xlabel('n') 
ylabel('t') 
% % % 
[h,w]=freqz(t); 
figure,plot(w/pi,abs(h));grid 
xlabel('Frequency') 
ylabel('Magnitude') 
title('Frequency response of the windowed sin function') 
figure;grid
freqz(t) 
title('Frequency Response of the windowed sin function in dB') 
%% Q. Check for Hanning, Rectangular and Blackman Windows
%% Q. What insight is gained through the design
%% Q. Can you see linear phase in the response
%% Q. What is the need for linear phase - Explain
%% Q. What if non-linearity is introduced by the input signal.
