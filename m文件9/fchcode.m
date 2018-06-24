function c = fchcode( b,conn,dir )
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
if nargin<3
    dir='same';
end
if nargin<2
    conn=8;
end
if isequal(b(1,:),b(end,:))
    b=b(1:end-1,:);
end
x0=b(1,1);
y0=b(1,2);
c.x0y0=[x0,y0];
deltax=[0 -1 -1 -1 0 1 1 1]';
deltay=[1 1 0 -1 -1 -1 0 1]';
z=4*(deltax+2)+deltay+2;
C(z)=(0:7)';
b_shift=circshift(b,[-1,0]);
delta=b_shift-b;
idx=4*(delta(:,1)+2)+delta(:,2)+2;
fcc=C(idx);
if strcmp(dir,'reverse')
    fcc=coderev(fcc);
end
if conn==4
    if isempty(find(fcc==1 || fcc==3 || fcc==5 || fcc==7))
        fcc=fcc/2;
    else error('no 4-connect');
    end
end
c.fcc=fcc;
c.diff=codediff(c.fcc,conn);
c.mm=maxmag(c.fcc);
c.diffmm=codediff(c.mm,conn);
end

