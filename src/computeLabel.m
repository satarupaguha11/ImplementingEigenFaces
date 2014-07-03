%This function computes a label indicating yes or no for verification. This
%takes as input the entire image matrix, label matrix, a test image and
%claimed label and returns the label as 1 if the distance of the image is
%less than threshold for any of image in the claimed class, else returns 0.

function [label]= computeLabel(TrainImage, TestImage, TrainLabel, claimedLabel,kEigen,thresholdValue)

    label=1;
    
    indices=find(TrainLabel==claimedLabel);                                                               %find indices belonging to claimed class
    numberOfTrainImages=size(indices,1);
    ClassSpecificTrainImages=zeros(size(TrainImage,1),numberOfTrainImages);                               %find images belonging to claimed class
                                                 
    
    for i=1:numberOfTrainImages
        ClassSpecificTrainImages(:,i)=TrainImage(:,indices(i,1));
    end
    
    [eigenVectors,eigenValues,meanImage] = findEigenVector ( ClassSpecificTrainImages );                    %find eigen vectors
    [topEigenVectors] = findTopEigenVerification( eigenVectors,eigenValues,kEigen);                         %find top eigen vectors
    [ weightVectorTrain ] = trainImageWeights( ClassSpecificTrainImages,topEigenVectors,meanImage );        %find eigen face for training images
     weightVectorTest =findWeightVector( TestImage,topEigenVectors,meanImage );                             %find eigen face for test image
     
    distance=zeros(numberOfTrainImages,1);
    diffVector=zeros(kEigen,1);
    for i=1:numberOfTrainImages                                                  %Find Euclidean distance between the test image and training images       
        diffVector(:,1)=weightVectorTrain(:,i)-weightVectorTest(:,1);            %on the basis of eigen faces
        distance(i,1)=sqrt(sumsqr(diffVector));
        if (distance(i,1)<thresholdValue)                                        %check distance and decide
            label=0;
            break;
        end
    end   
    end
    
    
    