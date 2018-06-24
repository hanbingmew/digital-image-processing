function [ VG,A,PPG] = colorgrad( f,T )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
w=-1*fspecial('sobel');
r=double(f(:,:,1));
g=double(f(:,:,2));
b=double(f(:,:,3));

rx=imfilter(r,w,'replicate');
ry=imfilter(r,w','replicate');
gx=imfilter(g,w,'replicate');
gy=imfilter(g,w','replicate');
bx=imfilter(b,w,'replicate');
by=imfilter(b,w','replicate');
gxx=rx.^2+gx.^2+bx.^2;
gyy=ry.^2+gy.^2+by.^2;
gxy=rx.*ry+gx.*gy+bx.*by;
theta=0.5*atan(2*gxy./(gxx-gyy+eps));
f=sqrt(0.5*(gxx+gyy+(gxx-gyy).*cos(2*theta)+2*gxy.*sin(2*theta)));
theta_1=theta+pi/2;
f_1=sqrt(0.5*(gxx+gyy+(gxx-gyy).*cos(2*theta_1)+2*gxy.*sin(2*theta_1)));
f=max(f,f_1);
f=mat2gray(f);
ppg=sqrt(gx.^2+gy.^2)+sqrt(rx.^2+ry.^2)+sqrt(bx.^2+by.^2);
ppg=mat2gray(ppg);
if(nargin>1)
    f(f<T)=0;
    ppg(ppg<T)=0;
end
VG=f;
A=theta;
PPG=ppg;
end

