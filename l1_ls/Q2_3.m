clear;

img = imread("slice_50.png");
[a,b] = size(img); c = max(size(img));
sq_image = zeros(c);
sq_image(1:a,1:b) = img;

thetas = randi([0 179], 1, 36);
theta = thetas(1:18);

img_1 = imread("slice_51.png");
[a1,b1] = size(img_1); c1 = max(size(img_1));
sq_image_1 = zeros(c1);
sq_image_1(1:a1,1:b1) = img_1;

theta_1 = thetas(19:36);

R = radon(sq_image,theta); rn = max(size(R));
y = R(:); x = sq_image(:);
m = 2*length(y); n = 2*length(x);

R_1 = radon(sq_image_1,theta_1); rn1 = max(size(R_1));
y_1 = R_1(:); x_1 = sq_image_1(:);

Y = [y; y_1]; X = [x; x_1];

A = partc(thetas, c, c1);
At = partc_tr(thetas, c, c1, rn, rn1);

X_recon = idct2(l1_ls(A,At,m,n,Y,10,0.01,false));

final_image = reshape(X_recon(1:c*c),[c,c]);
figure;
imshow(final_image(1:a,1:b), [0 255]);
saveas(gcf,"slice_50_part_c.png");
pause(3);
close(gcf);

final_image_1 = reshape(X_recon(1:c*c) + X_recon(1+c*c:end),[c1,c1]);
figure;
imshow(final_image(1:a1,1:b1), [0 255]);
saveas(gcf,"slice_51_part_c.png");
pause(3);
close(gcf);
