clear; clc;
% Define the directory containing the .nc files
dataDir = 'F:\MATLAB\SMOSNC';
cd(dataDir);
% List all .nc files in the directory
ncFiles = dir('*.nc');

% Extract metadata from the first file
metadata = ncinfo(ncFiles(1).name);

% Find the 'Soil_Moisture' variable and its attributes
varIndex = find(strcmp({meta.Variables.Name}, 'Soil_Moisture'));
% Look for the 'scale_factor' attribute
for attr = meta.Variables(varIndex).Attributes
    if strcmp(attr.Name, 'scale_factor')
        scaleFactor = attr.Value;
        break;
    end
end

% Read 'lon' and 'lat' from the first file
Lon = ncread(ncFiles(1).name, 'lon');
Lat = ncread(ncFiles(1).name, 'lat');
sampleSM = ncread(ncFiles(1).name, 'Soil_Moisture');
SMOS = zeros([size(sampleSM), numel(ncFiles)]);

% Loop through all .nc files, read 'Soil_Moisture', and apply the scale factor
for i = 1:numel(ncFiles)
    SMOS(:,:,i) = scaleFactor * double(ncread(ncFiles(i).name, 'Soil_Moisture'));
end
