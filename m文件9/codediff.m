function d = codediff( fcc,conn )
%UNTITLED8 此处显示有关此函数的摘要
%   此处显示详细说明
f_shift=circshift(fcc,[0,-1]);
delta=f_shift-fcc;
idx=find(delta<0);
if conn==4
    delta(idx)=delta(idx)+4;
else 
    delta(idx)=delta(idx)+8;
end
d=[delta(end),delta(1:end-1)];
end

