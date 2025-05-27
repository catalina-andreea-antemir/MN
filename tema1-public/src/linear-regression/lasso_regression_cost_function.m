function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients
  % Error -> the error of the regularized cost function
  % TODO: lasso_regression_cost_function implementation

  %aplicam formula din enunt pt lasso regression
  [m, n] = size(FeatureMatrix);
  t = 0;
  s = 0;
  for i = 1 : length(Theta)
    t = t + abs(Theta(i)); %facem suma modulelor elementelor din Theta
  endfor
  for i = 1 : m
    %ignoram valoarea de pe pozitia 0 din vectorul theta intrucat este 0 (2 : end)
    j = Y(i) - FeatureMatrix(i, :) * Theta(2 : end);
    s = s + j ^ 2;
  endfor
  s = s / m;
  Error = s + lambda * t;
end
