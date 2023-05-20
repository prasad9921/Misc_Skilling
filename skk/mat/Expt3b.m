clear all;
a=imread('Cameraman.tif');
b=im2double(a);
[m n]=size(b);
%to centre FT
for i=1:m
    for j=1:n
        b1(i,j)=((-1)^(i+j)).*b(i,j);
    end
end
c=fft2(b1);
d=log(1+abs(c));
% imshow(d,[]) only for visualisation
% design of H(u,v)   LPF T. fn
for u=1:m
    for v=1:n
        D=((u-m/2)^2+(v-n/2)^2)^(1/2);
       if D<30
           H(u,v)=1;
       else
           H(u,v)=0;
       end
    end
end
H(u,v)=exp(-D^2/800);
G=c.*H;
g=real(ifft2(G));
        %decentre
        
for i=1:m
    for j=1:n
        g1(i,j)=((-1)^(i+j)).*b(i,j);
    end
end
figure(1);imshow(a);
figure(2);imshow(H);
figure(3);imshow(g1);