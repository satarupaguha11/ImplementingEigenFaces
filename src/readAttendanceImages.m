%This function reads the Yale Dataset and returns the Image Matrix and the
%corresponding Label Matrix.It takes as input the number of images in the 
%yale dataset and the image size in which we want to resize the images

%m=483
%resize=80
function [ImageMatrix, LabelMatrix,ImageInEachClass] = readAttendanceImages( resize )

numberOfImages=483;                                                                           
N = resize*resize;                                                          %initialisation
ImageMatrix = zeros(N,numberOfImages);
LabelMatrix = zeros(numberOfImages,1);
path = 'D:\MSbyResearch\SMAI\EigenFaces\newClassAttendance\';
k = 1;

for i = 1:76                                                               %loop for each subject
                                                                            
  pathName = strcat( path, num2str( i ) );                                  %get all the files for the subject
  directory = dir( pathName );
  dirIndex = [ directory.isdir ];
  fileList = { directory( ~dirIndex ).name };
  
 
  for j = 1:length( fileList )                                              %Read each image and insert into the Image Matrix along with the label
       fileName = fileList( j );                                            %given by the folder name
       fileName = fileName{:};
       imagePath = strcat( pathName,'\',fileName );
       data = imread( imagePath );
       data = imresize( data,[ resize resize ] );
       ImageMatrix( :,k ) = reshape( data,6400,1 );
       LabelMatrix( k,1 ) = i;
       k = k+1;
  end
  disp(i)
end
ImageInEachClass = load('D:\MSbyResearch\SMAI\EigenFaces\numberOfImagesInEachClass.txt');
end
