f=imread('objects.tif');
imshow(f)
hold on
[L,n]=bwlabel(f,8);
for k=1:n
    [r,c]=find(L==k);
    rbar=mean(r);
    cbar=mean(c);
    plot(round(cbar),round(rbar),'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
    hold on
     plot(round(cbar),round(rbar),'Marker','*','MarkerEdgeColor','w');
     hold on
end