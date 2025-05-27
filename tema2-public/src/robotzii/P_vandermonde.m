function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1

	% TODO: Calcualte y_interp using the Vandermonde coefficients
  n = length(coef) - 1;
  n_interp = length(x_interp);
  y_interp = zeros(n_interp, 1);

  for i = 1 : n_interp
    %P_vandermonde este 0 pentru fiecare x_interp(i)
    P_vandermonde = 0;
    for j = 1 : n + 1
      %calculam polinomul P_vandermonde(x_interp(i))
      P_vandermonde = P_vandermonde + coef(j) * x_interp(i) ^ (j - 1);
    end
     %y_interp(i) = P_vandermonde(x_interp(i))
    y_interp(i) = P_vandermonde;
  end
end
