f=imread('bone.tif');
fs=bwmorph(f,'skel',Inf);
for k=1:80
    fs=fs & ~endpoints(fs);
end
figure,imshow(fs);
