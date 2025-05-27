function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % Error -> the error of the regularized cost function
  % TODO: linear_regression_cost_function implementation

  %aplic formula din enunt
  m = size(FeatureMatrix, 1);
  s = 0;
  for i = 1 : m
    %calculez h - y
    j = FeatureMatrix(i, :) * Theta(2 : end) - Y(i);
    s = s + j ^ 2;
  endfor
  Error = s / (2 * m);
end
