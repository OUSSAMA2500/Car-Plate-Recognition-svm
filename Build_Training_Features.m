imagefiles = dir('Numeros/*.jpg');      
nfiles = length(imagefiles);    % Number of files found
%[x,y]=size(features);
%y=y+1
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   currentimage = imread(strcat('./Numeros/',currentfilename));
   [hog, vis] = extractHOGFeatures(currentimage,'CellSize',[4 4]);
    features(1:2916,ii)=hog;
 %  features(1:7,ii)=invmoments(currentimage);
   imshow(currentimage);
   features(2917,ii)=input('Entrez la valeur target :');
  % y=y+1;
   
end
