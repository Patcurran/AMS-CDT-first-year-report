


%%
rot = rotation.byAxisAngle(RD,miss_orientation * degree)








%%
% %% Specimen axis rotation
% % either use mtex which is already done or make your own which isnt as good
% % https://mtex-toolbox.github.io/DefinitionAsCoordinateTransform.html
% 
% rot = mori;       % euler angle defined in other code
% cs = CS{1,3};     % crystal sytmerty which is hex-Ti 6/mmm
% 
% % don't use variable 'ori' as it is defined else where instead
% 
% ori2 = orientation(rot,cs);
%  
% h = [Miller(0,0,0,1,cs)];
% vect1 = ori2 * h
% 
% %%
% 
% u1 = 2*vect1.h + vect1.k;
% v1 = vect1.h + 2*vect1.k;
% w1 = vect1.l;
%     
% brav_vector = (u1,v1,w1)
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 






%% define a roational matrix 'g'

% define the Euler angles - this may be defined from preivos code 
% but just use this as an example:
% Ph1 = mori.phi1;       %degrees 
% ph  = mori.Phi ;       %degrees
% Ph2 = mori.phi2;       %degrees
Ph1 = 180;
ph  = 0;
Ph2 = 0 ;

g = [ (cosd(Ph2) * cosd(Ph1) - sind(Ph1) * sind(Ph2) * cosd(ph)), ...
      (sind(Ph1) * cosd(Ph2) + cosd(Ph1) * sind(Ph2) * cosd(ph)), ... 
      (sind(Ph2) * sind(ph)); ...
      
      (-cosd(Ph1) * sind(Ph2) - sind(Ph1) * cosd(Ph2) * cosd(ph)), ...
      (-sind(Ph1) * sind(Ph2) + cosd(Ph1) * cosd(Ph2) * cosd(ph)), ...
      (cosd(Ph2)  * sind(ph)); ...
      
      (sind(Ph1) * sind(ph)), ...
      (cosd(Ph1) * sind(ph)), ...
      (cosd(ph))];
  
% %% define a specimen axis 'xyz'  
% % example = RD (or x) has Euler angles [90 90 0] - make sure is a column
% % vector
% 
% xyz = [90;90;0];
% %xyz = [ori_pref.phi1;ori_pref.Phi;ori_pref.phi2];
% 
% 
% %% Rotate xyz towards
% rotated_axis = g * xyz
% 
% rot = rotation.byEuler(phi1,Phi,phi2)