function theta = ISTA_1(phi, y, epsilon, lambda)
    alpha = (1.01)*max(eig(phi'*phi));
    [~,b] = size(phi);
    theta_old = randn(b,1);
    
    condition = true;
    while condition
        ax = f1(theta_old);
        z = y - phi*ax(:);
        atx = f2(phi'*z);
        
        theta_new = wthresh(theta_old + atx/alpha, 's', lambda/(2*alpha));
        
        c = norm(theta_new - theta_old);
        condition = (c > epsilon);
        
        theta_old = theta_new;
    end
    
    theta = theta_new;
end