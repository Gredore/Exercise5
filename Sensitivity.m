clear all

load('Final_data')
load('Final_D_in')

x = [];
x_bad = [];
New_datas = [];
Twis = linspace(18,32,50);
%Twi = 25;
%Tiis = linspace(90,125,10);
Tii = 100;
for Twi = Twis
    
    Twm = 0.5 * (Twi + 40);
    Tim = 0.5 * (Tii + 40);
    
    Water_25 = [4186 0.607 997 0.000913];
    Water_40 = [4178 0.626 992 0.00067];
    
    IPA_100 = [3540 0.118 704 5.88 * 10^(-4)]; %Vis for 75
    IPA_40 = [2810 0.132 767 7.34 * 10^(-4)];  %Vis for 65
    
    Water = [Twm, Water_25 + ( ( (Twm - 25) ./ (40-25)  ) * (Water_40 - Water_25)   ),67.46, 1500];
    IPA = [Tim, IPA_40 + ( ( (Tim - 40) ./ (100-40)  ) * (IPA_100 - IPA_40)   ), 22.2, 5000];
    
    %Correct IPA vis:%
    
    IPA(5) = IPA_40(4) + ( ( (Tim - 65) ./ (75-65)  ) * (IPA_100(4) - IPA_40(4))   )-0.000005;
    
    New_data = Sens_New_U(D_in, data, Water, IPA);
    New_datas = [New_datas; New_data];
    U = New_data(16);
    U_bad = data(16);
    Args = [Twi Tii Water(6).*Water(2) IPA(6).*IPA(2) U.*data(19)];
    Args_bad = [Twi Tii Water(6).*Water(2) IPA(6).*IPA(2) U_bad.*data(19)];
    fun = @(x) sens(x, Args);
    fun_bad = @(x) sens(x, Args_bad);
    x = [x; fsolve(fun, [40,40])];
    x_bad = [x_bad; fsolve(fun_bad, [40,40])];
end

% h = plot(Twis, x(:,1), 'r');
% hold on
% plot(Twis, x_bad(:,1), 'k');
% hold off
% set(gcf,'Position',[200 200 650 400])


% xlabel('Water Inlet Temperature / °C')
% ylabel('Outlet Temperature of IPA & Water / °C')
% title('Sensitivity analysis: Changing Water Inlet Temperature')
% legend('U Recalculation','U Constant', 'location', 'southeast')
% set(gca,'fontname','times')  % Set it to times
%print('Water_sensitivity.png', '-dpng', '-r1000')

h=plot(Twis, New_datas(:,17),'r');
%set(h, {'color'}, {[0 0 0]; [1 0 0]});
xlabel('Water Inlet Temperature / °C')
ylabel('Tube-Side Pressure drop / Pa')
title('Sensitivity analysis: Changing Water Inlet Temperature')
%legend('Tube-side','Shell-side', 'location', 'east')
set(gca,'fontname','times')  % Set it to times
print('Water_sensitivity_pressure.png', '-dpng', '-r1000')