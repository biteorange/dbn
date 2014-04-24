numhid = 1000;
numdims = 784;
batchdata = zeros(3,5,1);
batchdata(:,:,1) = [1,1,1,0,0;1,1,1,1,0;
                1,1,1,1,1];
restart = 1;
maxepoch = 10;

vishid     = 0.1*randn(numdims, numhid);
hidbiases  = zeros(1,numhid);
visbiases  = zeros(1,numdims);
filename = 'rbm1.uai';
writeUAI;


numdims = numhid;
numhid = 500;
vishid     = 0.1*randn(numdims, numhid);
hidbiases  = zeros(1,numhid);
visbiases  = zeros(1,numdims);
filename = 'rbm2.uai';
writeUAI;

numdims = numhid;
numhid = 200;
vishid     = 0.1*randn(numdims, numhid);
hidbiases  = zeros(1,numhid);
visbiases  = zeros(1,numdims);
filename = 'rbm3.uai';
writeUAI;




