function [f] = rp(x,y,z,a,b)
    P = cubic_poly(x,y,z);
    p1 = P*a;
    p2 = P*b;
    f = (p1./p2);
end
