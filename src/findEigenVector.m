%This function is used to find the normalised eigen vectors, the normalised
%eigen values and the mean image of the training image. It takes as input 
%the Training Image and returns eigen vector, eigen values and mean Image.

 function [eigenVectors,eigenValues,meanImage] = findEigenVector ( TrainImage )
 
  [~,numberOfImages]=size(TrainImage);           
  meanImage=sum(TrainImage,2)/numberOfImages;                                %Find Mean Image
  %imshow(reshape(meanImage,[100 100]),[0 255])
  newImageMatrix=bsxfun(@minus,TrainImage,meanImage);                        %Subtract the Training Image from the Mean Image
  [eigenVectors,eigenValues] = eig(newImageMatrix'*newImageMatrix);          %find eigen vectors
  eigenVectors = TrainImage*eigenVectors;
  eigenVectors=normc(eigenVectors);
 end

