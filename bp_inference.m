visn = numdims;
hidn = numhid;

% vishid     = 0.1*randn(visn, hidn);
% hidbiases  = zeros(1,hidn);
% visbiases  = zeros(1,visn);
  
% M = zeros(visn, hidn);
% Mr = zeros(hidn, visn);
% N = zeros(visn, hidn);
% Nr = zeros(hidn, visn);
% a = visbiases;
% b = hidbiases;

a = visbiases;
b = hidbiases;

start = tic;
alpha = 0.5;
for i = 1:1
%     M = (1-alpha)*M + alpha* sumprod(vishid, N);
%     Nr = (1-alpha)*Nr + alpha * bsxfun(@plus, -M', (sum(M)+b)');    
%     Mr = (1-alpha)*Mr + alpha * sumprod(vishid', Nr);
%     N = (1-alpha)*N + alpha * bsxfun(@plus, -Mr', (sum(Mr)+a)');
    M = logdamp(M, sumprod(vishid, N), alpha);
    Nr = logdamp(Nr, bsxfun(@plus, -M', (sum(M)+b)'), alpha);
    Mr = logdamp(Mr, sumprod(vishid', Nr), alpha);
    N = logdamp(N, bsxfun(@plus, -Mr', (sum(Mr)+a)'), alpha);
end

negprods_new = numcases * infvishid(N, Nr', vishid);
residual = max(abs(negprods_new(:)-negprods(:))) / numcases;

negprods = negprods_new;

fprintf('bp in iter %d, residual %f(max %f), %.4f sec\n', i, residual, max(negprods_new(:))/numcases, toc(start));

negvisact = numcases * 1.0 ./ (1.0 + exp(-sum(Mr) + visbiases));
neghidact = numcases * 1.0 ./ (1.0 + exp(-sum(M) + hidbiases));


% tic;
% % one iteration
% 
% for v = 1:visn
%     for h = 1:hidn
%         M(v,h) = sumprod(vishid(v,h), N(v,h));
%         Mr(h,v) = sumprod(vishid(v,h), Nr(h,v));
%         
%         N(v,h) = sum(Mr(:,v))-Mr(h,v)+a(v);
%         Nr(h,v) = sum(M(:,h))-M(v,h)+b(h);
%     end
% end
% toc;


      