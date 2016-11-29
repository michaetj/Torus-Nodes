function [ A ] = FibTorus(r,R,k)
% Generate F_k Fibonacci type points on a torus where F_k is the kth 
% Fibonacci number. Radius of the tube of the torus is r, and the radius
% from the center of torus to the center of the tube is R. Points are 
% generated on the unit square and mapped under a cylindrical projection 
% to the torus.

% The points are not equidistributed.

% Output is 3 x N matrix

% Create Fibonacci nodes on the square. An exact Fibonacci number is needed
% because the lattice generated by the matrix B will be 1- periodic in  the 
% y coordinate. The map Proj glues the top edge of [0,1]^2 to the bottom 
% edge so this periodicity is needed to keep separation of the toroidal 
% points.
N = round(((1+sqrt(5))^k-(1-sqrt(5))^k)/(2^k*sqrt(5)));


A = zeros(N,3);
B = zeros(N,2);
gr = (1+sqrt(5))/2;
for i=1:N
    B(i,:) = [i/gr-floor(i/gr),i/N];
end

for i=1:N
    %The angle theta at the ith stage becomes the initial guess for the 
    %(i+1)th stage 
   [A(i,:)] = Proj(B(i,:),r,R);
end

    function [X,theta] = Proj(v,r,R)
        %Proj takes a vector in [0,1]^2 as input and returns Cartesian
        %coordinates and angle theta. Thetaguess provides an initial guess
        %for Matlab's numerical solver.
        phi = 2*pi*v(1,1);
        theta = 2*pi*v(1,2);
        
        X(1,1) = (R+r*cos(theta))*cos(phi);
        X(1,2) = (R+r*cos(theta))*sin(phi);
        X(1,3) = r*sin(theta);
        
    end


end

