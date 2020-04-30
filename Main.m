function data = Main(D_in)

Water = [32.5 4182 0.617 995 7.92 * 10^(-4) D_in(26) 1500];
IPA = [70 3180 0.125 736 6.56 * 10^(-4) 22.2 5000];


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

data(1,1) = 3.141592 * (D_in(1) * 2.54) * D_in(2) * 30.5 * 10^(-4);
data(1,2) = round(D_in(5) ./ data(1));
data(1,3) = round(data(2) ./ D_in(6));
data(4) = (Water(6) ./ Water(4)) ./ (data(3) * 3.14159 * 0.25 * (D_in(3) * 2.54 * 10^(-2)).^2);
data(5) = D_in(1) * 2.54 * 10^(-2) * (data(2) ./ D_in(7)).^(1./D_in(8));
data(6) = data(5) + ((28.* data(5)) + 44.4)*10^(-3);
data(7) = Water(4) * data(4) * D_in(3) * 2.54 * 10^(-2) ./ Water(5);
data(8) = Water(2) * Water(5) ./ Water(3);
data(9) = 4200 .* (1.35 + 0.02*Water(1)) .* data(4).^(0.8) ./ (D_in(3) .* 2.54 * 10)^0.2;
data(10) = (D_in(4) -1) .* D_in(1) .* (data(6).^2) .* D_in(9) ./ (D_in(4) * D_in(1));
data(11) = 1.10 * (D_in(4)^2 - 0.917 ) * D_in(1) * 2.54 * 10^(-2);
data(12) = IPA(6) ./ (IPA(4) * data(10));
data(13) = IPA(4) * data(12) * data(11) ./ IPA(5);
data(14) = IPA(2) * IPA(5) ./ IPA(3);
data(15) = Shelljh(data(13),D_in(10)) * data(13) * data(14).^0.33 * IPA(3)./data(11);
data(16) = 1/ ((1/data(15)) + (1/IPA(7)) + ((D_in(1) * 2.54 * 10^(-2) * log(D_in(1)./D_in(3)))./(2 * D_in(17))) + ((D_in(1)./D_in(3)).*((1/Water(7))+(1/data(9)))));
data(17) = ((Water(4) * ((data(4)).^2) ./2) * ((D_in(6) .* ((8 * Tubejf(data(7)) * (12 * D_in(2) ./ D_in(3))) + 2.5   ))))  + (1.5 * (Water(4) * (Water(6) * 4 ./ (3.141592 * Water(4) * (D_in(13)).^2)).^2) ./2);
data(18) = (8 * Shelljf(data(13),D_in(10)) * (data(6)./data(11)) * (1./D_in(9)) * (IPA(4) * ((data(12)).^2) ./2))  + (1.5 * (IPA(4) * (IPA(6) * 4 ./ (3.141592 * IPA(4) * (D_in(14)).^2)).^2) ./2);
data(19) = (D_in(24)) ./ (data(16) * D_in(25));
data(20) = D_in(1) * 2.54 * 10^(-2) * (22 * (10^5) ./ (2.2 * D_in(19) * 10^(9))).^(1/3);
data(21) = (22 * (10^5) * data(6) ./ ( (2 * D_in(20) * 6.89 * (10^6)) - (22 * (10^5)) )) + 1.6*10^(-3);
data(22) = (22 * (10^5) * data(6) ./ ( (2 * D_in(20) * 6.89 * (10^6)) - (0.2*22 * (10^5)) )) + 1.6*10^(-3);
data(23) = (4 * data(6) * sqrt(22 * (10^5) ./ (D_in(23)*(10^9)))) + (1.6 * 10^(-3));
data(24) = (data(6) * sqrt(0.25 * 22 * (10^5) ./ (D_in(20) * 6.89 * (10^6)))) + (1.6 * 10^(-3));
data(25) = ((data(6)./3) * sqrt(22 * (10^5) ./ ( (1- 0.907./((D_in(4)).^2)) * (D_in(15) * 6.89 * (10^6))   )));
data(26) = (0.31 * data(5) * 22 * 10^(5) ./ ( (1-1./(D_in(4))) * (D_in(15) * 6.89 * (10^6))   ));
data(27) = ((3.14159./4)*((D_in(1)*2.54*10^(-2)).^2 - (D_in(3)*2.54*10^(-2)).^2)*D_in(2)*12*2.54*10^(-2)*data(2)) +  ((3.14159/2) * (data(6).^2) * max(data(25), data(26)));

if data(6) < 0.610
    D_in(11) = 7.9 * 10^(-3);
elseif data(6) < 0.762
    D_in(11) = 7.9 * 10^(-3);
elseif data(6) < 1.016
    D_in(11) = 9.5 * 10^(-3);
elseif data(6) < 1.549
    D_in(11) = 11.1 * 10^(-3);
elseif data(6) < 2057
    D_in(11) = 12.7 * 10^(-3);
end

data(28) = (3.1415 * data(6)* max([D_in(11), data(21), data(22)]) * D_in(2) * 12*2.54*10^(-2)) + (1.086*(data(6).^2)*max([D_in(11), data(21), data(22)])) + (1.086*(data(5).^2)*data(23)) + (data(24)*(3.14159./4)*(data(6)).^2); 
data(29) = data(27) * D_in(18) * D_in(16);
data(30) = data(28) * D_in(22) * D_in(21);
data(31) = data(29) + data(30);
data(32) = max([D_in(11), data(21), data(22)]);
data(33) = D_in(27);