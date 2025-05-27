function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn

    % TODO 1: Open the file for reading
    file = fopen(filename, 'r');

    % TODO 2: Read n, x, y from the file
    n = fscanf(file, "%d", 1);
    x = zeros(1, n + 1);
    y = zeros(1, n + 1);

    for i = 1 : n + 1
      x(i) = fscanf(file, "%d", 1);
    end
    for i = 1 : n + 1
      y(i) = fscanf(file, "%d", 1);
    end

    % TODO 3: Close the file
    fclose(file);
end
