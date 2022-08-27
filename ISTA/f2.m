function atx = f2(y)
    [a,b,c,d] = dwt2(reshape(y,8,8), 'db1');
    atx = [a(:);b(:);c(:);d(:)];
end