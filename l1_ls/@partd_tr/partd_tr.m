function  res = partd_tr(angles, c, rn)

res.angles = angles; res.c = c; res.rn = rn;

% Register this variable as a partd_tr class
res = class(res,'partd_tr');