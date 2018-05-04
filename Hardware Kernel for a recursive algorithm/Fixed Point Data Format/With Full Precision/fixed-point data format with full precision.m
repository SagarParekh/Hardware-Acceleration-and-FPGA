x=(rand(1000,1)-0.5)*4;
y=1;
z=0;
t=1/input_sample_rate;
xt.time = 0;
xt.signals.values = x;
xt.signals.dimensions = 1;
for i=1:100
    y=y.*x;
    z=z+y;
end

z;
zm=max(max(z),abs(min(z)));
wint=ceil(log2(zm))
trf=ceil(log2(1/(0.005*2)))*i