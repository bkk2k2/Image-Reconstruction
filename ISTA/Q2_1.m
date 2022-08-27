clear;

data = double(imread("barbara256.png")); %Reading Image Data
[H, W] = size(data);

dct_0 = dctmtx(8);
dct = kron(dct_0', dct_0'); %2D-DCT Basis Matrix

final_image = zeros(H, W); %Final image after reconstruction
counts = zeros(H, W); %No.of times a pixel occurs in any one of the patches

for i = 1:H-7
    for j = 1:W-7
        patch = data(i:i+7, j:j+7); % 8x8 patch from (i,j)
        phi = randn(32, 64); % Random phi, each element is from N(0,1)
        
        y = phi*patch(:);
        A = phi*dct;
        
        x_recon = dct*ISTA(A, y, 0.1, 1);
        
        reconstructed_patch = reshape(x_recon,8,8); % reconstructed patch
        
        counts(i:i+7,j:j+7) = counts(i:i+7,j:j+7) + 1;
        final_image(i:i+7,j:j+7) = final_image(i:i+7,j:j+7) + reconstructed_patch;
    end
end

final_image = final_image./counts; % final image by averaging results from overlapping patches
figure;
imshow(final_image, [0 256]);
saveas(gcf,'Q2_part_b.png');
pause(3);
close(gcf);

mse = norm(final_image(:) - data(:))/norm(data(:))