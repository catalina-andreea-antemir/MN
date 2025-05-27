function [Q, R] = householder(A)
  [m, n] = size(A);
  Q = eye(m, m);
  for i = 1 : min(m - 1, n)
    v = zeros(m, 1);
    I = eye(m, m);
    v(i : m) = A(i : m, i);
    v(i) = v(i) - sign(v(i)) * norm(v);
    v = v / norm(v);
    H = I - 2 * (v * v');
    Q = H * Q;
    A = H * A;
  endfor
  R = A
  Q
endfunction
