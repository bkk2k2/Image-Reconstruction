function res = mtimes(A,x)
    y = idct2(x);
    z = reshape(y,[A.c,A.c]);
    w = radon(z, A.angles);
    res = w(:);
end