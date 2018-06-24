f=imread('skeleton.tif');
g=intrans(f,'gamma',0.3);
subplot(121),imshow(f);
subplot(122),imshow(g);
