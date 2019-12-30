% Load the data saved in avizo on curvatures and interfacial areas,
% post-process and plot them

clear all
close all
clc

file_path = 'E:\Diamond19\processing\DK_GI\curv_ia';
load 'E:\Diamond19\processing\DK_GI\volume_fraction\time.mat'
load 'E:\Diamond19\processing\DK_GI\volume_fraction\saturations_GI.mat'

%% Mean curvature go
% list of names data of mean curvatures (km)
% change folder
file_list = dir([file_path '\mean_curv_go']);
% read names in the folder
names = {file_list.name}';
% search for files of km
mean_go = 'mean_curvature';
mean_go_bool = regexp(names, mean_go);
bool_go = zeros(length(mean_go),1);
for i = 1:length(mean_go_bool)
    bool_go(i) = isempty(mean_go_bool{i})==0;
end
mean_curv_go = names(find(bool_go));

% list of names data of distances of km
% change folder
file_list = dir([file_path '\mean_curv_dist_go']);
% read names in the folder
names = {file_list.name}';
% search for files of curvature
% list of names data of distances
dist_go = 'dist_mcurvature';
dist_go_bool = regexp(names, dist_go);
for i = 1:length(dist_go_bool)
    bool_go(i) = isempty(dist_go_bool{i})==0;
end
dist_curv_go = names(find(bool_go));

% Load the data
% km
km_go = cell(length(mean_curv_go),1);
for i = 1:length(mean_curv_go)
    km_go{i} = load_files_go(mean_curv_go{i},0);
end
% distance
d_go = cell(length(dist_curv_go),1);
for i = 1:length(dist_curv_go)
    d_go{i} = load_files_go(dist_curv_go{i},1);
end

%% Mean curvature ow
% list of names data of mean curvatures (km)
% change folder
file_list = dir([file_path '\mean_curv_ow']);
% read names in the folder
names = {file_list.name}';
% search for files of km
mean_ow = 'mean_curvature_ow';
mean_ow_bool = regexp(names, mean_ow);
bool_ow = zeros(length(mean_ow),1);
for i = 1:length(mean_ow_bool)
    bool_ow(i) = isempty(mean_ow_bool{i})==0;
end
mean_curv_ow = names(find(bool_ow));

% list of names data of distances of km
% change folder
file_list = dir([file_path '\mean_curv_dist_ow']);
% read names in the folder
names = {file_list.name}';
% search for files of curvature
% list of names data of distances
dist_ow = 'dist_mcurvature_ow';
dist_ow_bool = regexp(names, dist_ow);
for i = 1:length(dist_ow_bool)
    bool_ow(i) = isempty(dist_ow_bool{i})==0;
end
dist_curv_ow = names(find(bool_ow));

% Load the data
% km
km_ow = cell(length(mean_curv_ow),1);
for i = 1:length(mean_curv_ow)
    km_ow{i} = load_files_ow(mean_curv_ow{i},0);
end
% distance
d_ow = cell(length(dist_curv_ow),1);
for i = 1:length(dist_curv_ow)
    d_ow{i} = load_files_ow(dist_curv_ow{i},1);
end

%% Mean curvature gw
% list of names data of mean curvatures (km)
% change folder
file_list = dir([file_path '\mean_curv_gw']);
% read names in the folder
names = {file_list.name}';
% search for files of km
mean_gw = 'mean_curvature_gw';
mean_gw_bool = regexp(names, mean_gw);
bool_gw = zeros(length(mean_gw),1);
for i = 1:length(mean_gw_bool)
    bool_gw(i) = isempty(mean_gw_bool{i})==0;
end
mean_curv_gw = names(find(bool_gw));

% list of names data of distances of km
% change folder
file_list = dir([file_path '\mean_curv_dist_gw']);
% read names in the folder
names = {file_list.name}';
% search for files of curvature
% list of names data of distances
dist_gw = 'dist_mcurvature_gw';
dist_gw_bool = regexp(names, dist_gw);
for i = 1:length(dist_gw_bool)
    bool_gw(i) = isempty(dist_gw_bool{i})==0;
end
dist_curv_gw = names(find(bool_gw));

% Load the data
% km
km_gw = cell(length(mean_curv_gw),1);
for i = 1:length(mean_curv_gw)
    km_gw{i} = load_files_gw(mean_curv_gw{i},0);
end
% distance
d_gw = cell(length(dist_curv_gw),1);
for i = 1:length(dist_curv_gw)
    d_gw{i} = load_files_gw(dist_curv_gw{i},1);
end

%% Interfacial area
% list of names data of interfacial area (ia) go
% change folder
file_list = dir([file_path '\area_csv_go']);
% read names in the folder
names = {file_list.name}';
% search for files of ia go
ia_go_name = 'interfacial_area_go';
ia_go_bool = regexp(names, ia_go_name);
bool_go_ia = zeros(length(ia_go_name),1);
for i = 1:length(ia_go_bool)
    bool_go_ia(i) = isempty(ia_go_bool{i})==0;
end
ia_go = names(find(bool_go_ia));

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

% list of names data of ia gw
% change folder
file_list = dir([file_path '\area_csv_gw']);
% read names in the folder
names = {file_list.name}';
% search for files of ia gw
% list of names data of ia gw
ia_gw_name = 'interfacial_area_gw';
ia_gw_bool = regexp(names, ia_gw_name);
for i = 1:length(ia_gw_bool)
    bool_gw_ia(i) = isempty(ia_gw_bool{i})==0;
end
ia_gw = names(find(bool_gw_ia));

