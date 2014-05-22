numdims = 784;
numhid = 500;

hidbiases = hidrecbiases;
visbiases = visbiases;

filename = 'rbm1.txt';
writeUAI;

numdims = numhid;
numhid = 500;
hidpen=vishid; penrecbiases=hidbiases; hidgenbiases=visbiases;
vishid = hidpen;
hidbiases = penrecbiases;
visbiases = hidgenbiases;
filename = 'rbm2.txt';
writeUAI;


numdims = numhid;
numhid = 2000;
hidpen2=vishid; penrecbiases2=hidbiases; hidgenbiases2=visbiases;

vishid = hidpen2;
hidbiases = penrecbiases2;
visbiases = hidgenbiases2;

filename = 'rbm3.txt';
writeUAI;


% numdims = 5;
% numhid = 10;
% vishid     = 0.1*randn(numdims, numhid);
% hidbiases  = zeros(1,numhid);
% visbiases  = zeros(1,numdims);
% 
% filename = 'small.uai';
% writeUAI;