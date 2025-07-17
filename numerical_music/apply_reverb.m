function signal = apply_reverb(signal, impulse_response)
    impulse_mono = sum(impulse_response, 2) / size(impulse_response, 2);
    L = length(signal) + length(impulse_mono) - 1;
    signal = ifft(fft(signal, L) .* fft(impulse_mono, L));
    signal = signal(1:length(signal));
    signal = signal / max(abs(signal(:)));
endfunction