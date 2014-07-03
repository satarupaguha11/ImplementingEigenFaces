%This function takes as input the top eigen vectors, the size by
%which we need to resize the test image and the mean image of the training
%data. It displays the test image.

function [testImage,testWeight] = unknownFaceReconstruction(topEigenVectors,meanImage)

k=size(topEigenVectors,2);

testImage=imread('H:\MS\SMAI\Assignment\Eigen Faces\reresultsspreadsheeteigenfaces\4.jpg');                                  %read image
testImage=rgb2gray(testImage);                                             %convert into gray scale
testImage=double(imresize(testImage,[100 100]));                      %resize image
testImage=reshape(testImage,[10000 1]);                             %reshape image
I1=reshape(testImage,100,100);

N=size(testImage,1);                                                        %find eigen face for the test image
subtractedTest=zeros(N,1);
subtractedTest(:,1)=testImage(:,1)-meanImage(:,1);
testWeight(1:k,1)=topEigenVectors(:,1:k)'*subtractedTest(:,1);
    
linearComb=zeros(N,1);                                                      %reconstruct image
linearComb(:,1)=linearComb(:,1)+topEigenVectors(:,1:k)*testWeight(1:k,1);
testImage=zeros(N,1);
testImage(:,1)=linearComb(:,1)+meanImage(:,1);
I2=reshape(testImage,100,100);

figure;                                                                     %display image
subplot(2,1,1), imshow(I1,[0 255]);
subplot(2,1,2), imshow(I2,[0 255]);
end

