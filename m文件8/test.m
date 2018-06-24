f=imread('house.tif');
gcanny=edge(f,'canny',[0.04 0.10],1.5);
[H,theta,rho]=hough(gcanny,'ThetaResolution',0.2);
peaks=houghpeaks(H,5);
lines=houghlines(gcanny,theta,rho,peaks);
imshow(gcanny);
hold on
for k=1:length(lines)
    xy=[lines(k).point1;lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',4,'Color',[0.8 0.8 0.8]);
end