%% This code reads data for computing thermodynamic contact angle, computes and plots versus time

clear all
close all
clc

load 'E:\Diamond19\processing\DK_GI\curv_ia\ia_go_norm'
load 'E:\Diamond19\processing\DK_GI\curv_ia\ia_os_norm'
load 'E:\Diamond19\processing\DK_GI\curv_ia\km_si_go'
load 'E:\Diamond19\processing\DK_GI\curv_ia\time_GI_s'
load 'E:\Diamond19\processing\DK_GI\volume_fraction\Sg.mat'
load 'E:\Diamond19\processing\DK_GI\volume_fraction\So.mat'
load 'E:\Diamond19\processing\DK_GI\volume_fraction\phi.mat'

km_dist1 = -km_si_go(:,1);
for i = 1:length(ia_os_norm)-1
    km_mean(i) = mean([km_dist1(i+1),km_dist1(i)]);
    phi_mean(i) = mean([phi(i+1),phi(i)]);
    DSo(i) = So(i+1) - So(i);
    DSg(i) = Sg(i+1) - Sg(i);
    if DSo(i) == 0
        DSo(i) = 10^(-5);
    end
    Da_so(i) = ia_os_norm(i+1) - ia_os_norm(i);
    Da_go(i) = ia_go_norm(i+1) - ia_go_norm(i);
    cos_theta_t_o(i) = (km_mean(i)*phi(i)*DSo(i) + Da_go(i))./Da_so(i);
end

theta_t_o = acosd(cos_theta_t_o);
Da_so = Da_so';
Da_go = Da_go';

figure()
plot(time_GI_s(1:end-1),Da_so,'k','Linewidth',1)
hold on
plot(time_GI_s(1:end-1),Da_go,'b','Linewidth',1)
legend('\Delta a_{1s}','\Delta a_{12}')
xlabel('Time [min]')
ylabel('\Delta a [mm^{-1}]')
ax = gca;
ax.FontSize = 15;
ax.FontName = 'Times New Roman';

figure(2)
theta_t_movav = movmean(theta_t_o, 5);
% plot(time_GI_s(1:end-1),theta_t_o,'LineWidth',1)
% hold on
plot(time_GI_s(1:end-1),theta_t_movav,'o--','LineWidth',1)
xlabel('Time [min]')
ylabel('Thermodynamic contact angle [\circ]')
% legend('Data','Moving average','Location','Northwest')
ax = gca;
ax.FontSize = 15;
ax.FontName = 'Times New Roman';
saveas(figure(2),'theta_t_go_GI.png')