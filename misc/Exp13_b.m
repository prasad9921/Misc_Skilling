% Haar Transform of an ECG Signal
% 
load wecg
[cA,cD] = dwt(wecg,'haar');
X = idwt(cA,cD,'haar')
figure(1) 
subplot(4,1,1);plot(wecg);
subplot(4,1,2);plot(cA);
subplot(4,1,3);plot(cD);
subplot(4,1,4);plot(X);



% Haar Transform of an ECG Signal  (Coded with formula)
% 
load wecg
m=size(wecg);
o=m/2;
for i=1:o
    v=(2*i)-1;w=2*i;
lp_r(i,:)=(wecg(v,:)+wecg(w,:))/sqrt(2);   % for app 
hp_r(i,:)=(wecg(v,:)-wecg(w,:))/sqrt(2);   % for detailed 
end
figure(2) 
subplot(3,1,1);plot(wecg);
subplot(3,1,2);plot(lp_r);
subplot(3,1,3);plot(hp_r);
% comparing the o/ps of in-built and analytical functions
mean(cA)
mean(lp_r)
entropy(cD)
entropy(hp_r)