file = fopen(rbm_file);
A = fscanf(file, '%f');
visbiases = A(1:visn)';
hidbiases = A(visn+1:visn+hidn)';
vishid = reshape(A(visn+hidn+1:visn+hidn+visn*hidn), visn, hidn);