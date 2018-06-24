function [ f ] =adpmedian( g,Smax )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
if (Smax<=0 || Smax/2==round(Smax/2))
    error('Smax must be odd integer');
end
f=g;
f(:)=0;
alreadyProcess=false(size(g));
[m n]=size(g);
for k=3:2:Smax
    zmin=ordfilt2(g,1,ones(k,k),'symmetric');
    zmax=ordfilt2(g,k*k,ones(k,k),'symmetric');
    zmed=medfilt2(g,[k k],'symmetric');
    processB=(zmin<zmed) & (zmed<zmax);
    zB=(zmin<g) & (g<zmax);
    zxy=processB & zB;
    med=processB & ~zB;
    f(zxy)=g(zxy);
    f(med)=zmed(med);
    alreadyProcess(processB)=1;
    if all(alreadyProcess)
        break;
    end
end
f(~alreadyProcess)=zmed(~alreadyProcess);
    

end

