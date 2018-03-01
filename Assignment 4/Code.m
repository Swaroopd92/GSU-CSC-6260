im = imread('blood256.gif');
[cA,cH,cV,cD] = dwt2(im,'Haar');
figure();
imagesc(cV);
colormap(gray);
z = zeros(size(cA));

%a
imR = idwt2(cA,z,z,z,'Haar');
imr=imR;

imr = uint8(imr);
figure();
imagesc(imr);
colormap(gray);
mse1 = immse(imr,im);

%b
imR = idwt2(cA,cH,z,z,'Haar');
imr=imR;
imr = uint8(imr);
figure();
imagesc(imr);
colormap(gray);
mse2 = immse(imr,im);

%2
im1=imnoise(im,'gaussian',0,0.09);
im2=imnoise(im,'salt & pepper',0.25);
im3=imnoise(im,'speckle',0.20);

figure();
imshow(im1);
title('Gaussian noise');

figure();
imshow(im2);
title('Salt and pepper');

figure();
imshow(im3);
title('Speckle');

im1h=wdencmp('gbl',im1,'db2',3,30,'h',1);
im2h=wdencmp('gbl',im2,'db2',3,30,'h',1);
im3h=wdencmp('gbl',im3,'db2',3,30,'h',1);

figure();
imshow(im1h);
colormap(gray);
title('Gaussian denoise hard threshold');

figure();
imshow(im2h);
title('Salt and pepper denoise hard threshold');

figure();
imshow(im3h);
title('Speckle_denoise_hard_threshold');

im1s=wdencmp('gbl',im1,'db2',3,30,'s',1);
im2s=wdencmp('gbl',im2,'db2',3,30,'s',1);
im3s=wdencmp('gbl',im3,'db2',3,30,'s',1);


figure();
imshow(im1s);
title('Gaussian_denoise_soft_threshold');

figure();
imshow(im2s);
title('Salt and pepper_denoise_soft_threshold');

figure();
imshow(im3s);
title('Speckle_denoise_soft_threshold');

im1h = uint8(im1h);
im2h = uint8(im1h);
im3h = uint8(im1h);

im1s = uint8(im1s);
im2s = uint8(im2s);
im3s = uint8(im3s);

im1h_mse=immse(im1,im1h);
im2h_mse=immse(im2,im2h);
im3h_mse=immse(im3,im3h);

im1s_mse=immse(im1,im1s);
im2s_mse=immse(im2,im2s);
im3s_mse=immse(im3,im3s);

%3
im1hs=wdencmp('gbl',im1,'sym2',3,30,'h',1);
im2hs=wdencmp('gbl',im2,'sym2',3,30,'h',1);
im3hs=wdencmp('gbl',im3,'sym2',3,30,'h',1);

figure();
imshow(im1hs);
title('Gaussian denoise hard threshold');

figure();
imshow(im2hs);
title('Salt and pepper_denoise_hard_threshold');

figure();
imshow(im3hs);
title('Speckle_denoise_hard_threshold');

im1ss=wdencmp('gbl',im1,'sym2',3,30,'s',1);
im2ss=wdencmp('gbl',im2,'sym2',3,30,'s',1);
im3ss=wdencmp('gbl',im3,'sym2',3,30,'s',1);


figure();
imshow(im1ss);
title('Gaussian_denoise_soft_threshold');

figure();
imshow(im2ss);
title('Salt and pepper_denoise_soft_threshold');

figure();
imshow(im3ss);
title('Speckle_denoise_soft_threshold');

im1hs = uint8(im1hs);
im2hs = uint8(im1hs);
im3hs = uint8(im1hs);

im1ss = uint8(im1ss);
im2ss = uint8(im2ss);
im3ss = uint8(im3ss);

im1hs_mse=immse(im1,im1hs);
im2hs_mse=immse(im2,im2hs);
im3hs_mse=immse(im3,im3hs);

im1ss_mse=immse(im1,im1ss);
im2ss_mse=immse(im2,im2ss);
im3ss_mse=immse(im3,im3ss);

%4

im1c=imnoise(imr,'gaussian',0,0.09);
im2c=imnoise(imr,'salt & pepper',0.25);
im3c=imnoise(imr,'speckle',0.20);

im1c = double(im1c);
im2c = double(im2c);
im3c = double(im3c);

x = dct2(im1c);
y = dct2(im2c);
z = dct2(im3c);



