function A = gpt(A)
  [m, n] = size(A);
  maxP = min(m, n);
  Q = eye(n, n);
  for p = 1 : maxP
    sub_A = abs(A(p : m, p : n - 1));
    [~, idx] = max(sub_A(:));
    [row, col] = ind2sub(size(sub_A), idx);
    row = row + p - 1;
    col = col + p - 1;
    P = eye(n, n);
    P(:, [p, col]) = P(:, [col, p]);
    Q = Q * P;
    A = A * P;
    P = eye(m, m);
    P([p, row], :) = P([row, p], :);
    A = P * A;
    T = eye(m, m);
    u = A((p + 1) : m, p) / A(p, p);
    T((p + 1) : m, p) = -u;
    A = T * A;
  endfor
endfunction
