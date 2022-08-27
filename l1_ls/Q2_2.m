clear;

img = imread("slice_50.png");
[a,b] = size(img); c = max(size(img));
sq_image = zeros(c);
sq_image(1:a,1:b) = img;

theta = randi([0 179], 1, 18);
R = radon(sq_image,theta); rn = max(size(R));
y = R(:); x = sq_image(:);
m = length(y); n = length(x);

A = partb(theta, c);
At = partb_tr(theta, c, rn);

x_recon = idct2(l1_ls(A,At,m,n,y,5,0.01,false));

final_image = reshape(x_recon,[c,c]);
figure;
imshow(final_image(1:a,1:b), [0 255]);
saveas(gcf,"slice_50_part_b.png");
pause(3);
close(gcf);

img_1 = imread("slice_51.png");
[a1,b1] = size(img_1); c1 = max(size(img_1));
sq_image_1 = zeros(c1);
sq_image_1(1:a1,1:b1) = img_1;

theta_1 = randi([0 179], 1, 18);
R_1 = radon(sq_image_1,theta_1); rn1 = max(size(R_1));
y_1 = R_1(:); x_1 = sq_image_1(:);

A_1 = partb(theta_1, c1);
At_1 = partb_tr(theta_1, c1, rn1);

x_recon_1 = idct2(l1_ls(A_1,At_1,m,n,y_1,5,0.01,false));

final_image_1 = reshape(x_recon_1,[c1,c1]);
figure;
imshow(final_image_1(1:a1,1:b1), [0 255]);
saveas(gcf,"slice_51_part_b.png");
pause(3);
close(gcf);