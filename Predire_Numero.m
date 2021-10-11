  imagefiles = dir('Numeros/*.jpg');      
  nfiles = length(imagefiles);    % Number of files found
  data=zeros(2916,nfiles);
 for i=1:nfiles
   im = imagefiles(i).name;
   im= imread(strcat('./Numeros/',im));
     data(:,i)=extractHOGFeatures(im,'CellSize',[4 4]);
 end
 
  num=SVM.predictFcn(data);
  figure,subplot(2,1,1)
  imshow(matricule);
  subplot(2,1,2),imshow(bw);
   num=transpose(num)
  etat_matricule='voiture avec matricule valable';
  if (num(6)==0)% teste de sixiem chiffre 
  etat_matricule='voiture avec matriculation provisoire 0016';
  end
  
 display(etat_matricule);
  %delete('./Numeros/*');%supprimer les images numeros