function [ R ] = somme( m )
[x y]=size(m);
for i=1:x
R(i)=sum(m(i,:)==0);
end

end

