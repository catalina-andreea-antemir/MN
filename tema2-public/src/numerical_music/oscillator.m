function x = oscillator(freq, fs, dur, A, D, S, R)
  samples = round(dur * fs); %nr de esantioane
  %vectorul de timp
  time = zeros(samples, 1);
  for i = 1 : samples
    time(i) = (i - 1) / fs;
  end

  sinus = sin(2 * pi * freq * time); %unda sinusoidala

  %calculam nr de esantioane care intra in fiecare faza lui envelope
  a = floor(A * fs); %pt attack
  d = floor(D * fs); %pt decay
  r = floor(R * fs); %pt release
  s = samples - a - d - r; %pt sustain restul de esantioane

  envelope = zeros(samples, 1);
  %faza de attack
  if a == 1
    envelope(1) = 1;
  else
    for i = 1 : a
      envelope(i) = (i - 1) / (a - 1);
    end
  end
  %faza decay
  if d == 1
    envelope(a + 1) = S;
  else
    for i = 1 : d
      envelope(a + i) = 1 - (i - 1) / (d - 1) * (1 - S);
    end
  end
  %faza sustain
  for i = 1 : s
    envelope(a + d + i) = S;
  end
  %faza release
  if r == 1
    envelope(a + d + s + 1) = 0;
  else
    for i = 1 : r
      envelope(a + d + s + i) = S - (i - 1) / (r - 1) * S;
    end
  end

  %aplicam envelope pe unda sinusoidala
  x = zeros(samples, 1);
  min_len = min(length(sinus), length(envelope));
  for i = 1 : min_len
    x(i) = sinus(i) * envelope(i);
  end
end
