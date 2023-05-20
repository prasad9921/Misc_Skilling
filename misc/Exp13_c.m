a1=imread('Angio.jpg');
a=rgb2gray(a1);
a=im2double(a);
[cA,cH,cV,cD] = dwt2(a,'haar');

% Haar Wavelet without in-built function
[m n]=size(a);
o=m/2;p=n/2;

for i=1:o
    v=(2*i)-1;w=2*i;
lp_r(i,:)=(a(v,:)+a(w,:));   % for app 
hp_r(i,:)=(a(v,:)-a(w,:));   % for detailed 
end
%  col operation for all
for j=1:p
    t=(2*j)-1;u=2*j;
appr(:,j)=(lp_r(:,t)+lp_r(:,u))/2;   %  LL
vert(:,j)=(lp_r(:,t)-lp_r(:,u))/2;    %  LH
hori(:,j)= (hp_r(:,t)+hp_r(:,u))/2;   %  HL
diag(:,j)=(hp_r(:,t)-hp_r(:,u))/2;    % HH
end



% comparing the o/ps of in-built and analytical functions
figure(1);
subplot(1,2,1);imshow(cA); subplot(1,2,2);imshow(appr);

% Check each two lines below simultaneoulsy (Ctrl-T  & F9)

mean(mean(cA))
mean(mean(appr))
% entropy(cA)
% entropy(appr)
% 
% 
% mean(mean(cH))
% mean(mean(hori))
% entropy(cH)
% entropy(hori)
% 
% mean(mean(cV))
% mean(mean(vert))
% entropy(cV)
% entropy(vert)
% 
% 
