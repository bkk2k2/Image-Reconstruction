function res = mtimes(A,x)
    y = reshape(x,[A.rn,length(A.angles)]);
    z = iradon(y, A.angles,'linear','Ram-Lak', A.c);
    res = dct2(z(:));
end