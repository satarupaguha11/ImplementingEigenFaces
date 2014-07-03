%This function returns the label of the k nearest neighbour of the given  
%test data. It takes as input the eigen faces for training data and the
%eigen face for the given test image along with number of Eigen Vector and
%the number of nearest neighbour to look for. It returns the predicted
%label for the given data.

function [predictedLabel] =  knn( weightVectorTrain, weightVectorTest,TrainLabel,kEigen,kKNN)

m=size(weightVectorTrain,2);                                                %Initialisation
distance=zeros(m,1);
diffVector=zeros(kEigen,1);

for i=1:m                                                                   %Find Euclidean distance between the test image and training images
    diffVector(:,1)=weightVectorTrain(:,i)-weightVectorTest(:,1);           %on the basis of eigen faces
    distance(i,1)=sqrt(sumsqr(diffVector));
end

[~,sortedIndex]=sort(distance);                                             %Take the label of the K nearest label
for j=1:kKNN
    pLabels(j)=TrainLabel(sortedIndex(j),1);
end

predictedLabel=mode(single(pLabels));                                       %Predict the label

end

