function c = connectpoly( x,y)
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
v=[x(:),y(:)];
if ~isequal(v(1,:),v(end,:))
    v=[v;v(1,:)];
end
segment=cell(size(v,1)-1,1);
for i=2:size(v,1)
    [x,y]=intline(v(i-1,1),v(i,1),v(i-1,2),v(i,2));
    segment{i-1}=[x,y];
end
c=cat(1,segment{:});

end

