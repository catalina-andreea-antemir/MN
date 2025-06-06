function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits
  % Labyrinth -> the matrix of all encodings for the labyrinths walls
  % TODO: parse_labyrinth implementation
  
  file = fopen(file_path, 'r');
  m = fscanf(file, "%d", 1);
  n = fscanf(file, "%d", 1);
  Labyrinth = zeros(m, n);
  for i = 1 : m
    for j = 1 : n
      Labyrinth(i, j) = fscanf(file, "%d", 1);
    endfor
  endfor
  fclose(file);
end
