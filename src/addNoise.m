function [noisyImage]= addNoise(image)
% image=uint8(image(:,10));
% imshow(reshape(image,80,80),[0 255])
noisyImage=imnoise(image,'salt & pepper', 0.02);
% imshow(reshape(noisyImage,80,80),[0 255])

end