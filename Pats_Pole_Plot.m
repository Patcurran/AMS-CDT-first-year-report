% Compute optimal halfwidth from the meanorientations of grains...
psi = calcKernel(ebsd('Ti-hex').orientations);
HALF_WIDTH = psi;

%Plot ODF
figure();
ori = ebsd('Ti-hex').orientations;
ori.SS = specimenSymmetry('hexagonal');
odf = calcDensity(ori,'kernel',psi);
plot(odf,'phi2',[0, 15, 30, 45]*degree,'antipodal','linewidth',1,'colorbar','cs','ss','minmax','contourf',0:1:10,'colorRange',[0,10]); 

% plotting convention
setMTEXpref('xAxisDirection','east');
%setMTEXpref('yAxisDirection','north');
setMTEXpref('zAxisDirection','outofPlane');

%% Plot PF Alpha

figure();
ori=ebsd('Ti-Hex').orientations;
odf_pf = calcDensity ( ebsd('Ti-hex').orientations);
x=[Miller(0,0,0,1,ori.CS)]; % include hkil figures here

plotPDF(odf_pf,x, 'minmax', 'colorRange',[1,10]); % plot with contouring
%plotPDF(ori,x,'antipodal', 'contourf', 1:5:35.0, 'minmax', 'colorRange',[1,35]) % plot with contouring
mtexColorbar ('location','southOutSide','title','mrd'); % to move the colour bar to below and include a title


%% Rotate pole figure 
% miss_orientation = 86.6417

% https://mtex-toolbox.github.io/PoleFigureCorrection.html

% This defines a rotation around the x-axis about 100 degree
% rot = rotation.byAxisAngle(zvector,86.6417*degree);
% pf_rotated = rotate(PDF,rot);
% plot(pf_rotated,'antipodal')

