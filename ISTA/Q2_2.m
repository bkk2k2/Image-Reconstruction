clear;

data = double(imread("barbara256.png")); %Reading Image data
[H, W] = size(data);

final_image = zeros(H, W); %Final image after reconstruction
counts = zeros(H, W); %No.of times a pixel occurs in any one of the patches
z = 0;

for i = 1:H-7
    for j = 1:W-7
        patch = data(i:i+7, j:j+7); % 8x8 patch from (i,j)
        phi = randn(32, 64); % Random phi, each element is from N(0,1)
        
        y = phi*patch(:);
        
        x_recon = f1(ISTA_1(phi, y, 10, 1));
        
        reconstructed_patch = reshape(x_recon,8,8);
        
        counts(i:i+7,j:j+7) = counts(i:i+7,j:j+7) + 1;
        final_image(i:i+7,j:j+7) = final_image(i:i+7,j:j+7) + reconstructed_patch;
        z = z+1;
    end
end

final_image = final_image./counts;
figure;
imshow(final_image, [0 256]);
saveas(gcf,'Q2_part_c.png');
pause(3);
close(gcf);

mse = norm(final_image(:) - data(:))/norm(data(:))
