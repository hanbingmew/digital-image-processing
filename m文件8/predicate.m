function flag = predicate(region )
%UNTITLED8 此处显示有关此函数的摘要
%   此处显示详细说明
std=std2(region);
mean=mean2(region);
flag=(std>10) & (mean>0) & (mean<125);


end

