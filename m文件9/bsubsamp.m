function [s,sUnit] = bsubsamp( b,gridsep )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
max_x=max(b(:,1));
max_y=max(b(:,2));
xI=ceil((max_x+1+gridsep)/(gridsep+1));
yI=ceil((max_y+1+gridsep)/(gridsep+1));
X=zeros(xI,1);
Y=zeros(yI,1);
for i=1:xI
    X(i)=(i-1)*gridsep+i;
end
for j=1:yI
    Y(j)=(j-1)*gridsep+j;
end
[x,y]=meshgrid(Y,X);
V=[x(1:end);y(1:end)]';
p=size(b,1);
q=size(V,1);
D=sqrt(sum((repmat(permute(b,[1,3,2]),[1,q,1])-repmat(permute(V,[3,1,2]),[p,1,1])).^2,3));
new_b=zeros(p,2);
for k=1:p
    idx=find(D(k,:)==min(D(k,:)));
    new_b(k,:)=V(idx,:);
end
[s,m]=unique(new_b,'rows');
s=[s,m];
s=sortrows(s,3);
s=s(:,1:2);
sUnit=round(s./gridsep)+1;
end

