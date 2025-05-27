function A = gpp(A)
  [m, n] = size(A);
  maxP = min(m, n);
  for p = 1 : maxP
    [~, idx] = max(abs(A(p : m, p)));
    idx = idx + p - 1;
    P = eye(m);
    P([p, idx], :) = P([idx, p], :);
    A = P * A;
    T = eye(m, m);
    u = A((p + 1) : m, p) / A(p, p);
    T((p + 1) : m, p) = -u;
    A = T * A;
  endfor
endfunction
