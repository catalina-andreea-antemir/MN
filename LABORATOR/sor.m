function x = sor(A, b, w, max_iter, tol)
  n = lenght(b);
  x = zeros(n, 1);
  for i = 1 : max_iter
    x_prev = x;
    for j = 1 : n
      sum1 = A(j, 1 : j-1) * x(1 : j-1);
      sum2 = A(j, j+1 : n) * x_prev(j+1 : n);
      x(j) = (b(j) - sum1 - sum2) / A(j, j);
    endfor
    x = w * x + (1 - w) * x_prev;
    if norm(x - x_prev) < tol
      break;
    endif
  endfor
endfunction
