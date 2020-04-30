function data = Sens_New_U(D_in, data, Water, IPA)

%Water = [32.5 4182 0.617 995 7.92 * 10^(-4) D_in(26) 1500];
%IPA = [70 3180 0.125 736 6.56 * 10^(-4) 22.2 5000];


%Input of form: OD(inch) Length(ft) ID(inch) Pt/Od A(m2) TubePass ...
% K1 n1 BaffleSpacingFraction BaffleCutPercent TubeThermalConductivity ...
% TubeNozzelVHeadLosses TubeNozzleD ShellNozzleD
%  

%Data of form: TubeArea TubeNum TubePerPass TubeVelocity BundleDiam ...
%ShellDiam TubeRe TubePr hi As de ShellVelocity ShellRe ShellPr hs U ...
%TubeDP ShellDP NewArea Tubeminthickness Shellminthickness
%ShellcurvedendOUTERminthickness ShellcurvedendINNERminthickness %ShellFlatend(channelcover)minthickness %
%TubeSheetBendingThickness TubeSheetShearThickness Volumeoftubematerial
%Volumeofshellmaterial TubeCost ShellCost TotalCost Shellthicknessused COUNT

data(4) = (Water(6) ./ Water(4)) ./ (data(3) * 3.14159 * 0.25 * (D_in(3) * 2.54 * 10^(-2)).^2);
data(7) = Water(4) * data(4) * D_in(3) * 2.54 * 10^(-2) ./ Water(5);
data(8) = Water(2) * Water(5) ./ Water(3);
data(9) = 4200 .* (1.35 + 0.02*Water(1)) .* data(4).^(0.8) ./ (D_in(3) .* 2.54 * 10)^0.2;
data(12) = IPA(6) ./ (IPA(4) * data(10));
data(13) = IPA(4) * data(12) * data(11) ./ IPA(5);
data(14) = IPA(2) * IPA(5) ./ IPA(3);
data(15) = Shelljh(data(13),D_in(10)) * data(13) * data(14).^0.33 * IPA(3)./data(11);
data(16) = 1/ ((1/data(15)) + (1/IPA(7)) + ((D_in(1) * 2.54 * 10^(-2) * log(D_in(1)./D_in(3)))./(2 * D_in(17))) + ((D_in(1)./D_in(3)).*((1/Water(7))+(1/data(9)))));
data(17) = ((Water(4) * ((data(4)).^2) ./2) * ((D_in(6) .* ((8 * Tubejf(data(7)) * (12 * D_in(2) ./ D_in(3))) + 2.5   ))))  + (1.5 * (Water(4) * (Water(6) * 4 ./ (3.141592 * Water(4) * (D_in(13)).^2)).^2) ./2);
data(18) = (8 * Shelljf(data(13),D_in(10)) * (data(6)./data(11)) * (1./D_in(9)) * (IPA(4) * ((data(12)).^2) ./2))  + (1.5 * (IPA(4) * (IPA(6) * 4 ./ (3.141592 * IPA(4) * (D_in(14)).^2)).^2) ./2);