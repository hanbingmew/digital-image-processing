function cr = coderev( fcc )
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明
cr=fliplr(fcc);
idx1=find(cr<4);
idx2=find(cr>=4);
cr(idx1)=cr(idx1)+4;
cr(idx2)=cr(idx2)-4;

end

