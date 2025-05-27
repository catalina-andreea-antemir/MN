function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples
  % TODO: split_dataset implementation

  [m, n] = size(X);
  k = percent * m; %numarul de exemple
  X_train = zeros(k, n);
  y_train = zeros(k);
  %punem primele k exemple in training
  for i = 1 : k
    X_train(i, :) = X(i, :);
    y_train(i) = y(i); %label urile pt fiecare exemplu
  endfor
  X_test = zeros(m - k, n);
  y_test = zeros(m - k);
  %punem restul exemplelor in test
  for i = k + 1 : m
    X_test(i - k, :) = X(i, :);
    y_test(i - k) = y(i);
  endfor
end
