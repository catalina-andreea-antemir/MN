function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed
  % TODO: perform_iterative implementation

  %implementarea metodei Jacobi data in laborator
  x = x0;
  i = 1;
  while i <= max_steps
    x0 = x;
    x = G * x + c;
	  steps = i; %retinem pasul
	  err = norm(x - x0); %norma euclidiana dintre solutia curenta si cea precedenta
    if err < tol
      break;
    endif
    i = i + 1;
  endwhile
end
