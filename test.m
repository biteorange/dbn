clear all
close all

maxepoch=10; %In the Science paper we use maxepoch=50, but it works just fine. 
numhid=1000;

fprintf(1,'Converting Raw files into Matlab format \n');
% converter; 

fprintf(1,'Pretraining a deep autoencoder. \n');
fprintf(1,'The Science paper used 50 epochs. This uses %3i \n', maxepoch);

makebatches;
[numcases numdims numbatches]=size(batchdata);
restart = 1;

visN = numdims;
hidN = numhid;
rbm_mine;