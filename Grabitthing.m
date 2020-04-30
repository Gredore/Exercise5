%grabit('Shelljh.jpg')
clear all 

load('Shelljf25.mat')

Shelljf25(:,1) = (((Shelljf25(:,1) - 1)* 5./9) + 1);

Shelljf25(:,2) = (((Shelljf25(:,2) - 1)* 3./9) -2);

xs = linspace(1,6,100);
ys = interp1(Shelljf25(:,1),Shelljf25(:,2),xs);

xs = 10.^xs;
ys = 10.^ys;

loglog(xs, ys)

vq = interp1(xs,ys,12800)
