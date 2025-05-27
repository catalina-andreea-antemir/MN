function X = jacobi(A, b, max_iter, tol)
  D = diag(diag(A));
  L = -tril(A, -1);
  U = -triu(A, 1);
  G = inv(D) * (L + U);
  c = inv(D) * b;
  x = zeros(lenght(b), 1);
  i = 1;
  while i <= max_iter
    x_prev = x;
    x = G *x + c;
    if norm(x - x_prev, inf) < tol
      break;
    endif
    i = i + 1;
  endwhile
endfunction

