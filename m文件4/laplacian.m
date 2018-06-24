f=imread('blurry_moon.tif');
[f,revertclass]=tofloat(f);
f = (f-min(f(:)))/(max(f(:))-min(f(:))+eps);
PQ=paddedsize(size(f));
[U,V]=dftuv(PQ(1),PQ(2));
H=-4*pi*pi*(U.^2+V.^2);
g=dftfilt(f,H);
g1=f-g./max(abs(g(:)));
g1=imadjust(g1,[],[0 1]);


w=[1 1 1;1 -8 1;1 1 1];
f1=imread('blurry_moon.tif');
f1=tofloat(f);
g2=f1-imfilter(f,w,'replicate');
g2=imadjust(g2,[],[0 1]);
subplot(121);imshow(g1,[]);
subplot(122);imshow(g2,[]);

