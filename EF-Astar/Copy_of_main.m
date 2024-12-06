% Used for Motion Planning for Mobile Robots
% Thanks to HKUST ELEC 5660 
close all; clear all; clc;
addpath('A_star')

% Environment map in 2D space 
xStart = 1.0;
yStart = 1.0;
xTarget = 110.0;
yTarget = 20.0;
MAX_X = 110;
MAX_Y = 110;
%map = picmap;
map = obstacle_map(xStart, yStart, xTarget, yTarget, MAX_X, MAX_Y);
% map(1,1) = xStart;
% map(1,2) = yStart;
% map(28,1) = xTarget;
% map(28,2) = yTarget;

visualize_map(map, [], []);
% Waypoint Generator Using the A* 
path = A_star_search(map, MAX_X, MAX_Y);

% visualize the 2D grid map
visualize_map(map, path, []);

 %save map
 %save('map.mat', 'map', 'MAX_X', 'MAX_Y');
