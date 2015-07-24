function [x,y,z,s,r,err] = load_points( filename )
%LOAD_POINTS Summary of this function goes here
%   Detailed explanation goes here
  A = csvread(filename,1);
  x = A(:,3);
  y = A(:,4);
  z = A(:,5);
  s = A(:,1);
  r = A(:,2);
  err = A(:,12);
end