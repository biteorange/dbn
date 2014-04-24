file = fopen(rbm_file);
A = fscanf(file, '%f');
visbiases = A(1:visN);
hidbiases = A(visN+1:visN+hidN);
vishid = reshape(A(visN+hidN+1:visN+hidN+visN*hidN), visN, hidN);