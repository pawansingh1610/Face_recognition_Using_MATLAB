
function [snap] = test_image()
vid = videoinput('winvideo', 1);
set(vid, 'ReturnedColorSpace', 'RGB');
snap = getsnapshot(vid);
imshow(snap);
end
