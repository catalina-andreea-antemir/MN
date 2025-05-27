function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)
  % G -> iteration matrix
	% c -> iteration vector
  % TODO: get_Jacobi_parameters
  
  [m, n] = size(Link);
  m = m - 2; %exclidem starile WIN si LOSE
  n = n - 2; %excludem starile WIN si LOSE
  G = Link(1 : m, 1 : n); %matricea Link fara starile WIN si LOSE
  c = Link(1 : m, n + 1); %coloana starii WIN
end
