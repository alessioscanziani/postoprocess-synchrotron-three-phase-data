function array = load_files_ow(am_ascii,dist)

% Import data from text file.
% Script for importing data from the following text file:
%
%    E:\Diamond19\processing\DK_WF1\1280x1284x1080\curv_ia\meank_ow\115489_seg_masked_mean_curvature_ow.am
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2018/12/07 15:30:52

%% is the input a dist or a curvature?
if dist == 1
    start = 11;
elseif dist ==0
    start = 10;
else
    start = 1;
end

%% Initialize variables.
if dist == 0
    filename = ['E:\Diamond19\processing\DK_GI\curv_ia\gauss_ow\',am_ascii];
else
    filename = ['E:\Diamond19\processing\DK_GI\curv_ia\gauss_dist_ow\',am_ascii];
end
delimiter = ',';
startRow = start;

%% Format for each line of text:
%   column1: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
textscan(fileID, '%[^\n\r]', startRow-1, 'WhiteSpace', '', 'ReturnOnError', false, 'EndOfLine', '\r\n');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
array = dataArray{:, 1};


%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;