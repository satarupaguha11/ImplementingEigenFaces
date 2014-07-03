%This function finds the top k eigen vectors on the basis of their eigen
%values. It takes as input, the Eigen Vectors, the Eigen Values and k and
%returns the top Eigen Vectors.

function [topEigenVectors] = findTopEigenVerification( eigenVectors,eigenValues,k)

sizeV=size(eigenVectors,1);                                                 %Initialisation
topEigenVectors=zeros(sizeV,k);

values=diag(eigenValues);                                                   %Find the indices of the top K eigen vectors by first sorting
[~,SortedIndex]=sort(values,'descend');                                     %the eigen values
SortedIndex=SortedIndex(2:k+1,1);

for i=1:size(SortedIndex,1)                                                 %Find the top k eigen vectors
     ind=SortedIndex(i,1);
     topEigenVectors(:,i)=eigenVectors(:,ind);
end

end