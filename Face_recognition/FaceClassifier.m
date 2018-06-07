clc;
clear all;
close all;
%% TesT Face
[fname path]=uigetfile('.jpg','open face for training');
fname = strcat(path,fname);
im=imread(fname);
imshow(im);
title('Test face');
%% Find out which class it belongs
Ftest = FeatureStatical(im);
%% Compare with database
load db.mat
Ftrain=db(:,1:2);
Ctrain=db(:,3);
for i=1:size(Ftrain,1)
dist(i,:)=sum(abs(str2double(Ftrain(i,:)))-Ftest);
end
Min=min(dist);
if (Min<3)
m=find(dist==Min,1);
det_class = Ctrain(m);
switch (det_class)
          case {"1"}
           msgbox(strcat('detected Person=','Pawan'));
          case {"2"}
            msgbox(strcat('detected Person=','Mrinal'));
          case {"3"}
           msgbox(strcat('detected Person=','Hj'));
          case {"4"}
           msgbox(strcat('detected Person=','Ishant'));
    otherwise
            disp('Unknown Person')
end

 end