function [ f ] = twodsin1( A,u0,v0,M,N )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
c=0:N-1;
r=0:M-1;
[C R]=meshgrid(c,r);
f=A*sin(u0*R+v0*C);

end

