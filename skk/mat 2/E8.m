
% Plotting the FFT values of audio signal
[data,samplerate]=audioread('3ed3e49a_nohash_0.wav') ;
L=1024;nVals=0:L-1; x= data(nVals+1); 
f=samplerate*(nVals/L);
X=fft(x);
figure(1);plot(f,abs(X));

% Plotting the FFT values of audio signal with normalized frequency
[data,samplerate]=audioread('3ed3e49a_nohash_0.wav') ;
L=1024;nVals=0:L-1; x= data(nVals+1); 
f=samplerate*(nVals/L);
X=fft(x);
figure(2);plot(f/max(f),abs(X));