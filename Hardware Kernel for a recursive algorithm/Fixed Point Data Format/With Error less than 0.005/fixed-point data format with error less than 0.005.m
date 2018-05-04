x=(rand(1000,1)-0.5)*4;
mn=min(x(:))
mx=max(x(:))
abs(min(x));
xm=max(max(x),abs(min(x)));
wint=ceil(log2(xm))
trf=ceil(log2(1/(0.005*2)))
