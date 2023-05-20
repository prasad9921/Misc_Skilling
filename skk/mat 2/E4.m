%A. Direct Computation of DFT
x=[1 -1 2 -2];
l=length(x);
y=x*dftmtx(l);
disp('DFT of the i/p is')
disp(y)
l1=length(y);
y1=y*conj(dftmtx(l1))/l1;
disp('IDFT of the i/p is')
disp(y1)

% %B. Linear Convolution using DFT


x=[1 2 3 4]; h=[2 1 3 2];

X=dft(x,4);
H=dft(h,4);
y=X.*H;
y1=idft(y,4);
disp('The Linear conv of the given seqn is')
disp(y1)

% %C. Circular Convolution using DFT
x=[1 2 1 2];
h=[4 3 2 1];
X=dft(x,4);
H=dft(h,4);
y=X.*H;

y1=real(ifft(y));
disp('The Circular conv of the given seqn is')
disp(y1)

% %D. Establish Parseval's relation with DFT
x=[(1:128) (128:-1:1)];
y=dft(x,256);
y1=sum(x.*x);
y2=length(x);
y3=abs(y);
y4=[sum(y3.*y3)]/y2;
disp('Energy in t domain')
disp(y1)
disp('Energy in f domain')
disp(y4)
