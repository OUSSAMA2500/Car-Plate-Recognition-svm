mat=imread('digit.jpg');
mat=im2bw(mat);
proj=sommev(mat);
plot(proj);
[x y]=size(mat);
j=1;
for i=find(proj):(x-1)
 if(proj(1,i)==0)
     if (proj(1,i+1)~=0)
       imshow (ligne);
       [z p]=size(ligne);
       j=1;
       Num_Extraction(ligne);
       ligne=ones(z,p);
     end
 else
     ligne(j,:)=mat(i,:);
     j=j+1;
 end
end

