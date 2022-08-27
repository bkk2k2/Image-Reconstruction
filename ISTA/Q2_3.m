clear;

x = zeros(100,1);

coeffs = randi([1 100],10,1);
numbers = randi([1 10], 10, 1);

x(coeffs) = numbers;

sd = norm(x)/20;

h = [1,2,3,4,3,2,1]/16;
[~,N] = size(h);

y = conv(h,x) + sd*randn(100+N-1,1);

A = zeros(100+N-1,100);

for i = 1:100+N-1
    if i<N
       A(i,1:i) = h(N-i+1:N);
    elseif i<101
        A(i,i-N+1:i) = h;
    else
        A(i,i-N+1:100) = h(1:100+N-i);
    end
end

x_recon = ISTA(A,y,0.001,1);