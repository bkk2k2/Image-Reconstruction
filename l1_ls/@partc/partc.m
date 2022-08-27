function  res = partc(angles, c, c1)

res.angles = angles;
res.c = c; res.c1 = c1;

% Register this variable as a partc class
res = class(res,'partc');