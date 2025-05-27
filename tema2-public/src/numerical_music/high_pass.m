function signal = high_pass(signal, fs, cutoff_freq)
  n = length(signal);
  signal = fft(signal); %transformarea fourier pentru semnalul dat

  %vectorul frecventelor
  f = zeros(n, 1);
  for i = 1 : n
    f(i) = (i - 1) * (fs / n);
  end
  %construim masca high_pass
  mask = zeros(n, 1);
  for i = 1 : floor(n / 2)
    if f(i) > cutoff_freq
      mask(i) = 1;
      mask(n - i + 1) = 1;
    end
  end
  %calculam produsul Hadamard
  prod_Hadamard = signal .* mask;
  %aplicam transfortarea fourier inversa
  signal = ifft(prod_Hadamard);
  %normalizam
  signal = signal / max(abs(signal));
end
