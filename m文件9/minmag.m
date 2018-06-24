function z = minmag( c )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
idx=find(c==min(c));
s=zeros(length(idx),length(c));
for i=1:length(idx)
    s(i,:)=circshift(c,[0,-(idx(i)-1)]);
end
for j=2:length(c)
    ind=find(s(:,j)==min(s(:,j)));
    s=s(ind,:);
end
z=s;

end

