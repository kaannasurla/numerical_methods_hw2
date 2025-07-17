function [y] = high_pass(x, fs, fc)
  % HIGH_PASS – filtru trece sus pentru semnale audio

  % Asigură vector coloană și obține lungimea semnalului
  x = x(:);
  n = length(x);

  % Calculează Transformata Fourier Rapidă (FFT) a semnalului
  X = fft(x);

  % Creează vectorul de frecvențe corespunzător bin-urilor FFT
  if mod(n,2) == 0
    f = [0:n/2, -n/2+1:-1]' * (fs/n);
  else
    f = [0:(n-1)/2, -(n-1)/2:-1]' * (fs/n);
  end

  % Creează masca high-pass folosind indexare logică
  % Comparăm valoarea absolută a fiecărei frecvențe din vectorul 'f' cu frecvența de tăiere 'fc'
  mask = (abs(f) > fc);

  % Aplică filtrul în domeniul frecvenței
  Xf = X .* mask;

  % Calculează Transformata Fourier Inversă Rapidă (IFFT)
  xf = ifft(Xf);
  xf = real(xf);

  % Normează semnalul de ieșire
  y = xf ./ (max(abs(xf)) + eps);
end
