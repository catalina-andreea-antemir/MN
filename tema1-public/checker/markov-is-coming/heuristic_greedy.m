function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	% path -> the states chosen by the algorithm
  % TODO: heuristic_greedy implementation
  
  %initializam traseul cu pozitia de start
  path = [start_position];
  [m, n] = size(Adj);
  visited = zeros(1, m);
  %vectorul de elemente vizitate
  visited(start_position) = 1;
  %verificam daca exista elemente in vectorul traseului
  while length(path) > 0
    position = path(end); %ultimul element din traseu
    %daca am ajuns in cazul unei stari WIN ne oprim
    if probabilities(position) == 1
      break;
    endif
    %verificam care dintre vecinii nodului curent au fost vizitati
    neighbors = [];
    for i = 1 : n
      if Adj(position, i) != 0 && visited(i) == 0
        neighbors = [neighbors, i];
      endif
    endfor
    %verificam daca exista vecini nevizitati
    if length(neighbors) == 0
      path(end) = []; %daca nu exista stergem ultimul nod adaugat in traseu
    endif
    %adaugam nodul cu probabilitatea mai mare la WIN, il adaugam la traseu si il setam ca vizitat
    [~, k] = max(probabilities(neighbors));
    path = [path, neighbors(k)];
    visited(neighbors(k)) = 1;
  endwhile
end
