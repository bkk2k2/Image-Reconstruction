function ax = f1(y)
    ax = idwt2(reshape(y(1:16),4,4),reshape(y(17:32),4,4),reshape(y(33:48),4,4),reshape(y(49:64),4,4), 'db1');
end