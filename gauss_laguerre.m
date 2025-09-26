function [x, w] = gauss_laguerre(n, alpha)
% GAUSS_LAGUERRE  Compute n-point Gauss-Laguerre nodes and weights
%   [x,w] = gauss_laguerre(n)          % default alpha = 0
%   [x,w] = gauss_laguerre(n, alpha)   % alpha > -1
%
% Output:
%   x : n-by-1 vector of nodes (ascending)
%   w : n-by-1 vector of weights
%
% Method: Golub-Welsch (Jacobi matrix eigen-decomposition)
%
% Requirements: alpha > -1, n positive integer

if nargin < 2
    alpha = 0;
end

if ~(isscalar(n) && n==floor(n) && n>0)
    error('n must be a positive integer.');
end
if ~(isscalar(alpha) && alpha > -1)
    error('alpha must be a scalar > -1.');
end

% Build Jacobi matrix J (n x n)
i = (1:n)';                % column vector
d = 2*i - 1 + alpha;       % diagonal entries
if n > 1
    off = sqrt( (1:n-1)' .* ((1:n-1)' + alpha) ); % subdiagonal
else
    off = [];
end

J = diag(d);
if n > 1
    J = J + diag(off,1) + diag(off,-1);
end

% Eigendecomposition (symmetric real -> real eigenvalues)
[V,D] = eig(J);
x = diag(D);
[x, idx] = sort(x);        % sort ascending
V = V(:, idx);

% weights: mu0 * (first-row of V)^2, mu0 = gamma(alpha+1)
mu0 = gamma(alpha + 1);
w = mu0 * (V(1,:).^2)';

end
