%This function gives the ROC curve for the given training data
%It takes as input the Image Matrix, the Label Matrix and the Image in Each
%Class and returns the threshold value for the data along with displaying
%the roc curve

function [thresholdValue]=rocCurve(ImageMatrix, LabelMatrix, ImageInEachClass)

 [allPairs] = generatePairs(ImageMatrix, LabelMatrix, ImageInEachClass);                                 %generate pairs
 [eigenVectors,eigenValues,meanImage] = findEigenVector ( ImageMatrix );                                 %find eigen vectors
 [topEigenVectors] = findTopEigen( eigenVectors,eigenValues,10);                                         %find top eigen vectors
 [thresholdValue,~] = pairwiseVerification( allPairs, ImageMatrix, LabelMatrix ,topEigenVectors,meanImage); %find thresold
 
end