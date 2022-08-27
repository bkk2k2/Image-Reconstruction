function theta = ISTA(A, y, epsilon, lambda)

    alpha = (1.01)*max(eig(A'*A));
    [~,b] = size(A);
    theta_old = randn(b,1);
    
    condition = true;
    while condition
        theta_new = wthresh(theta_old + (A'*(y - A*theta_old))/alpha, 's', lambda/(2*alpha));
        c = norm(theta_new - theta_old);
        condition = (c > epsilon);
        theta_old = theta_new;
    end
    
    theta = theta_new;
end