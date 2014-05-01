function y = truncate(x, thres)
x(x>thres) = thres;
x(x<-thres) = -thres;
y = x;