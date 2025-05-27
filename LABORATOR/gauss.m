function A = gauss(A)
  [m, n] = size(A);
  maxP = min(m, n);
  for p = 1 : maxP
    T = eye(m, m);
    u = A((p + 1) : m, p) / A (p, p);
    T((p + 1) : m, p) = -u;
    A = T * A;
  endfor
endfunction

