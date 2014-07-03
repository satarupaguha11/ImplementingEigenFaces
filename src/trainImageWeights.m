%This function returns the weight vector for the entire training image
%data. It takes as input the Training Image MAtrix, the top K eigen Vectors
%and the mean image. It returns the weight vector for the training data

function [ weightVectorTrain ] = trainImageWeights( TrainImage,topEigenVectors,meanImage )

numberOfEigenVectors = size(topEigenVectors,2);                             %Initialisation
numberofImages=  size(TrainImage, 2);
weightVectorTrain=zeros(numberOfEigenVectors,numberofImages);

for i=1:numberofImages                                                      %find weight vector for each training image
    Image=TrainImage(:,i);
    weightVectorTrain(:,i) =findWeightVector( Image,topEigenVectors,meanImage );
end

end

