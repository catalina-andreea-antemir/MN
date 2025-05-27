function [S f t] = spectrogram(signal, fs, window_size)
  m = length(signal);
  num_windows = floor(m / window_size); %numarul de ferestre

  window = hanning(window_size);
  S = zeros(window_size, num_windows); %matricea spectograma

  for i = 1 : num_windows
    idx_start = (i - 1) * window_size + 1;
    idx_end = idx_start + window_size - 1;
    seg = signal(idx_start : idx_end); %extragem segmentul curent din semnal
    %aplica fereastra Hann pe segment
    for j = 1 : window_size
      seg(j) = seg(j) * window(j);
    end
    %fourier cu rezolutie dubla fata de dimensiunea ferestrei
    result_fft = fft(seg, window_size * 2);
    result_fft = result_fft(1 : window_size) %pastreaza prima jumatate neconjugata
    S(:, i) = abs(result_fft); %o adaugam in matrice
  end
  %vectorul de frecvente
  f = zeros(window_size, 1);
  for i = 1 : window_size
    f(i) = (i - 1) * (fs / (2 * window_size));
  end
  %vectorul de timp
  t = zeros(num_windows, 1);
  for i = 1 : num_windows
    t(i) = (i - 1) * (window_size / fs);
  end
end
