function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.
  lA = length(A);
  lB = length(B);
  prod_sc = 0;

  norm_A = norm(A);
  norm_B = norm(B);
  %daca vectorii au aceeasi dimensiune calculam produsul scalar
  if lA == lB
    for i = 1 : lA
      prod_sc = prod_sc + A(i) * B(i);
    end
  end
  %aplicam formula din enunt
  similarity = prod_sc / (norm_A * norm_B);
end
