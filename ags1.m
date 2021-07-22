

%% Import Script for EBSD Data
%
% This script was automatically created by the import wizard. You should
% run the whoole script or parts of it in order to import your data. There
% is no problem in making any changes to this script.

%% Specify Crystal and Specimen Symmetries
%close all
   % clear
% clc
% crystal symmetry
CS = {... 
     'notIndexed',...
     crystalSymmetry('m-3m', [3.2 3.2 3.2], 'mineral', 'Titanium cubic', 'color', [0.6 0.8 1]),...
      crystalSymmetry('6/mmm', [3 3 4.7], 'X||a*', 'Y||b', 'Z||c*', 'mineral', 'Ti-Hex', 'color', [0.56 0.74 0.56])};
cs = {crystalSymmetry('6/mmm', [3 3 4.7], 'X||a*', 'Y||b', 'Z||c*', 'mineral', 'Ti-Hex', 'color', [0.56 0.74 0.56])};
% plotting convention
setMTEXpref('xAxisDirection','east');
%setMTEXpref('zAxisDirection','outOfPlane');
setMTEXpref('yAxisDirection','south');
% aline reference frame

%% Specify File Names

% path to files
pname = 'C:\Users\mbgm5pc3\Dropbox (The University of Manchester)\PhD Patrick Curran\4) Experiments folder\Data\ebsd data\Edited data';


% which files to be imported
fname = [pname '\AZtec_cropped_AGS1_Ti64.cpr'];
%fname = [pname '\AZtec_cropped_AGS1_Ti64_cleaned.cpr'];
%% Import the Data

% create an EBSD variable containing the data
ebsd = EBSD.load(fname,CS,'interface','crc',...
      'convertSpatial2EulerReferenceFrame');

%% rotate the orientation data but not the spatial data
rot = rotation('Euler', 90*degree, 90*degree, 0*degree);
ebsd = rotate(ebsd,rot,'keepXY'); 

RD = vector3d.X;
TD = vector3d.Y;
ND = vector3d.Z;
    
avector = vector3d(1,0,0);


% %% Restricting to a region of interest
% region = [11.5 0.3 6.2 4]*10^3; %ags use in project as correct size
% %region2 = [3 3 3 3]*10^3; %microtextured region
% condition = inpolygon(ebsd2a,region);
% 
% %% plot
% ebsd3 = ebsd2a(condition);
%% ipf plot
% Plot EBSD data with IPF colours - maps X, Y and Z - Hex

% figure();
% oM = ipfHSVKey(ebsd3('Ti-Hex'));
% oM.inversePoleFigureDirection = avector;
% color = oM.orientation2color(ebsd3('Ti-Hex').orientations);
% plot(ebsd3('Ti-Hex'),color);
% title('x vector');

figure();
oM = ipfHSVKey(ebsd('Ti-Hex'));
oM.inversePoleFigureDirection = avector;
color = oM.orientation2color(ebsd('Ti-Hex').orientations);
plot(ebsd('Ti-Hex'),color);
title('x vector');

%%
figure
ipfKey = ipfColorKey(ebsd('Ti-hex'));
ipfKey.inversePoleFigureDirection = vector3d.X;
plot(ipfKey)

%% export
%ebsd.export('MTEX_Cropped_AGS_Ti64.ctf')





