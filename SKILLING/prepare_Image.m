clc
clear all
close all
warning off
%addpath('dtcwt_toolbox');
mkdir('result');
path='rim-one2';
db3pfm=[];
dir_list=dir(path);
for i=1:length(dir_list)
    if strcmpi(dir_list(i).name, 'Deep') || ...
        strcmpi(dir_list(i).name, 'Early') || ...
        strcmpi(dir_list(i).name, 'Moderate') || ...
        strcmpi(dir_list(i).name, 'Normal')
        dir_list_2=dir([path, '/', dir_list(i).name, '/*.bmp']);
        for j=1:length(dir_list_2)
            if strfind(dir_list_2(j).name, '-exp')
                continue;
            end
            
           %II. proposed method
            %-------------------
            %read image
            img=imread([path, '/', dir_list(i).name, '/', dir_list_2(j).name], 'bmp');
            
            img=imresize(img, [512, 512]);
            
            
            gray_img=rgb2gray(img);
            
         
            
            
T=wpdec2(gray_img,2,'db3');
% Fetching the sub-bands (from Wavelet tree) & assigning to variables
%LPF  level  1&2
A = wpcoef(T,[1 0]);AA=wpcoef(T,[2 0]);AH=wpcoef(T,[2 1]);AV=wpcoef(T,[2 2]);AD=wpcoef(T,[2 3]);
%HPF hori Levels 1&2
H = wpcoef(T,[1 1]);HA=wpcoef(T,[2 4]);HH=wpcoef(T,[2 5]);HV=wpcoef(T,[2 6]);HD=wpcoef(T,[2 7]);
%HPF Vert Levels 1&2
V = wpcoef(T,[1 2]);VA=wpcoef(T,[2 8]);VH=wpcoef(T,[2 9]);VV=wpcoef(T,[2 10]);VD=wpcoef(T,[2 11]);
%HPF Diag cfnts
D = wpcoef(T,[1 3]);DA=wpcoef(T,[2 12]);DH=wpcoef(T,[2 13]);DV=wpcoef(T,[2 14]);DD=wpcoef(T,[2 15]);
feat=[];
feat=cat(2,feat,mean(mean(A)),mean(mean(AA)),mean(mean(AH)),mean(mean(AV)),mean(mean(AD)),mean(mean(H)),mean(mean(HA)),mean(mean(HH)),mean(mean(HV)),mean(mean(HD)),mean(mean(V)),mean(mean(VA)),mean(mean(VH)),mean(mean(VV)),mean(mean(VD)), mean(mean(D)),mean(mean(DA)),mean(mean(DH)),mean(mean(DV)),mean(mean(DD)));            
            if strcmpi(dir_list(i).name, 'Deep') || ...
                strcmpi(dir_list(i).name, 'Early') || ...
                strcmpi(dir_list(i).name, 'Moderate')
                feat=cat(2, feat, 2.0);    % In FM showcase as abnormal image for Supervised Learning
            elseif strcmpi(dir_list(i).name, 'Normal')
                feat=cat(2, feat, 1.0);
            end
            db3pfm=cat(1, db3pfm, feat);
         
        save('db3pfm.mat', 'db3pfm');
        end
    end
end

 plot(T)

