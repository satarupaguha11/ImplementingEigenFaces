%This function takes as input the number of eigen vectors, the size by
%which we need to resize the test image and the Image Matrix for the
%training data. It displays the original image and the image after applying
%PCA

function [x]=reconstruction(kEigen,ImageMatrix)
  x=1;
 [eigenVectors,eigenValues,meanImage] = findEigenVector ( ImageMatrix );                  %find eigen vectors
 [topEigenVectors] = findTopEigen( eigenVectors,eigenValues,kEigen);                      %find top eigen vectors
 [~,~] = unknownFaceReconstruction(topEigenVectors,meanImage);                     %reconstruct the new face
 
end