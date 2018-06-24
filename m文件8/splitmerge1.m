function g = splitmerge1( f,mindim,fun )
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
[m,n]=size(f);
x=2^nextpow2(m);
y=2^nextpow2(n);
f=padarray(f,[x-m,y-n],'post');
Z=qtdecomp(f,@split_test,mindim,fun);
block_max=full(max(Z(:)));
g=zeros(size(f));
maker=zeros(size(f));
for k=1:block_max
    [val,r,c]=qtgetblk(f,Z,k);
    if ~isempty(val)
        for i=1:length(r)
            xlow=r(i);ylow=c(i);
            xhigh=xlow+k-1;yhigh=ylow+k-1;
            region=f(xlow:xhigh,ylow:yhigh);
            if fun(region)==1
                g(xlow:xhigh,ylow:yhigh)=1;
                maker(xlow,ylow)=1;
            end
        end
    end
end
g=bwlabel(imreconstruct(maker,g));
g=g(1:m,1:n);
    
end

