% GAUSS_LAGUERRE_DEMO  Demonstrate usage of gauss_laguerre.m
% Run this script to see examples and outputs.

clear; clc;

%% Example: 
for n = [ 5, 10, 15]
    alpha = 3;
    %% 广义形式  integral x.^alpha .*exp(-x) .* f(x)
    %% f(x) = sin(x).*(1+x).^2 .*(gammainc( (x+1), 2, "upper").*gamma(2));
    fun = @(x) x.^alpha .*exp(-x) .* sin(x).*(1+x).^2 .*(gammainc( (x+1), 2, "upper").*gamma(2));
    R = integral(fun, 0, Inf);
    %% f(x)
    f = @(x) sin(x).*(1+x).^2 .*(gammainc( (x+1), 2, "upper").*gamma(2));
    [nodes, weights] = gauss_laguerre(n, alpha)
    I1 = sum(weights .* f(nodes));

    fprintf('Example 2: n = %2d \n', n);
    fprintf('Example 2: Real = %.12g \n', R);
    fprintf('approx1 = %.12g \n', I1);
    fprintf('error1 = %.3e \n', abs(I1-R));
end
