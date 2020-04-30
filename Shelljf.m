function Shelljf = Shelljf(Re, BafflePercent)

load('Shelljf15.mat')
load('Shelljf25.mat')
load('Shelljf35.mat')
load('Shelljf45.mat')


if BafflePercent == 15
    as = (((Shelljf15(:,1) - 1)* 5./9) + 1);
    bs = (((Shelljf15(:,2) - 1)* 3./9) -2);
    
elseif BafflePercent == 25
    as = (((Shelljf25(:,1) - 1)* 5./9) + 1);
    bs = (((Shelljf25(:,2) - 1)* 3./9) -2);

elseif BafflePercent == 35
    as = (((Shelljf35(:,1) - 1)* 5./9) + 1);
    bs = (((Shelljf35(:,2) - 1)* 3./9) -2);

elseif BafflePercent == 45
    as = (((Shelljf45(:,1) - 1)* 5./9) + 1);
    bs = (((Shelljf45(:,2) - 1)* 3./9) -2);

end
    

xs = linspace(1,6,100);
ys = interp1(as,bs,xs);

xs = 10.^xs;
ys = 10.^ys;

%loglog(xs, ys)

Shelljf = interp1(xs,ys,Re);
