function  res = partb_tr(angles, c, rn)

res.angles = angles;
res.c = c;
res.rn = rn;

% Register this variable as a partb_tr class
res = class(res,'partb_tr');