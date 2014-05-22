
start = tic;

 visn = numdims;
 hidn = numhid;
 M = zeros(visn, hidn);
 Mr = zeros(hidn, visn);
 N = zeros(visn, hidn);
 Nr = zeros(hidn, visn);
 
%% bp loop
alpha = 0;
[visn, hidn] = size(vishid);
for i = 1:10
    newM = sumprod(vishid, N);
   
    if max(abs(M(:)-newM(:))) < 1e-4
        fprintf('bp finish in %d\n', i);
        break
    end
   
    M = alpha*M + (1-alpha) * newM;
    Nr = alpha*Nr + (1-alpha) * bsxfun(@plus, -M', (sum(M)+hidbiases)');    
    Mr = alpha*Mr + (1-alpha) * sumprod(vishid', Nr);
    N = alpha*N + (1-alpha) * bsxfun(@plus, -Mr', (sum(Mr)+visbiases)');
end

%% compute marginals
negprods_new = numcases * infvishid(N, Nr', vishid);
% residual = max(abs(negprods_new(:)-negprods(:))) / numcases;
negprods = negprods_new;

% fprintf('marginal residual %f\n', residual);

negvisact = numcases * 1 ./ (1 + exp(-sum(Mr)-visbiases));
neghidact = numcases * 1 ./ (1 + exp(-sum(M)-hidbiases));


      