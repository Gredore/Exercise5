function Shelljh = Shelljh(Re, BafflePercent)

load('Shelljh15.mat')
load('Shelljh25.mat')
load('Shelljh35.mat')
load('Shelljh45.mat')


if BafflePercent == 15
    as = (((Shelljh15(:,1) - 1)* 5./9) + 1);
    bs = (((Shelljh15(:,2) - 1)* 3./9) -3);
    
elseif BafflePercent == 25
    as = (((Shelljh25(:,1) - 1)* 5./9) + 1);
    bs = (((Shelljh25(:,2) - 1)* 3./9) -3);

elseif BafflePercent == 35
    as = (((Shelljh35(:,1) - 1)* 5./9) + 1);
    bs = (((Shelljh35(:,2) - 1)* 3./9) -3);

elseif BafflePercent == 45
    as = (((Shelljh45(:,1) - 1)* 5./9) + 1);
    bs = (((Shelljh45(:,2) - 1)* 3./9) -3);

end
    

xs = linspace(1,6,100);
ys = interp1(as,bs,xs);

xs = 10.^xs;
ys = 10.^ys;

%loglog(xs, ys)

Shelljh = interp1(xs,ys,Re);