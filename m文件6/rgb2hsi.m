function [hsi ] = rgb2hsi( rgb )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
rgb=im2double(rgb);
r=rgb(:,:,1);
g=rgb(:,:,2);
b=rgb(:,:,3);
theta=acos((r*2-g-b)./(sqrt((r-g).^2+(r-b).*(g-b))+eps)/2);
theta=abs(theta./(2*pi));
h=theta;
h(b<=g)=theta(b<=g);
h(b>g)=1-theta(b>g);
m=min(min(r,g),b);
s=1-(3./(r+g+b+eps)).*m;
i=(r+g+b)./3;
hsi=cat(3,h,s,i); 

end

