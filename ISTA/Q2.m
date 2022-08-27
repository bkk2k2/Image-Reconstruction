clear;

data = double(imread("barbara256.png"));  %Reading image data 
[H, W] = size(data);
y = data + 2*randn(H,W); %Adding noise N(0,4) to data

dct_0 = dctmtx(8);
dct = kron(dct_0', dct_0'); %2D-DCT basis matrix

final_image = zeros(H, W); %Final image after reconstruction
counts = zeros(H, W); %No.of times a pixel occurs in any one of the patches

for i = 1:H-7
    for j = 1:W-7
        patch = data(i:i+7, j:j+7); % 8x8 patch from (i,j)
        y_patch = y(i:i+7, j:j+7); % Corresponding noisy patch
        x_recon = dct*ISTA(dct, y_patch(:), 1, 1); 
        reconstructed_patch = reshape(x_recon,8,8); %reconstructed patch
        counts(i:i+7,j:j+7) = counts(i:i+7,j:j+7) + 1; %updating counts
        final_image(i:i+7,j:j+7) = final_image(i:i+7,j:j+7) + reconstructed_patch; %updating final image variable
    end
end

final_image = final_image./counts; %averaging results for each pixel
figure;
imshow(final_image, [0 256]);
saveas(gcf,'Q2_part_a.png');
pause(3);
close(gcf);