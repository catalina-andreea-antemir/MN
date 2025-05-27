function L = crout(A)
  [n, n] = size(A);
  L = zeros(n, n);
  U = eye(n, n);
  for p = 1 : n
    for i = 1 : (p - 1)
      U(i, p) = (A(i, p) - (L(i, 1 : i) * U(1 :  i, p))) / L(i, i);
    endfor
    for i = p : n
      L(i, p) = A(i, p) - (L(i, 1: i) * U(1 : i, p));
    endfor
  endfor
endfunction
