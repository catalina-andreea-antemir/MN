function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % TODO: Calculate the Vandermonde coefficients
    n = length(x) - 1;
    A = zeros(n + 1, n + 1);
    b = zeros(n + 1);

    for i = 1 : n + 1
      %linia i din matricea A = [x(i) ^ 0, x(i) ^ 1, ..., x(i) ^ n]
      for j = 1 : n + 1
        A(i, j) = x(i) ^ (j - 1);
      end
      %b = y
      b(i) = y(i);
    end
    %A * coef = b
    coef = inv(A) * b;
endfunction
