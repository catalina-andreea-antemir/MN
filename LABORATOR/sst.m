function X = sst(A, b)
  [n, n] = size(A);
  X = zeros(n, 1);
  for i = n : -1 : 1
    X(i) = (b(i) - A(i, (i + 1) : n) * X((i + 1) : n)) / A(i, i);
  endfor
endfunction
