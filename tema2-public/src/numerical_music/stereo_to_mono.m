function mono = stereo_to_mono(stereo)
  [m, n] = size(stereo);
  mono = zeros(m, 1);

  %parcurgem fiecare esantion al semnalului
  for i = 1 : m
    %suma canalelor pt esantionul curent
    signal = 0;
    for j = 1 : n
      signal = signal + stereo(i, j);
    end
    %media canalelor esantionului curent
    mono(i) = (1 / n) * signal;
  end

  % Normalize
  mono = mono / max(abs(mono));
end
