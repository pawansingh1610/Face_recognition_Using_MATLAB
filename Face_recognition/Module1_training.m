clear all;
close all;
clc; 
%% Taking an image
[fname path]=uiget('open face for training','.jpg');
fname = strcat(path,fname);
im=imread(fname);
imshow(im);
title('Input face');
c=input('Enter the class');

%% Feature Extraction
F=FeatureStatical(im);
try
    load db;
    F=[F c];
    db=[db;F];
    save db.mat db
catch
    db=[F c]; %23 12
    save db.mat db
end

