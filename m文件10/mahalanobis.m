function D = mahalanobis(varargin )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
Y=varargin{1};
Y=double(Y);
if nargin==2
    X=varargin{2};
    MX=mean(X,1);
    m=bsxfun(@minus,X,MX);
    k=size(X,1);
    CX=(m'*m)/(k-1);
end
if nargin==3
    CX=varargin{2};
    MX=varargin{3};
end
n=bsxfun(@minus,Y,MX);
D=zeros(size(Y,1),1);
for i=1:size(Y,1)
    D(i,1)=n(i,:)/CX*n(i,:)';
end

end

