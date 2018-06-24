function cp = cornerprocess( c,T,q)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
cp=c>T;
B=ones(q);
cp=imdilate(cp,B);
cp=bwmorph(cp,'shrink','Inf');

end

