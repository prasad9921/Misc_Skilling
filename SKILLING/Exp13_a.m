%Haar Transform of a non-stationary Signal

Fs=1000; t=linspace(0,5,5e3);
x=cos(2*pi*100*t).*(t<1)+cos(2*pi*50*t).*(3<t)+0.3*randn(size(t));
[a,d]=haart(x)   %   a is average of everyn 2 el x   %ded by sqrt(2)    
                   % d is diff btwn 2nd and 1st el %ded by sqrt(2)
%cwt(x,Fs)
plot(x);
subplot(3,1,1);plot(x);
subplot(3,1,2);plot(a);   
subplot(3,1,3);plot(d{1});

