x=[2,2,1,1];
h=[1,3,7,8];
if(length(h)<length(x));
    c=length(x)-length(h);
    h=[h,zeros(1,c)];
else if(length(x)<length(h));
        c=length(h)-length(x);
    else
        disp('length are equal');
    end       
N=max(length(x),length(h));
n=0:N-1;
X=f(x);
H=dft(h);
Y=X.*H;
y=idft(Y);
k=0:N-1;
subplot(3,1,1);
stem(0:length(x)-1,x)
subplot(3,1,2);
stem(0:length(h)-1,h)
suplot(3,1,3);
stem(n,y)