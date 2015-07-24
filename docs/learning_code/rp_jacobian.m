function [J] = rp_jacobian(x,y,z,a,b)
%RP_JACOBIAN Calculates jacobian of a rational polynomial
    P = cubic_poly(x,y,z);
    b = [1;b];
    p1 = P*a;
    p2 = P*b;
    Ja = P./(p2*ones(1,20));
    Jb = P(:,2:20).*((-p1./((p2).^2))*ones(1,19));
    J=[J1 J2];
end
