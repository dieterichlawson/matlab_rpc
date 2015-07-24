function [c,d] = fit_rpc( filename, verbose )
    close all;
    if nargin < 2
        verbose = true;
    end
    opts = optimoptions(@lsqnonlin,'Algorithm','trust-region-reflective', ...
                                   'Diagnostics','on', ...
                                   'Display','iter', ...
                                   'FinDiffType','central', ...
                                   'FunValCheck','on', ...
                                   'DerivativeCheck','on', ...
                                   'TolFun',1e-10, ...
                                   'TolX',1e-10, ...
                                   'MaxFunEvals',400, ...
                                   'MaxIter',200, ...
                                   'ScaleProblem','Jacobian', ...
                                   'Jacobian', 'on');
    
    [x,y,z,s,r,err] = load_points(filename);
    rp_s = @(c) rp(x,y,z,s,c(1:20),c(21:39));
    c = lsqnonlin(rp_s,rand(39,1),[],[],opts);
    f1 = rp(x,y,z,s,c(1:20),c(21:39));
    
    rp_r = @(d) rp(x,y,z,r,d(1:20),d(21:39));
    d = lsqnonlin(rp_r,rand(39,1),[],[],opts);
    f2 = rp(x,y,z,r,d(1:20),d(21:39));
    
    f= abs(f1)+abs(f2);
    if verbose
        fprintf('norm of our error: %f, norm of theirs: %f\n',norm(f),norm(err))
        fprintf('min of our error: %f, min of theirs: %f\n', min(f), min(abs(err)))
        fprintf('max of our error: %f, max of theirs: %f\n', max(f), max(abs(err)))
        hist(f,50);
        title('our error');
        figure;
        hist(err,50);
        title('their error');
        figure;
    end
end