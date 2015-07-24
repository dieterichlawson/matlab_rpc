function [ P ] = cubic_poly(x,y,z)
%CUBIC_POLY computes a matrix of all cubic combinations 
%of the three supplied vectors
    P = [ones(size(x)) x y z x.*y x.*z y.*z x.^2 y.^2 z.^2 ...
        (x.*y).*z (x.^2).*y (x.^2).*z x.^3 (y.^2).*x (y.^2).*z ...
        y.^3 (z.^2).*x (z.^2).*y z.^3];
end

