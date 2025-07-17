function mat = read_mat(path)
  # TODO: Parse the .csv file and return the matrix of values (without row and column headers).

  mat = csvread(path);

  # Stergerea primului rand si a primei coloane:
  mat = mat(2 : end, 2 : end);
endfunction