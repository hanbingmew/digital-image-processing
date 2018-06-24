function I = percentile2i( h,P)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
h=h(:);
h=h/sum(h);
s=cumsum(h);
ind=find(s>P,1,'first');
I=(ind-1)/(size(h,1)-1);
end

