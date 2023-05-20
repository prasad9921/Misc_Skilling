x = [1 2 2]; h = [1 2 3 4];
if (length(h)<length(x));
    c=length(x)-length(h);
    h=[h,zeros(1,c)]
elseif (length(x)<length(h));
    c=length(h)-length(x);
    x=[x,zeros(1,c)]
else
    disp('lengths are equal');
end
 
N = max(length(x),length(h));
 
n = 0:N-1;
X = fft(x);
H = fft(h);
Y = X.*H;
 
y = ifft(Y);    
 
k = 0 : N-1;
 
% -------------------------------------------------------------------
figure();
subplot(3,2,1); stem(0:length(x)-1,x,'r','fill','LineWidth',1.5);
xlabel('Time index ---->'); ylabel('Magnitude---->');
title('Sequence x[n]'); axis([-1 4 0  2.2]);
 
subplot(3,2,3); stem(0:length(h)-1,h,'b','fill','LineWidth',1.5);
xlabel('Time index---->'); ylabel('Magnitude---->');
title('Sequence h[n]')
axis([-1 4 0 4.2]);
 
subplot(3,2,5); stem(n,y,'m','fill','LineWidth',1.5);
xlabel('Time index---->'); ylabel('Magnitude---->');
title('Circularly convolved sequence y[n](DFT and IDFT)')
axis([-1 4 0 max(y)+1]);
 
% figure();
subplot(3,2,2); stem(0:length(X)-1,abs(X),'m','fill','LineWidth',1.5);
xlabel('k---->'); ylabel('Magnitude---->');
title('Spectrum of Sequence x[n], X[k}'); axis([-1 4 -0.2 5.4]);
 
subplot(3,2,4); stem(0:length(H)-1,abs(H),'k','fill','LineWidth',1.5);
xlabel('k---->'); ylabel('Magnitude---->');
title('Spectrum of Sequence h[n], H[k}')
axis([-1 4 -0.2 11]);
 
subplot(3,2,6); stem(k,abs(Y),'b','fill','LineWidth',1.5);
xlabel('k---->'); ylabel('Magnitude---->');
title('Spectrum of Circularly convoled sequencey[n], Y[k}')
axis([-1 4 -0.2 51]);
