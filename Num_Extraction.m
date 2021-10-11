function Num_Extraction( bw )
close all;
mat=bw;
se=strel('square', 1);
mat=imdilate(mat,se);
mat=imcomplement(mat);
mat=imclearborder(mat);
mat=imcomplement(mat);

[x,y]=size(mat);
Proj=somme(mat);
figure(12);
subplot(3,1,1)
plot(Proj);
title('Horizontale');
subplot(3,1,2)
plot(sommev(mat));
title('Verticale');
subplot(3,1,3)
imshow(mat);
i=1;
n=1;
[x y]=size(mat);
chiffres=ones(x,round(y/6));
chif=ones(40,40);
chiffres1=ones(40,40);
final=ones(40,40);
j=1;
f=1;

for i=find(Proj):(y-1)
   if(Proj(1,i)==0)
   if (Proj(1,i+1)~=0)
    f=f+1;
    j=1;
    xproj=somme(chiffres);
    yproj=sommev(chiffres);
    x1=find(yproj,1);
    y1=find(yproj,1,'last');
    x2=find(xproj,1);
    y2=find(xproj,1,'last');
    ch=ones(x,y2);
    ch=imcrop(chiffres,[x2,x1,y2-x2,y1-x1]);
    chiffres1=imresize(ch,[40,40]);
     figure(f)
       imshow(chiffres1);
       imagefiles = dir('Numeros/*.jpg'); 
       nfiles = length(imagefiles);
       nfiles=nfiles+1;
       ui=num2str(nfiles-1);
       ui=strcat('./Numeros/',ui,'.jpg');
       chif=imresize(chiffres1,[40 40]);
       final=chif;
       imwrite(final,ui,'JPG');
    
       chiffres=ones(x,round(y/6));
   end
   else
     chiffres(:,j)=mat(:,i);
     j=j+1;
   end
   
end
f=f+1;
 xproj=somme(chiffres);
    yproj=sommev(chiffres);
    x1=find(yproj,1);
    y1=find(yproj,1,'last');
    x2=find(xproj,1);
    y2=find(xproj,1,'last');
    ch=ones(x,y2);
    ch=imcrop(chiffres,[x2,x1,y2-x2,y1-x1]);
    chiffres1=imresize(ch,[40,40]);
    figure(f)
       imshow(chiffres1);
       imagefiles = dir('Numeros/*.jpg'); 
       nfiles = length(imagefiles);
       nfiles=nfiles+1;
       ui=num2str(nfiles-1);
       ui=strcat('./Numeros/',ui,'.jpg');
       chif=imresize(chiffres1,[40 40]);
       final=chif;
       imwrite(final,ui,'JPG');
     
       chiffres=ones(x,round(y/6));
end

