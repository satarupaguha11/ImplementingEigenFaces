%This function is used to return the weight vector for an image.
%It takes as input the image, the top eigen vectors and the mean
%image and returns the weight vector for that image

function [ weightVector ] =findWeightVector( Image,topEigenVectors,meanImage )
 subtractedImage = bsxfun(@minus,Image,meanImage);
 weightVector = topEigenVectors'*subtractedImage;
end