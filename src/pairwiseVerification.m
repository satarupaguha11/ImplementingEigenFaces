%This function returns the threshold and the pairs of images along with 
%image label of whether they are genuine or imposter. It takes as input the
%pairs generated , the image matrix, the label matrix, the top eigen 
%vectors and the mean image.

function [thresholdValue, AllPairsInfo] = pairwiseVerification( allPairs, ImageMatrix, LabelMatrix ,topEigenVectors,meanImage)

numberOfPairs=size(allPairs,1);                                             %Initialisation
labels=zeros(numberOfPairs,1);
distances=zeros(numberOfPairs,1);

for index=1:numberOfPairs                                                   %find the genuine or imposter pair
    testLabel=LabelMatrix(allPairs(index,1),1);
    trainLabel=LabelMatrix(allPairs(index,2),1);
    if testLabel==trainLabel
        labels(index,1)=0;
    else
        labels(index,1)=1;
    end
    testImage=ImageMatrix(:,allPairs(index,1));
    trainImage=ImageMatrix(:,allPairs(index,2));
    
    [testWeightVector] =findWeightVector( testImage,topEigenVectors,meanImage );    %find eigen face
    [trainWeightVector] =findWeightVector( trainImage,topEigenVectors,meanImage );
    distance=sqrt(sumsqr(testWeightVector-trainWeightVector));                      %compute distance
    distances(index,1)=distance;                                                    
end

AllPairsInfo=[allPairs labels distances];                                           
[falsePosRate,TruePosRate,Threshold,~,opt]=perfcurve(AllPairsInfo(:,3),AllPairsInfo(:,4),1); %find the ROC curve

X=find(falsePosRate==opt(1,1));                                                         %find threshold for the curve
Y=find(TruePosRate==opt(1,2));
index=intersect(X,Y);
thresholdValue=Threshold(index);
plot(falsePosRate,TruePosRate)

end

