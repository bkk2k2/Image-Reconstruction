function  res = partb(angles, c)

res.angles = angles;
res.c = c;

% Register this variable as a partb class
res = class(res,'partb');