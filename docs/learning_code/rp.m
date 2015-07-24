
function [f,J] = rp(x,y,z,s,a,b)
%RP Calculates value and jacobian of a rational polynomial
    P = cubic_poly(x,y,z);
    b = [1;b];
    p1 = P*a;
    p2 = P*b;
    f = (p1./p2)-s;
    if nargout > 1
        J1 = P./(p2*ones(1,20));
        J2 = P(:,2:20).*((-p1./((p2).^2))*ones(1,19));
        J=[J1 J2];
    end
end

