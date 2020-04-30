clear all

%load('D_in.mat')
load('OUT.mat')
load('New_D_in.mat')
%Input of form: OD(inch) Length(ft) ID(inch) Pt/Od% A(m2) TubePass ...
% K1 n1 BaffleSpacingFraction BaffleCutPercent TubeThermalConductivity ...
% TubeNozzelVHeadLosses TubeNozzleD ShellNozzleD
% TubeS TubeCost TubeTherm TubeDen TubeYoung
% ShellS ShellCost ShellDen ShellYoung

%Data of form: TubeArea TubeNum TubePerPass TubeVelocity BundleDiam ...
%ShellDiam TubeRe TubePr hi As de ShellVelocity ShellRe ShellPr hs U ...
%TubeDP ShellDP NewArea
% 



%D_in = OUT(28000:29000, :);
%D_in = OUT;
D_in = New_D_in;
%q = randsample(size(OUT,1),1000);
%D_in=OUT(q,:);

N = size(D_in,1);

global D
global h
parforWaitbar(N)


parfor row = 1:N
    
    D_in_row = D_in(row, :);
    
    
    %As = [D_in_row(5)];
    Iterations = 0;
    update_data = [0 2]; %Arbitrary number to allow first iteration
    last_tubes = 0;
    %(update_data(2) - last_tubes);
    while (abs(update_data(2) - last_tubes) > 0 && Iterations < 20) || Iterations < 2
        last_tubes = update_data(2);
        update_data = Main(D_in_row);
        %[last_tubes,update_data(2)]
        D_in_row(5) = update_data(19);

        %As = [As update_data(19)];        
        Iterations = Iterations + 1;
    end
    data(row,:) = update_data;
    %plot(As) %Can be used to show converging
    send(D, row);
end
close(h)
