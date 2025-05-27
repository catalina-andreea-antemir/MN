function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state
  % TODO: decode_path implementation
  
  valid = 0;
  for i = 1 : length(path)
    if path(i) <= lines * cols
	    valid = valid + 1; %numarul de stari valide (aflate in limitele labirintului)
	  endif
  endfor
  decoded_path = zeros(valid, 2);
  j = 1;
  i = 1;
  while i <= length(path)
    if path(i) <= lines * cols
      %calculam pozitia starii si o adaugam in vector
	    row = ceil(path(i) / cols);
	    col = mod(path(i) - 1, cols) + 1;
	    decoded_path(j, :) = [row, col];
	    j = j + 1;
	  endif
	  i = i + 1;
  endwhile
end
