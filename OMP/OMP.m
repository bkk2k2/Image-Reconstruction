function x = OMP(A, y, epsilon)
    [a,b] = size(A);
    r = y; theta = 0; list = [];
    k2 = 0;
    while (((norm(r))^2 > epsilon) && (k2 < a))
        dots = r'*A./norm(A,1);
        [m, j] = max(abs(dots));
        list = [list j];
        A1 = A(:,list);
        theta = (A1'*A1)\(A1'*y);
        r = y - A1*theta;
        [k1, k2] = size(list);
    end
    x = zeros(b,1);
    z = 1;
    for i = list
        x(i) = theta(z);
        z = z+1;
    end
end