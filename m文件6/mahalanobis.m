function [d,mx,cx] = mahalanobis(varargin)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
y=varargin{1};
if nargin==2
    x=varargin{2};
    mx=sum(x,1)./size(x,1);
    mx=mx';
    cx=zeros(size(x,2),size(x,2));
    for k=1:size(x,1)
        cx=cx+(x(k,:)'-mx)*(x(k,:)'-mx)';
    end
    cx=cx./(size(x,1)-1);
else cx=varargin{2};
     mx=varargin{3};

end


d=zeros(size(y,1),1);
for k=1:size(y,1)
    yc=y(k,:)'-mx;
    d(k)=yc'*inv(cx)*yc;
end




end

