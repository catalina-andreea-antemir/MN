function coef = spline_c2 (x, y)
  n = length(x) - 1;
  A = sparse(4 * n, 4 * n);
  b = zeros(4 * n, 1);
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

	% TOOD 1: si(xi) = yi, i = 0 : n - 1
  for i = 1 : n
    A(i, 4 * (i - 1) + 1) = 1; % ai = yi
    b(i) = y(i);
  end

	% TODO 2: s_n-1(xn) = yn
  A(n + 1, 4 * (n - 1) + 1) = 1; % a_n-1
  A(n + 1, 4 * (n - 1) + 2) = x(n + 1) - x(n); % b_n-1
  A(n + 1, 4 * (n - 1) + 3) = (x(n + 1) - x(n)) ^ 2; % c_n-1
  A(n + 1, 4 * (n - 1) + 4) = (x(n + 1) - x(n)) ^ 3; % d_n-1
  b(n + 1) = y(n + 1);

	% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
  for i = 1 : n - 1
    A(n + i + 1, 4 * (i - 1) + 1) = 1; % ai
    A(n + i + 1, 4 * (i - 1) + 2) = x(i + 1) - x(i); % bi
    A(n + i + 1, 4 * (i - 1) + 3) = (x(i + 1) - x(i)) ^ 2; % ci
    A(n + i + 1, 4 * (i - 1) + 4) = (x(i + 1) - x(i)) ^ 3; % di
    A(n + i + 1, 4 * i + 1) = -1; % a_i+1
  end

	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
  for i = 1 : n - 1
    A(2 * n + i, 4 * (i - 1) + 2) = 1; % bi
    A(2 * n + i, 4 * (i - 1) + 3) = 2 * (x(i + 1) - x(i)); % ci
    A(2 * n + i, 4 * (i - 1) + 4) = 3 * (x(i + 1) - x(i)) ^ 2; % di
    A(2 * n + i, 4 * i + 2) = -1; % b_i + 1
  end

	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
  for i = 1 : n - 1
    A(3 * n + i - 1, 4 * (i - 1) + 3) = 2; % c_i
    A(3 * n + i - 1, 4 * (i - 1) + 4) = 6 * (x(i + 1) - x(i));
    A(3 * n + i - 1, 4 * i + 3) = -2;
  end

	% TODO 6: s0''(x0) = 0
  A(4 * n - 1, 3) = 2 % c0

	% TODO 7: s_n-1''(x_n) = 0
  A(4 * n, 4 * (n - 1) + 3) = 2; % c_n-1
  A(4 * n, 4 * (n - 1) + 4) = 6 * (x(n + 1) - x(n)); % d_n - 1

	% Solve the system of equations
  coef = A \ b;
end
