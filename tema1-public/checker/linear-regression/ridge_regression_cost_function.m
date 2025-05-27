function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of
  %           shrinkage applied to the regression coefficients
  % Error -> the error of the regularized cost function
  % TODO: ridge_regression_cost_function implementation

  %aplicam formula din enunt pt ridge regression
  [m, n] = size(FeatureMatrix);
  t = 0;
  s = 0;
  for i = 1 : length(Theta)
    t = t + Theta(i) ^ 2; %facem suma patratelor elementelor lui Theta
  endfor
  for i = 1 : m
    %ignoram valoarea de pe poz 0 din Theta intrucat este 0 (2 : end)
    j = FeatureMatrix(i, :) * Theta(2 : end) - Y(i);
    s = s + j ^ 2;
  endfor
  s = s / (2 * m);
  Error = s + lambda * t;
end
