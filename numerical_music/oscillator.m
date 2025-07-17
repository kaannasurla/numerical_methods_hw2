function [x] = oscillator(freq, fs, dur, A, D, S, R)
  % OSCILLATOR – generează un semnal sinusoidal cu un ADSR
  % Creare vector de timp pentru semnalul sinusoidal
  t = (0 : 1 / fs : dur);
  t = t'; % Transpusa pentru a fi un vector coloană.

  sine_wave = sin(2 * pi * freq * t);

  % Detemină lungimea semnalului
  num_samp = length(t);

  % Calculează numărul de eşantioane pentru fiecare fază a ADSR
  a_samp = floor(A * fs); % Samples for the Attack phase
  d_samp = floor(D * fs); % Samples for the Decay phase
  r_samp = floor(R * fs); % Samples for the Release phase

  s_samp = num_samp - a_samp - d_samp - r_samp;
  adsr_env = zeros(num_samp, 1);
  current_fill_idx = 1;

  if a_samp > 0 && current_fill_idx <= num_samp
    a_env_segment = linspace(0, 1, a_samp);
    segment_end_idx = min(current_fill_idx + a_samp - 1, num_samp);
    adsr_env(current_fill_idx : segment_end_idx) = a_env_segment(1 : (segment_end_idx - current_fill_idx + 1));
    current_fill_idx = current_fill_idx + a_samp;
  end

  if d_samp > 0 && current_fill_idx <= num_samp
    d_env_segment = linspace(1, S, d_samp);
    segment_end_idx = min(current_fill_idx + d_samp - 1, num_samp);
    adsr_env(current_fill_idx : segment_end_idx) = d_env_segment(1 : (segment_end_idx - current_fill_idx + 1));
    current_fill_idx = current_fill_idx + d_samp;
  end

  if s_samp > 0 && current_fill_idx <= num_samp
    s_env_segment = S * ones(s_samp, 1);
    segment_end_idx = min(current_fill_idx + s_samp - 1, num_samp);
    adsr_env(current_fill_idx : segment_end_idx) = s_env_segment(1 : (segment_end_idx - current_fill_idx + 1));
    current_fill_idx = current_fill_idx + s_samp;
  end

  if r_samp > 0 && current_fill_idx <= num_samp
    r_env_segment = linspace(S, 0, r_samp);
    segment_end_idx = min(current_fill_idx + r_samp - 1, num_samp);
    adsr_env(current_fill_idx : segment_end_idx) = r_env_segment(1 : (segment_end_idx - current_fill_idx + 1));
  end

  % Aplica ADSR envelope la semnalul sinusoidal
  x = sine_wave .* adsr_env;
  x = x(1 : length(x) - 1);

endfunction
