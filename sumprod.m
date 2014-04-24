function y = sumprod(a, b)
y = log(1+exp(a+b))-log(1+exp(b));