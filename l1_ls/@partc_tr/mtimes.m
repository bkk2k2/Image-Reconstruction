function res = mtimes(A,x)
    y_1 = reshape(x(1:A.rn*18),[A.rn,18]);
    y_2 = reshape(x(1+A.rn*18:end),[A.rn1,18]);
    z_1 = iradon(y_1, A.angles(1:18),'linear','Ram-Lak', A.c);
    z_2 = iradon(y_2, A.angles(19:36),'linear','Ram-Lak', A.c1);
    z = [z_1(:)+z_2(:); z_2(:)];
    res = dct2(z);
end