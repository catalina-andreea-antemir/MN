function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations
  % Theta -> the vector of weights
  % TODO: gradient_descent implementation

  theta_zero = 0; %bias
  Theta = zeros(n, 1);
  for k = 1 : iter
    s = 0;
    for i = 1 : m
      %calculez (h - y) * x'
      j = (FeatureMatrix(i, :)' * (FeatureMatrix(i, :) * Theta - Y(i))) / m;
      s = s + j;
    endfor
    Theta = Theta - alpha * s;
  endfor
  %adaugam bias ul
  Theta = [theta_zero; Theta]
end
