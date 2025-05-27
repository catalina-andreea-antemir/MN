function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transforme
  % TODO: parse_csv_file implementation
  
  file = fopen(file_path, 'r');
  line = fgetl(file);
  m = 0;
  Y = [];
  InitialMatrix = {};
  line = fgetl(file);
  %verificam daca fisierul este gol
  while line != -1
    copy_line = line;
    m = m + 1;
    n = 1;
    [tok, copy_line] = strtok(copy_line, ",");
    Y = [Y; str2double(tok)]; %adaugam valoarea numerica in vectorul Y
    while length(copy_line) != 0
      [tok, copy_line] = strtok(copy_line, ",");
      value = str2double(tok);
      %verificam daca celula contine valoare numerica sau string si o adaugam in matrice
      if isnan(value)
        InitialMatrix{m, n} = tok;
      else
        InitialMatrix{m, n} = value;
      endif
      n = n + 1;
    endwhile
    line = fgetl(file);
  endwhile
  fclose(file);
end
