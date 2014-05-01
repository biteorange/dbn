function y = logdamp(a, b, alpha)
expa = exp(a); expb = exp(b);
zero = alpha * 1./(1+expa) + (1-alpha) * 1./(1+expb);
one = alpha * expa./(1+expa) + (1-alpha) * expb./(1+expb);
y = log(one) - log(zero);