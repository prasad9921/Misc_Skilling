clc;
clear all;
close all;
%% Exp-4. Discrete Fourier Transform
% % T1: Develop a DFT function
% % T2: Compute DFT of a simple sigal using your function
% % T3: Compute DFT of ECG, EEG and other signals from ur function
% % T4: Why is transformation important and explain its role in SP.
%% DFT using Formula
x = [1 1 1 1];
X = zeros(1,length(x));
N = length(x);
n = length(x);
k = length(X);
% DFT Kernel - Twiddle Factor
for i = 0:n-1
    for ii = 0:k-1
        Wnk(i+1,ii+1) = exp((-j*2*pi*i*ii)/N);
    end
end
X = Wnk*x';
%% T2 DFT of a Discrete Sine
t=0:0.01:1;
x= sin(2*pi*10*t)+ sin(2*pi*100*t);


X = (zeros(1,length(x)))';
N = length(x);
% DFT Kernel - Twiddle Factor
for n = 0:N-1
    for k = 0:N-1
        Wnk(n+1,k+1) = exp((-j*2*pi*n*k)/N);
    end
end
X = Wnk*x';
Xp = angle(X);
Xpp = atan(imag(X)./real(X));
figure(1);
subplot(311),plot(t,x),title(' sin(n)');
subplot(312),plot(abs(X),'LineWidth',1.5),title('DFT Magnitude');
subplot(313),plot(Xp,'LineWidth',1.5),title('DFT phase plot');
%% T3
load('ecg.mat');
for ii = 1:size(ecg,1)
    e = ecg(ii,:);
    Xe = (zeros(1,length(e)))';
    N = length(e);
    % DFT Kernel - Twiddle Factor
    for n = 0:N-1
        for k = 0:N-1
            Wnk1(n+1,k+1) = exp((-j*2*pi*n*k)/N);
        end
    end
    Xe = Wnk1*e';
    Xep = angle(X);
    figure(2)
    subplot(311),plot(e),title('TD ECG Signal');
    subplot(312),plot(abs(Xe),'LineWidth',1.5),title('DFT Magnitude');
    subplot(313),plot(Xep,'LineWidth',1.5),title('DFT phase plot');
end
% Q. Compute DFT on your datasets and record your responses.
