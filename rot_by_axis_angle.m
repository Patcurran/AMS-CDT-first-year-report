


rot_ax_ang = rotation.byAxisAngle(ND,45*degree);
% 45 soft
% -45 hard

%rot_ax_ang = rotation.byAxisAngle(rotation_axis_vector,-misorientation*degree);

ebsd2 = rotate(ebsd,rot_ax_ang,'keepXY'); 
setMTEXpref('xAxisDirection','east');
setMTEXpref('zAxisDirection','intoPlane');

%%
bvector = vector3d(1,0,0);

figure();
oM2 = ipfHSVKey(ebsd2('Ti-Hex'));
oM2.inversePoleFigureDirection = bvector;
color2 = oM2.orientation2color(ebsd2('Ti-Hex').orientations);
plot(ebsd2('Ti-Hex'),color2);
title('x vector 2');

figure
ipfKey2 = ipfColorKey(ebsd2('Ti-hex'));
ipfKey2.inversePoleFigureDirection = vector3d.X;
plot(ipfKey2)

%%
%Plot ODF
figure();
ori2 = ebsd2('Ti-hex').orientations;
ori2.SS = specimenSymmetry('hexagonal');
odf2 = calcDensity(ori2,'kernel',psi);
plot(odf2,'phi2',[0, 15, 30, 45]*degree,'antipodal','linewidth',1,'colorbar','cs','ss','minmax','contourf',0:1:10,'colorRange',[0,10]); 

% plotting convention
setMTEXpref('xAxisDirection','east');
%setMTEXpref('yAxisDirection','north');
setMTEXpref('zAxisDirection','outofPlane');

%% Plot PF Alpha

figure();
ori2=ebsd2('Ti-Hex').orientations;
odf_pf2 = calcDensity ( ebsd2('Ti-hex').orientations);
x=[Miller(0,0,0,1,ori2.CS)]; % include hkil figures here


plotPDF(odf_pf2,x,'antipodal', 'minmax', 'colorRange',[1,10]); % plot with contouring
%plotPDF(ori,x,'antipodal', 'contourf', 1:1:10.0, 'minmax', 'colorRange',[1,10]) % plot with contouring
mtexColorbar ('location','southOutSide','title','mrd'); % to move the colour bar to below and include a title

%%
[~,ori_pref2] = max(odf2);

o3a = (ori_pref2.phi1);
o3b = (ori_pref2.Phi) ;
o3c = (ori_pref2.phi2);

% / is rad to degree
% * is degree to rad


o3=orientation('euler', 90*degree , 90*degree  , 0*degree, CS{1, 3});
o4=orientation('euler', o3a, o3b ,o3c, CS{1, 3});
 
angle(o3,o4) / degree;

mori2 = inv(o3) * o4; 

misorientation2 = angle(mori2) / degree










