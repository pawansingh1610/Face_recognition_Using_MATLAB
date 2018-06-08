clear all;
close all;
clc; 
%% Taking an image
[fname path]=uigetfile('.jpg','open face for training');
fname = strcat(path,fname);
im=imread(fname);
my_Face=face_detector(im);
title('Input face');
c=input('Enter the class');

%% Feature Extraction
F=FeatureStatical(my_Face);
try
    load db;
    F=[F c];
    db=[db;F];
    save db.mat db
catch
    db=[F c]; %23 12
    save db.mat db
end

