function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.
  [m, n] = size(mat);
  count = zeros(m, 1);
  valid = [];

  for i = 1 : m
    for j = 1 : n
      if mat(i, j) != 0
        %retinem intr un vector nr de reviews nenule pt fiecare linie
        count(i) = count(i) + 1;
      end
    end
    %daca nr de reviews pt linia curenta indeplineste conditia adaugam linia in valid
    if count(i) >= min_reviews
      valid = [valid, i];
    end
  end
  %adaugam randurile care indeplinesc conditiile in reduced_mat
  reduced_mat = mat(valid, :);
end
