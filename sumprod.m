function y = sumprod(a, b)
y = log1p(exp(a+b))-log1p(exp(b));
% y = log(1+exp(a+b)) - log(1+exp(b));