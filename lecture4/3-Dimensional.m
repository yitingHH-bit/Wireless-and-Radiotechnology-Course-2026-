clc;
close all;
clear all;

% --------- INPUTS (must ask after running) ----------
tmin = input('The lower bound of theta in degree=');
tmax = input('The upper bound of theta in degree=');
pmin = input('The lower bound of phi in degree=');
pmax = input('The upper bound of phi in degree=');

% --------- GIVEN CONSTANTS ----------
tinc = 2;
pinc = 4;
rad  = pi/180;

theta1 = (tmin:tinc:tmax);
phi1   = (pmin:pinc:pmax);
theta  = theta1 .* rad;
phi    = phi1   .* rad;

% --------- GRID ----------
[THETA, PHI] = meshgrid(theta, phi);

% --------- FIELD PATTERN ----------
y1 = input('The field pattern: E(THETA,PHI)=');
v  = input('The field pattern: P(THETA,PHI)=','s');

% y must be absolute value of y1 (and match grid size)
y = abs(y1) * ones(size(THETA));

% (Optional) ratio / normalization info (not used further, but kept for assignment style)
ratio = max(max(y)); %#ok<NASGU>

% --------- SPHERICAL TO CARTESIAN + PLOT ----------
[X, Y, Z] = sph2cart(THETA, PHI, y);   % as required by the task statement
mesh(X, Y, Z);
title('3 D Pattern','Color','b','FontName','Helvetica','FontSize',12,'FontWeight','demi');
axis equal;
grid on;

% --------- PRINT PARAMETERS ----------
fprintf('\n Input Parameters: \n-------------------- ');
fprintf('\n Theta =%2.0f', tmin);
fprintf(' : %2.0f', tinc);
fprintf(' : %2.0f', tmax);
fprintf('\n Phi =%2.0f', pmin);
fprintf(' : %2.0f', pinc);
fprintf(' : %2.0f', pmax);
fprintf('\n FIELD PATTERN : %s', v);
fprintf('\n \n Output is shown in the figure below----------- ');
fprintf('\n');
