function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed
  % FeatureMatrix -> the matrix with all training examples
  % TODO: prepare_for_regression implementation
  
  [m, n] = size(InitialMatrix);
  FeatureMatrix = []
  for i = 1 : m
    k = 1; %indicele de coloana
    for j = 1 : n
      if strcmp(InitialMatrix{i, j}, 'yes') == 1
        FeatureMatrix(i, k) = 1;
        k = k + 1;
      elseif strcmp(InitialMatrix{i, j}, 'no') == 1
        FeatureMatrix(i, k) = 0;
        k = k + 1;
      elseif strcmp(InitialMatrix{i, j}, 'semi-furnished') == 1
        FeatureMatrix(i, k) = 1;
        k = k + 1;
        FeatureMatrix(i, k) = 0;
        k = k + 1;
      elseif strcmp(InitialMatrix{i, j}, 'unfurnished') == 1
        FeatureMatrix(i, k) = 0;
        k = k + 1;
        FeatureMatrix(i, k) = 1;
        k = k + 1;
      elseif strcmp(InitialMatrix{i, j}, 'furnished') == 1
        FeatureMatrix(i, k) = 0;
        k = k + 1;
        FeatureMatrix(i, k) = 0;
        k = k + 1;
      else
        FeatureMatrix(i, k) = InitialMatrix{i, j};
        k = k + 1;
      endif
    endfor
  endfor
end
