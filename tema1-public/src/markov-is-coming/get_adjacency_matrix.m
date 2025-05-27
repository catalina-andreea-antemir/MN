function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  % Adj -> the adjacency matrix associated to the given labyrinth
  % TODO: get_adjacency_matrix implementation

  [m, n] = size(Labyrinth);
  %Adj este matrice sparse
  Adj = sparse(m * n + 2, m * n + 2);
  for i = 1 : m
    for j = 1 : n
    %verificam daca la vest exista perete
      if bitget(Labyrinth(i, j), 1) == 0
        if j > 1
          Adj((i - 1) * n + j, (i - 1) * n + j - 1) = 1;
          Adj((i - 1) * n + j - 1, (i - 1) * n + j) = 1;
        elseif j == 1 %starea LOSE
          Adj((i - 1) * n + j, m * n + 2) = 1;
        endif
      endif
      %verificam daca la est exista perete
      if bitget(Labyrinth(i, j), 2) == 0
        if j < n
          Adj((i - 1) * n + j, (i - 1) * n + j + 1) = 1;
          Adj((i - 1) * n + j + 1, (i - 1) * n + j) = 1;
        elseif j == n %starea LOSE
          Adj((i - 1) * n + j, m * n + 2) = 1;
        endif
      endif
      %verificam daca la sud exista perete
      if bitget(Labyrinth(i, j), 3) == 0
        if i < m
          Adj((i - 1) * n + j, i * n + j) = 1;
          Adj(i * n + j, (i - 1) * n + j) = 1;
        elseif i == m %starea WIN
          Adj((i - 1) * n + j, m * n + 1) = 1;
        endif
      endif
      %verificam daca la nord exista perete
      if bitget(Labyrinth(i, j), 4) == 0
        if i > 1
          Adj((i - 1) * n + j, (i - 2) * n + j) = 1;
          Adj((i - 2) * n + j, (i - 1) * n + j) = 1;
        elseif i == 1 %starea WIN
          Adj((i - 1) * n + j, m * n + 1) = 1;
        endif
      endif
    endfor
  endfor
  Adj(m * n + 1, m * n + 1) = 1; %starea WIN
  Adj(m * n + 2, m * n + 2) = 1; %starea LOSE
end
