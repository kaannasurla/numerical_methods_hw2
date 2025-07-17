function mono = stereo_to_mono(stereo)
  % Calculez media aritmetica a celor doua canale stereo
  mono = mean(stereo, 2);

  % Normez
  mono = mono / max(abs(mono));
endfunction