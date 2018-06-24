function [rgb ] = hsi2rgb( hsi )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
h=hsi(:,:,1)*2*pi;
s=hsi(:,:,2);
i=hsi(:,:,3);
h_1=(h>=0) & (h<2*pi/3);
h_2=(h>=2*pi/3) & (h<4*pi/3);
h_3=(h>=4*pi/3) & (h<2*pi);
h(h_2)=h(h_2)-2*pi/3;
h(h_3)=h(h_3)-4*pi/3;
r=h;r(:)=0;
g=h;g(:)=0;
b=h;b(:)=0;
h_4=i.*(1+s.*cos(h)./(cos(pi/3-h)));
h_5=i.*(1-s);
r(h_1)=h_4(h_1);
b(h_1)=h_5(h_1);
g_1=3*i-r-b;
g(h_1)=g_1(h_1);
r(h_2)=h_5(h_2);
g(h_2)=h_4(h_2);
b_1=3*i-r-g;
b(h_2)=b_1(h_2);
g(h_3)=h_5(h_3);
b(h_3)=h_4(h_3);
r_1=3*i-g-b;
r(h_3)=r_1(h_3);
rgb=cat(3,r,g,b);

end

