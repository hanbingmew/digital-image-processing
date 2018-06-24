function [ r,R,S ] = imnoise3( M,N,C,A,B)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
R=zeros(M,N);
k=size(C,1);
if nargin<5
    B=zeros(k,2);
end
if nargin<4
    A=ones(1,k);
end
for j=1:k
    R(floor(M/2)+1-C(j,1),floor(N/2)+1-C(j,2))=1i*A(1,j)*M*N*exp(-1i*2*pi*(C(j,1)*B(j,1)/M+C(j,2)*B(j,2)/N))/2;
    R(floor(M/2)+1+C(j,1),floor(N/2)+1+C(j,2))=-1i*A(1,j)*M*N*exp(1i*2*pi*(C(j,1)*B(j,1)/M+C(j,2)*B(j,2)/N))/2;
end
S=abs(R);
r=real(ifft2(ifftshift(R)));

end