% Load the data
% gas-oil
ia_go_data = zeros(length(ia_go),1);
for i = 1:length(ia_go)
    ia_go_data(i) = csvread([file_path '\area_csv_go\' ia_go{i}]);
end
% oil-water
ia_ow_data = zeros(length(ia_ow),1);
for i = 1:length(ia_ow)
    ia_ow_data(i) = csvread([file_path '\area_csv_ow\' ia_ow{i}]);
end
% gas-water
ia_gw_data = zeros(length(ia_gw),1);
for i = 1:length(ia_gw)
    ia_gw_data(i) = csvread([file_path '\area_csv_gw\' ia_gw{i}]);
end

%% Post-process
% Compute mean and std for i = 1:length(km_go)
for i = 1:length(km_go)
for j = 1:4
        km_go_dist{i,j} = km_go{i}(d_go{i} > j-1);
        mean_km_go(i,j) = mean(km_go_dist{i,j});
        std_km_go(i,j) = std(km_go_dist{i,j});
    end
end

% Compute mean and std for i = 1:length(km_ow)
for i = 1:length(km_ow)
    for j = 1:4
        km_ow_dist{i,j} = km_ow{i}(d_ow{i} > j-1);
        mean_km_ow(i,j) = mean(km_ow_dist{i,j});
        std_km_ow(i,j) = std(km_ow_dist{i,j});
    end
end

% Compute mean and std for i = 1:length(km_gw)
for i = 1:length(km_gw)
    for j = 1:4
        km_gw_dist{i,j} = km_gw{i}(d_gw{i} > j-1);
        mean_km_gw(i,j) = mean(km_gw_dist{i,j});
        std_km_gw(i,j) = std(km_gw_dist{i,j});
    end
end

% normalize values
% dimensions of voxels
side_vx = 3.56e-3;
volume_vx = side_vx^3;
n_voxels = 1280 * 1284 * 1080;
mask = 0.53;
volume_tot = volume_vx * n_voxels * mask;

% normalize ia and km
ia_um2_ow = ia_ow_data .* side_vx.^2;
ia_ow_norm = ia_um2_ow./ volume_tot;
ia_um2_go = ia_go_data .* side_vx.^2;
ia_go_norm = ia_um2_go./ volume_tot;
ia_um2_gw = ia_gw_data .* side_vx.^2;
ia_gw_norm = ia_um2_gw./ volume_tot;
km_si_ow = mean_km_ow ./ side_vx;
km_si_go = mean_km_go ./ side_vx;
km_si_gw = mean_km_gw ./ side_vx;

%% Figures
% convert time data into discrete numbers of seconds
m = minute(time);
s = second(time);
h = hour(time);
time_GI_s = s + 60*m + 3600*h;

% plot curvature
f1 = figure(1);
for j = 1:length(std_km_go(1,:))
    plot(time_GI_s, km_si_go, 'LineWidth', 1)
    hold on
    plot(time_GI_s, km_si_ow,'--', 'LineWidth', 1)
    plot(time_GI_s, km_si_gw,'.-', 'LineWidth', 1)
end
legend('go 0', 'go 1', 'go 2', 'go 3', 'ow 0', 'ow 1', 'ow 2', 'ow 3', 'gw 0', 'gw 1', 'gw 2', 'gw 3')
xlabel('Time [s]')
ylabel('Average mean curvature')

% plot interfacial area
f2 = figure(2);
plot(time_GI_s,ia_ow_norm,'r','LineWidth',1)
hold on
plot(time_GI_s,ia_go_norm,'g','LineWidth',1)
plot(time_GI_s,ia_gw_norm,'b','LineWidth',1)
legend('ow','go','gw')
xlabel('Time [s]')
ylabel('Interfacial area')
ax = gca;
ax.FontSize = 15;
ax.FontName = 'Times New Roman';

saveas(f2,'Interfacial_area_GI.png')

f3 = figure(3);
plot(time_GI_s, -km_si_ow(:,3), 'r', 'LineWidth', 1)
hold on
plot(time_GI_s, -km_si_go(:,3), 'g', 'LineWidth', 1)
plot(time_GI_s, km_si_gw(:,3), 'b', 'LineWidth', 1)
legend('ow','go','gw')
xlabel('Time [s]')
ylabel('Mean curvature')
ax = gca;
ax.FontSize = 15;
ax.FontName = 'Times New Roman';

saveas(f3,'Mean_curvature_GI.png')

f4 = figure(4);
plot(time_GI_s, -km_si_ow(:,3)*2*47, 'r', 'LineWidth', 1)
hold on
plot(time_GI_s, -km_si_go(:,3)*2*27, 'g', 'LineWidth', 1)
plot(time_GI_s, km_si_gw(:,3)*2*72, 'b--', 'LineWidth', 1)
plot(time_GI_s, [-km_si_go(:,3)*2*27 + -km_si_ow(:,3)*2*47], 'b', 'LineWidth', 1)
legend('ow','go','gw')
xlabel('Time [s]')
ylabel('Capillary pressure')
ax = gca;
ax.FontSize = 15;
ax.FontName = 'Times New Roman';

saveas(f4,'Capillary_pressure_GI.png')

f5 = figure(5);
plot(time_GI_s,So,'r','LineWidth',1)
hold on
plot(time_GI_s,Sw,'b','LineWidth',1)
plot(time_GI_s,Sg,'g','LineWidth',1)
ylabel('Saturation')
xlabel('Time [s]')
legend('Oil','Water','Gas')
ax = gca;
ax.FontSize = 15;
ax.FontName = 'Times New Roman';

saveas(f5,'Saturation_GI.png')

save('time_GI_s','time_GI_s')
save('km_si_go','km_si_go')
save('ia_go_norm','ia_go_norm')
