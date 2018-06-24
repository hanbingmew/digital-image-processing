function d = bayesgauss( X,CA,MA,P )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
w=size(CA,3);
k=size(X,1);
if nargin==3
    P=1/w*ones(1,w);
end
MA=MA';
D=zeros(k,w);
for j=1:w
    lp(1:k,:)=log(P(j));
    dett(1:k,:)=0.5*log(det(CA(:,:,j)));
    mah=0.5*mahalanobis(X,CA(:,:,j),MA(j,:));
    if P(j)==0
        D(1:k,j)=-inf;
    else
        D(:,j)=lp-dett-mah;
    end
end
[i,j]=find(bsxfun(@eq,D,max(D,[],2)));

X=[i,j];
X=sortrows(X);
[b,m]=unique(X(:,1));
X=X(m,:);
d=X(:,2);

end

