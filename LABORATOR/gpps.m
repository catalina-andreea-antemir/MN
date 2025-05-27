function A = gpps(A)
  [m, n] = size(A);
  maxP = min(m, n);
  for p = 1 : maxP
    s = max(abs(A(p : m, p : n - 1)), [], 2);
    f = A(p : m, p) ./ s;
    [~, idx] = max(abs(f));
    idx = idx + p - 1;
    P = eye(m, m);
    P([idx, p], :) = P([p, idx], :);
    A = P * A;
    T = eye(m, m);
    u = A((p + 1) : m, p) / A(p, p);
    T((p + 1) : m, p) = -u;
    A = T * A;
  endfor
endfunction
