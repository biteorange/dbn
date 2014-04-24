function y = infvishid(a, b, k)
expa = exp(-a); expb = exp(-b);
expk = exp(k);
% y = exp(k)./(exp(k)+exp(-a)+exp(-b)+exp(-a-b));
y = expk ./ (expk + expa + expb + expa.*expb);