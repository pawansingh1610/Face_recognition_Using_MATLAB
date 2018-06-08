% read the image
function [my_Face] = face_detector(im)
A = im;
A=rgb2gray(A);
%get face detection objects
FaceDetector = vision.CascadeObjectDetector();

%Use face detector on A get the faces
BBOX = step(FaceDetector,A);

% annotate the faces
S = insertObjectAnnotation(A,'rectangle',BBOX,'Faces');


%display the number of faces
n=size(BBOX,1);
str_n=num2str(n);
str=strcat('number of detected fcaes are ',str_n);
disp(str);
for i=1:n
my_Face=imcrop(A,BBOX(i,:));
figure;
end