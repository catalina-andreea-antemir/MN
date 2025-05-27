function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  % TODO: parse_data_set_file implementation
  
  file = fopen(file_path, 'r');
  m = fscanf(file, "%d", 1);
  n = fscanf(file, "%d", 1);
  fgetl(file);
  Y = zeros(m, 1);
  InitialMatrix = cell(m, n);
  for i = 1 : m
    line = fgetl(file);
    [tok, line] = strtok(line, " ");
    Y(i) = str2double(tok); %transformam celula in numar
    for j = 1 : n
      [tok, line] = strtok(line, " ");
      value = str2double(tok);
      %verificam daca celula contine valoare numerica sau string
      if isnan(value)
        InitialMatrix{i, j} = tok;
      else
        InitialMatrix{i, j} = value;
      endif
    endfor
  endfor
  fclose(file);
end
