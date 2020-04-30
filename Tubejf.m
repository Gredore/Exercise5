function Tubejf = Tubejf(Re)

load('Tubejf.mat')

as = (((Tubejf(:,1) - 1)* 5./9) + 1);
bs = (((Tubejf(:,2) - 1)* 3./9) -3);

xs = linspace(1,6,100);
ys = interp1(as,bs,xs);

xs = 10.^xs;
ys = 10.^ys;

%loglog(xs, ys)

Tubejf = interp1(xs,ys,Re);