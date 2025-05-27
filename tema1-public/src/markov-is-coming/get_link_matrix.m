function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  % Link -> the link matrix associated to the given labyrinth
  % TODO: get_link_matrix implementation
  
  %initializam matricea Link cu matricea de adiacenta
  Link = get_adjacency_matrix(Labyrinth);
  [m, n] = size(Link);
  for i = 1 : m
    nr = 0;
    for j = 1 : n
      %verificam cate valori de 1 exista pe fiecare linie
      if Link(i, j) == 1
        nr = nr + 1;
      endif
    endfor
    for j = 1 : n
      %impartim fiecare valoare de 1 de pe linie la nr de elemente nenule de pe linie
      if Link(i, j) == 1
        Link(i, j) = 1 / nr;
      endif
    endfor
  endfor
end
