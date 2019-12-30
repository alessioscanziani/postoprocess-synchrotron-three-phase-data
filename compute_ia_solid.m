clear all
close all
clc

file_path = 'E:\Diamond19\processing\DK_GI\curv_ia';

%% Interfacial area
% list of names data of ia ow
% change folder
file_list = dir([file_path '\area_csv_ow']);
% read names in the folder
names = {file_list.name}';
% search for files of ia ow
% list of names data of ia ow
ia_ow_name = 'interfacial_area_ow';
ia_ow_bool = regexp(names, ia_ow_name);
for i = 1:length(ia_ow_bool)
    bool_ow_ia(i) = isempty(ia_ow_bool{i})==0;
end
ia_ow = names(find(bool_ow_ia));

% Load the data
ia_ow_data = zeros(length(ia_ow),1);
for i = 1:length(ia_ow)
    ia_ow_data(i) = csvread([file_path '\area_csv_ow\' ia_ow{i}]);
end

% list of names data of ia sw
% change folder
file_list = dir([file_path '\area_csv_sw']);
% read names in the folder
names = {file_list.name}';
% search for files of ia sw
% list of names data of ia sw
ia_sw_name = 'interfacial_area_sw';
ia_sw_bool = regexp(names, ia_sw_name);
for i = 1:length(ia_sw_bool)
    bool_sw_ia(i) = isempty(ia_sw_bool{i})==0;
end
ia_sw = names(find(bool_sw_ia));

% Load the data
ia_sw_data = zeros(length(ia_sw),1);
for i = 1:length(ia_sw)
    ia_sw_data(i) = csvread([file_path '\area_csv_sw\' ia_sw{i}]);
end

% list of names data of ia os
% change folder
file_list = dir([file_path '\area_csv_os']);
% read names in the folder
names = {file_list.name}';
% search for files of ia os
% list of names data of ia os
ia_os_name = 'interfacial_area_os';
ia_os_bool = regexp(names, ia_os_name);
for i = 1:length(ia_os_bool)
    bool_os_ia(i) = isempty(ia_os_bool{i})==0;
end
ia_os = names(find(bool_os_ia));

% Load the data
ia_os_data = zeros(length(ia_os),1);
for i = 1:length(ia_os)
    ia_os_data(i) = csvread([file_path '\area_csv_os\' ia_os{i}]);
end

% list of names data of ia gs
% change folder
file_list = dir([file_path '\area_csv_gs']);
% read names in the folder
names = {file_list.name}';
% search for files of ia gs
% list of names data of ia gs
ia_gs_name = 'interfacial_area_gs';
ia_gs_bool = regexp(names, ia_gs_name);
for i = 1:length(ia_gs_bool)
    bool_gs_ia(i) = isempty(ia_gs_bool{i})==0;
end
ia_gs = names(find(bool_gs_ia));

% Load the data
ia_gs_data = zeros(length(ia_gs),1);
for i = 1:length(ia_gs)
    ia_gs_data(i) = csvread([file_path '\area_csv_gs\' ia_gs{i}]);
end

% normalize values
% dimensions of voxels
side_vx = 3.56e-3;
volume_vx = side_vx^3;
n_voxels = 1280 * 1284 * 1080;
mask = 0.53;
volume_tot = volume_vx * n_voxels * mask;

% normalize ia and km
ia_ow_um2 = ia_ow_data .* side_vx.^2;
ia_ow_norm = ia_ow_um2./ volume_tot;
ia_os_um2 = ia_os_data .* side_vx.^2;
ia_os_norm = ia_os_um2./ volume_tot;
ia_sw_um2 = ia_sw_data .* side_vx.^2;
ia_sw_norm = ia_sw_um2./ volume_tot;
ia_gs_um2 = ia_gs_data .* side_vx.^2;
ia_gs_norm = ia_gs_um2./ volume_tot;

% load time data
load 'E:\Diamond19\processing\DK_GI\volume_fraction\time.mat'

% plot interfacial area
figure()
plot(time,ia_ow_norm,'LineWidth',1)
hold on
plot(time,ia_os_norm,'LineWidth',1)
plot(time,ia_sw_norm,'LineWidth',1)
plot(time,ia_gs_norm,'LineWidth',1)
legend('oil-water','oil-solid','water-solid','gas-solid')
xlabel('Time [min]')
ylabel('Specific interfacial area [mm^{-1}]')
ax = gca;
ax.FontSize = 15;
ax.FontName = 'Times New Roman';

save ia_solid
save('ia_os_norm','ia_os_norm')
save('ia_gs_norm','ia_gs_norm')