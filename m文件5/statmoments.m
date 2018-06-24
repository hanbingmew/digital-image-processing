function [ v,unv ] = statmoments( p,n )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
l=length(p);
p=p./(sum(p(:)));
m=linspace(1,l,l);
m_u=m./max(m(:));
v=zeros(1,n);
v(1)=m_u*p;
for i=2:n
    v(i)=((m_u-v(1)).^i)*p;
end
if nargin>1
    unv=zeros(1,n);
    unv(1)=m*p;
    for j=2:n
        unv(j)=((m-unv(1)).^j)*p;
    end
end

end

