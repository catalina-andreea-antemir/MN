function X = sit(A, b)
  [n, n] = size(A);
  X = zeros(n, 1);
  for i = 1 : n
    X(i) = (b(i) - A(i, 1 : (i - 1)) * X(1 : (i - 1))) / A(i, i);
  endfor
endfunction
