f=imread('finger.tif');
T=mean2(f);
done=0;
count=0;
while ~done
    count=count+1;
    g1=f(f<T);
    g2=f(f>=T);
    m1=mean2(g1);
    m2=mean2(g2);
    Tnext=0.5*(m1+m2);
    done=abs(T-Tnext)<0.5;
    T=Tnext;
end
g=im2bw(f,T/255);
    