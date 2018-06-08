clc;
clear all;
close all;
%% TesT Face
snap = test_image();
imshow(snap);
im=snap;
my_Face=face_detector(im);
title('Test face');
%% Find out which class it belongs
Ftest = FeatureStatical(my_Face);
%% Compare with database
load db.mat
Ftrain=db(:,1:2);
Ctrain=db(:,3);
for i=1:size(Ftrain,1)
dist(i,:)=sum(abs(str2double(Ftrain(i,:))-Ftest));
end
Min=min(dist);
m=find(dist==Min,1);
det_class = Ctrain(m);
switch (det_class)
          case {"1"}
           msgbox(strcat('detected Person=','Mrinal'));
          case {"2"}
            msgbox(strcat('detected Person=','Pawan'));
          case {"3"}
           msgbox(strcat('detected Person=','Hj'));
          case {"4"}
           msgbox(strcat('detected Person=','Ishant'));
           case {"5"}
           msgbox(strcat('detected Person=','Akku'));
           case {"6"}
           msgbox(strcat('detected Person=','Aggarwal'));
           case {"4"}
           msgbox(strcat('detected Person=','Nilesh'));
    otherwise
            disp('Unknown Person')
end

