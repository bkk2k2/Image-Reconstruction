clear;

img = imread("slice_50.png");
[a,b] = size(img); c = max(size(img));
sq_image = zeros(c);
sq_image(1:a,1:b) = img;

thetas = randi([0 179], 1, 54);
theta = thetas(1:18);

img_1 = imread("slice_51.png");
sq_image_1 = zeros(c);
sq_image_1(1:a,1:b) = img_1;

theta_1 = thetas(19:36);

img_2 = imread("slice_52.png");
sq_image_2 = zeros(c);
sq_image_2(1:a,1:b) = img_2;

theta_2 = thetas(37:54);

R = radon(sq_image,theta); rn = max(size(R));
y = R(:); x = sq_image(:);

R_1 = radon(sq_image_1,theta_1);
y_1 = R_1(:); x_1 = sq_image_1(:);

R_2 = radon(sq_image_2,theta_2);
y_2 = R_2(:); x_2 = sq_image_2(:);

m = 3*length(y); n = 3*length(x);

Y = [y; y_1; y_2]; X = [x; x_1; x_2];

A = partd(thetas, c);
At = partd_tr(thetas, c, rn);

X_recon = idct2(l1_ls(A,At,m,n,Y,10,0.01,false));

final_image = reshape(X_recon(1:c*c),[c,c]);
figure;
imshow(final_image(1:a,1:b), [0 255]);
saveas(gcf,"slice_50_part_d.png");
pause(3);
close(gcf);

final_image_1 = reshape(X_recon(1:c*c) + X_recon(1+c*c:2*c*c),[c,c]);
figure;
imshow(final_image(1:a,1:b), [0 255]);
saveas(gcf,"slice_51_part_d.png");
pause(3);
close(gcf);

final_image_2 = reshape(X_recon(1:c*c) + X_recon(1+2*c*c:end),[c,c]);
figure;
imshow(final_image(1:a,1:b), [0 255]);
saveas(gcf,"slice_52_part_d.png");
pause(3);
close(gcf);