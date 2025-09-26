% GAUSS_LAGUERRE_DEMO  Demonstrate usage of gauss_laguerre.m
% Run this script to see examples and outputs.

clear; clc;


%% Example 2: integral of e^{-x} sin(x)  (analytic = 0.5)
for n = [ 5, 10, 15]
    [x, w] = gauss_laguerre(n, 0)
    I1 = sum(w .* sin(x).*(1+x).^2 .*(gammainc( (x+1), 2, "upper").*gamma(2)))

    [x, w] = gauss_generalized_laguerre(n, 0)
    I2 = sum(w.* sin(x).*(1+x).^2 .*(gammainc( (x+1), 2, "upper").*gamma(2)))

    F = @(x) exp(-x) .* sin(x).*(1+x).^2 .*(gammainc( (x+1), 2, "upper").*gamma(2));
    R = integral(F, 0, Inf)

    fprintf('Example 2: n=%2d \n', n);
    fprintf('approx1 = %.12g, approx2 = %.12g \n', I1, I2);
    fprintf('error1 = %.3e, error1 = %.3e\n', abs(I1-R), abs(I2-R));
end

% %% Example 3: integral x^{1/2} e^{-x}  (alpha=1/2, analytic = gamma(3/2))
% alpha = 0.5;
% n = 5;
% [x,w] = gauss_laguerre(n, alpha);
% I3 = sum(w);  % because f(x)=1
% fprintf('Example 3: alpha=%.1f, n=%d, approx = %.12g, exact = %.12g\n', ...
%     alpha, n, I3, gamma(alpha+1));
% 
% %% Example 4: integral e^{-2x} sin(x) using scaling (analytic = 1/5)
% lambda = 2;
% n = 10;
% % get nodes and weights for standard weight (alpha=0)
% [y, wy] = gauss_laguerre(n, 0);
% % scaled integral: lambda^{-(alpha+1)} * sum( w_i * f(y_i/lambda) ), here alpha=0
% I4 = (1/lambda) * sum( wy .* sin( y / lambda ) );
% fprintf('Example 4: lambda=%g, n=%d, approx = %.12g, exact = %.12g\n', ...
%     lambda, n, I4, 1/(lambda^2 + 1));

% %% Example 1: integral of e^{-x} x^2  (analytic = 2)
% n = 2;
% [x,w] = gauss_laguerre(n, 0);
% I1 = sum(w .* (x.^2));
% fprintf('Example 1: n=%d, approx = %.12g, exact = 2\n', n, I1);
% 
% % End of demo
