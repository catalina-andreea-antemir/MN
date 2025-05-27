function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.
  mat = read_mat(path);
  mat = preprocess(mat, min_reviews);

  [U, S, V] = svds(mat, num_features);
  recoms = zeros(1, num_recoms);

  [n, m] = size(V);

  liked = V(liked_theme, :)';
  sims = zeros(n, 1);

  for i = 1 : n
    sims(i) = cosine_similarity(liked, V(i, :)');
  end

  %eliminam tema apreciata
  all_indices = 1:n;
  mask = all_indices ~= liked_theme;
  indices = all_indices(mask);
  scores = sims(mask);

  % Sort?m descresc?tor scorurile ?i reordon?m indicii corespunz?tor
  [scores, sort_order] = sort(scores, 'descend');
  indices = indices(sort_order);
  %returnam cele mai bune num_recoms recomandari
  recoms = indices(1 : num_recoms);
end
