function [T,SM ] = otsuthresh( h)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
h=h(:);
h=h/sum(h);
L=size(h,1);
i=linspace(0,L-1,L);
mg=i*h;
sigmag=(i-mg).^2*h;
sigma=zeros(L,1);
for k=0:L-1
    p1=sum(h(1:k+1));
    t=0:k;
    m=t*h(1:k+1);
    sigma(k+1)= (mg*p1-m).^2./(p1*(1-p1)+eps);
end
T=(find(sigma==max(sigma))-1)/(L-1);
T=mean(T);
SM=max(sigma)/(sigmag+eps);

end

