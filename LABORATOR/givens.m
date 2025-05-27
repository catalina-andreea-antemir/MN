function [Q, R] = givens(A)
  [m, n] = size(A);
  Q = eye(m, m);
  for i = 1 : n
    for j = m : -1 : (i + 1)
      if A(j, i) ~= 0
        G = eye(m, m);
        r = norm([A(j, i); A(i, i)]);
        G(j, i) = -A(j, i) / r;
        G(i, j) = -G(j, i);
        G(i, i) = A(i, i) / r;
        G(j, j) = A(i, i) / r;
        Q = G * Q;
        A = G * A;
      endif
    endfor
  endfor
  Q = Q';
  R = A
 endfunction

