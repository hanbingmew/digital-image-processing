function g = movingthresh( f,n,K)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
[m,t]=size(f);
f=tofloat(f);
f(2:2:end,:)=fliplr(f(2:2:end,:));
f=f';
f=f(:);
h=filter(ones(1,n)/n,1,f);
g=f>K*h;
g=reshape(g,t,m);
g=g';
g(2:2:end,:)=fliplr(g(2:2:end,:));

end

