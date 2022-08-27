clear;

H = 120; W = 240; T = 3;

video = mmread('cars.avi',1:T); %extracted first T frames
data = zeros(H,W,T);
for i = 1:T
    I = rgb2gray(video.frames(i).cdata);
    data(:,:,i) = I(end-(H-1):end,end-(W-1):end); %Took the right corner H*W image in each frame
end

code_pattern = randi([0 1], H, W, T);  %Code Pattern
coded_snapshot = sum(code_pattern.*data,3) + 2*randn(H, W); %Added Noise
figure;
imshow(coded_snapshot, [0 T*255]);
saveas(gcf,sprintf('%d_coded_snapshot.png',T));  %Coded Snapshot
pause(3);
close(gcf);

dct_0 = dctmtx(8);
dct_1 = kron(dct_0,dct_0);
dct = blkdiag(dct_1,dct_1,dct_1)';     %psi - 2D DCT matrix

final_recon_image = zeros(H,W,T);
counts = zeros(H,W,T);   %For counting no.of times a pixel appears in any patch

for i = 1:(H-7)
    for j = 1:(W-7)
        
        %Taking all possible 8*8 patches in the image
        patch_original = data(i:i+7,j:j+7,:);
        code_patch = code_pattern(i:i+7,j:j+7,:);
        coded_snap_patch = coded_snapshot(i:i+7,j:j+7,:);
        counts(i:i+7,j:j+7,:) = counts(i:i+7,j:j+7,:) + 1;
        
        b = coded_snap_patch(:);  % y in y = A*theta
        
        A = [];
        for k = 1:T
            c = code_patch(:,:,k);
            A = [A diag(c(:))]; % phi
        end
        
        A = A*dct; % A = phi*psi, psi is dct here
        x_recon = dct*OMP(A,b,2300); % x = dct*theta
        reconstructed_patch = reshape(x_recon,8,8,[]);
        final_recon_image(i:i+7,j:j+7,:) = final_recon_image(i:i+7,j:j+7,:) + reconstructed_patch;
 
    end
end

final_recon_image = final_recon_image./counts;

mse = [];

for k = 1:T
    original_frame = data(:,:,k);
    reconstructed_frame = final_recon_image(:,:,k);
    mse_frame = (norm(reconstructed_frame(:) - original_frame(:)))/(norm(original_frame(:)));
    mse = [mse mse_frame^2];
    figure;
    imshow(reconstructed_frame, [0 255]);
    saveas(gcf,sprintf('%d_%d.png',T,k));
    pause(3);
    close(gcf);
end
