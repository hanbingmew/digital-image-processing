function mean = localmean( f,nhood )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
if nargin==1
    nhood=ones(3,3)/9;
else nhood=nhood/sum(nhood(:));
end
mean=imfilter(f,nhood,'replicate');

end

