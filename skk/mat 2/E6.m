% %Linear convolution using FFT
x=[1 2]; h=[2 1];
x1=[x zeros(1,length(h)-1)];
h1=[h zeros(1,length(x)-1)];
X=fft(x1);
H=fft(h1);
y=X.*H;
y1=ifft(y);
disp('The Linear conv of the given seqn is')
disp(y1)

% 
% %Circular Convolution using FFT
x=[1 2 1 2];
h=[4 3 2 1];
X=fft(x);
H=fft(h);
y=X.*H;
y1=real(ifft(y));
disp('The Circular conv of the given seqn is')
disp(y1)

% %D. FFT of a sine WAVE
t=0:0.01:1;
a= sin(2*pi*10*t)+ sin(2*pi*100*t);
b=fft(a);
c=abs(b);
d=length(a);
e=c/d;
figure(1);
subplot(2,1,1),plot(t,a);
xlabel('Time')
ylabel('Amp');
title('input signal');
subplot(2,1,2),plot(e);
xlabel('Freq')
ylabel('Amp');
title('FFT of input signal');

%FFT of an ECG signal
load('ecg.mat');
t=0:1:187;

b=fft(ecg(1,:));
c=abs(b);
d=length(ecg(1,:));
e=c/d;
figure(2);
subplot(2,1,1),plot(t,ecg(1,:));
xlabel('Time')
ylabel('Amp');
title('input signal');
subplot(2,1,2),plot(e);
xlabel('Freq')
ylabel('Amp');
title('FFT of input signal');
