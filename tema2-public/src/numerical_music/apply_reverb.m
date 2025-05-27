function signal = apply_reverb(signal, impulse_response)
  %aplicam stereo_to_mono ca impulse_response sa fie de timp mono
  impulse_response = stereo_to_mono(impulse_response);
  %calculam convolutia
  signal = fftconv(signal, impulse_response);
  %normalizam
  signal = signal / max(abs(signal));
end
