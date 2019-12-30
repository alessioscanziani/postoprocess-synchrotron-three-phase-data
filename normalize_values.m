% clc
% clear all
% close all

% load data of MF previously computed.
load MF_data

% put data into matrices. First column x-axis, second column oil, third gas
Si = [tomos_WF2'; So_WF2; Sg_WF2];

ia = [tomos_WF2'; ia_ow_data; ia_go_data];

n_clusters = [tomos_WF2'; n_cluster_oil([1, 8:end])', n_cluster_gas([1, 8:end])'];

mean_volume_clusters = [tomos_WF2'; mean_volume_oil([1, 8:end])', mean_volume_gas([1, 8:end])'];

% Select the curvature with distance 3 from the grain
km = [tomos_WF2'; mean_km_ow(:,3); mean_km_go(:,3)];

euler = [numbers'; euler_oil'; euler_gas'];

% dimensions of t
side_vx = 3.56;
volume_vx = side_vx^3;

% normalize ia
ia_um = ia .* side_vx;
ia_ow_norm = ia_um./ volume_vx;

figure()
plot(tomos_WF2(2:length(ia_go_data)-1)-tomos_WF2(1),ia_go_norm(1,2:end-1),'r.','LineWidth',1)
hold on
plot(tomos_WF2(2:length(ia_ow_data)-1)-tomos_WF2(1),ia_ow_norm(2,2:end-1),'g.','LineWidth',1)
legend('go','ow')
xlabel('time [min]')
ylabel('interfacial area')
ax = gca;
ax.FontSize = 15;
ax.FontName = 'Times New Roman';