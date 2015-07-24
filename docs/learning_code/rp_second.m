function [f] = rp(x,y,z,a,b,r)
    P = cubic_poly(x,y,z);
    b = [1; b];
    p1 = P*a;
    p2 = P*b;
    f = (p1./p2) - r ;
end
