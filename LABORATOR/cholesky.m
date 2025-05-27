function L = cholesky(A)
  [n, n] = size(A);
  L = zeros(n, n);

  for p = 1 : n
    for i = p : n
      s = L(p, 1 : p) * L(i, 1 : p)';
      if i == p
        L(p, p) = sqrt(A(p, p) - s);
      else
        L(i, p) = (A(i, p) - s) / L(p, p);
      endif
    endfor
  endfor
endfunction
