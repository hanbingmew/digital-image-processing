f=imread('plugs.tif');
se1=strel('disk',5);
fc=imclose(f,se1);
sump=zeros(1,36);
for k=0:35
    se=strel('disk',k);
    fo=imopen(fc,se);
    sump(k+1)=sum(fo(:));
end
plot(-diff(sump));
xlabel('k');
ylabel('surface area reduction');
