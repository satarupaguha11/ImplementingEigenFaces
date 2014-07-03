function [ predictedLabel ] = computeLabel2( trainFaces, testFace,trainLabels, testLabel, count, threshold )
%faceVerification Summary of this function goes here
%   Detailed explanation goes here

    numOfClasses=length(count);
    numOfTrainSamples=length(trainLabels);

     currentTrainSamples=trainFaces(:,trainLabels==testLabel);
     numOfTrainSamples=nnz(trainLabels==testLabel);

    distance=zeros(1,numOfTrainSamples);
    for j=1:numOfTrainSamples
        distance(j)=sum((currentTrainSamples(:,j)-testFace).^2)/1.0e+06;
    end
    minDistance=min(distance);
    if minDistance<=threshold
        predictedLabel=testLabel;
    else
        predictedLabel=0;
    end

end