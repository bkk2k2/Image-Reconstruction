clear;

img_1 = imread("slice_50.png");
img_2 = imread("slice_51.png");

theta_1 = randi([0 179], 1, 18);
theta_2 = randi([0 179], 1, 18);

R_1 = radon(img_1, theta_1);
R_2 = radon(img_2, theta_2);

I_1 = iradon(R_1, theta_1, 'linear', 'Ram-Lak');
I_2 = iradon(R_2, theta_2, 'linear', 'Ram-Lak');

figure;
imshow(I_1, [0 255]);
saveas(gcf,"slice_50_part_a.png");
pause(3);
close(gcf);

figure;
imshow(I_2, [0 255]);
saveas(gcf,"slice_51_part_a.png");
pause(3);
close(gcf);