function res = mtimes(A,x)
    y = idct2(x);
    z_1 = reshape(y(1:A.c*A.c),[A.c,A.c]);
    z_2 = reshape(y(1:A.c*A.c) + y(A.c*A.c+1:end),[A.c1,A.c1]);
    w_1 = radon(z_1, A.angles(1:18));
    w_2 = radon(z_2, A.angles(19:36));
    res = [w_1(:); w_2(:)];
end