
%    Filtering the noise using fft
n = 0:254;

e_csv=csvread('eeg_data.csv',1,0);
s1=e_csv(:,1);
s=s1';
% Add Random noise
zz= [10 -8 0 8 -10];
noise=repmat(zz,[1,51]);

sn = s + noise; % noisy signal


S = fft(s);
S_N = fft(sn);

figure(1);
subplot(3,1,1); plot(n,s,'r','LineWidth',1.5); % let's use plot instead of stem
xlabel('n---->'); ylabel('Magnitude---->');
title('Original Signal'); 
%axis([0 260 0 15]);

subplot(3,1,2);plot(n,sn,'b','LineWidth',1.5); % since it is a long sequence
xlabel('n---->'); ylabel('Magnitude---->');
title('Noisy Signal'); 
%axis([0 260 0 15]); 



figure(2);subplot(3,1,1);plot(fftshift(abs(S)),'r','LineWidth',1.5 );
%fftshift(X) rearranges a Fourier transform X by shifting the 
%zero-frequency component to the center of the array.
xlabel('Frequency ---->'); ylabel('Magnitude---->');
title('Spectrum of Original Signal');
%axis([0 260 0 1200]);

subplot(3,1,2);plot(fftshift(abs(S_N)),'k','LineWidth',1.5 );
xlabel('Frequency ---->'); ylabel('Magnitude---->');
title('Spectrum of Noisy Signal');
%axis([0 260 0 1200]);

% H = [ones(1,15) zeros(1,226), ones(1,15)]; % the filter response
H = [ones(1,20) zeros(1,215), ones(1,20)]; % the filter response

figure(3);
plot(fftshift(H),'m','LineWidth',1.5);
xlabel('Frequency ---->'); ylabel('Magnitude---->');
title('Spectrum of Filter');
%axis([0 260 0 1.2]);


Z = S_N.*H; % filter in frequency domain
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

