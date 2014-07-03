%This function reads the CMUPIE Dataset and and returns the Image Matrix 
%and the corresponding Label Matrix.

function [ImageMatrix, LabelMatrix, ImageInEachClass] = readCMUImages()

load('H:\MS\SMAI\Assignment\Eigen Faces\CMU-PIE\CMUPIEData.mat');            %initialisation
numberOfImages = size( CMUPIEData, 2 );
sizeOfImage = size( CMUPIEData(1).pixels, 2 );
ImageMatrix = zeros( sizeOfImage, numberOfImages );
LabelMatrix = zeros( numberOfImages, 1);
ImageInEachClass=42*ones(68,1);
for i=1:numberOfImages
    ImageMatrix( :, i ) = CMUPIEData( i ).pixels;                           %Write image into Image Matrix
    LabelMatrix( i, 1 ) = CMUPIEData( i ).label;                            %Write image into Label Matrix
end