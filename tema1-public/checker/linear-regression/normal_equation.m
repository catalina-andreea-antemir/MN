function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method
  % Theta -> the vector of weights
  % TODO: normal_equation implementation

  [m, n] = size(FeatureMatrix);
  %verificam cu ajutorul functiei cholesky daca matricea este pozitiv definita
  [L, poz_def] = chol(FeatureMatrix);
  theta_zero = 0; %bias
  if poz_def != 0
    %daca nu este pozitiv definita Theta contine doar 0
    Theta = zeros(n, 1);
  else
    Theta = zeros(n, 1);
    %aplicam algoritmul gradientului conjugat
    %aplicam formula din pdf X' * X * Theta = X' * Y echivalent sistemului Ax = b
    r = FeatureMatrix' * Y - FeatureMatrix' * FeatureMatrix * Theta;
    v = r;
    tol = tol * tol;
    k = 1;
    rr1 = r' * r;
    while k <= iter && rr1 > tol
      rr1 = r' * r;
      t = rr1 / (v' * FeatureMatrix' * FeatureMatrix * v);
      Theta = Theta + t * v;
      r = r - t * FeatureMatrix' * FeatureMatrix * v;
      rr2 = r' * r;
      s = rr2 / rr1;
      v = r + s * v;
      k = k + 1;
    endwhile
  endif
  %adsugam bias ul
  Theta = [theta_zero; Theta];
end
