function [S, f, t] = spectrogram(signal, fs, window_size)
  % SPECTROGRAM – calculează spectrograma unui semnal
  num_windows = floor(length(signal) / window_size);
  S = zeros(window_size, num_windows);
  hann_window = hanning(window_size);

  for k = 0 : num_windows - 1
    current_window_start_idx = (k * window_size) + 1;
    current_window_end_idx = current_window_start_idx + window_size - 1;
    segment = signal(current_window_start_idx : current_window_end_idx);

    % Aplic Hann window pentru segmentare
    windowed_segment = segment .* hann_window;
    fft_result_full = fft(windowed_segment, 2 * window_size);
    fft_result_single_sided = fft_result_full(1 : window_size);
    S(:, k + 1) = abs(fft_result_single_sided);
  endfor

  % Calculeaza vectorul de frecvenţe (f) pentru fiecare fereastră
  f = (0 : window_size - 1) * fs / (2 * window_size);
  f = f'; % Transpose to make it a column vector.

  % Caleaza vectorul de timp (t) pentru fiecare fereastră
  time_interval_per_window = window_size / fs;
  t = (0 : num_windows - 1) * time_interval_per_window;
  t = t'; % Transpose to make it a column vector.

endfunction
