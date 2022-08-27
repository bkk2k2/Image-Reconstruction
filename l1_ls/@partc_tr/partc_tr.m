function  res = partc_tr(angles, c, c1, rn, rn1)

res.angles = angles;
res.c = c; res.c1 = c1;
res.rn = rn; res.rn1 = rn1;

% Register this variable as a partc_tr class
res = class(res,'partc_tr');