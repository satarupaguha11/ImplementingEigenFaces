function [rotatedImage]= rotateImage(image, angle)
% image=ImageMatrix(:,10);
image=reshape(image,80,80);
rotatedImage=imrotate(image,angle);
rotatedImage=imresize(rotatedImage,[80 80]);

% imshow(rotatedImage,[0 255])
end