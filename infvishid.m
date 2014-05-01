function y = infvishid(a, b, k)
% inference for p(v=1,h=1)
y = exp(k+a+b) ./ (1 + exp(k+a+b) + exp(a) + exp(b));
% y = 1.0 ./ (exp(-a-b-k)+1+exp(-a-k)+exp(-b-k));