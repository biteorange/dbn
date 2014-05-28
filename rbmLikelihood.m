clear all
close all

maxepoch=1; 
numhid=10;

fprintf(1,'Converting Raw files into Matlab format \n');
% converter; 

fprintf(1,'Pretraining a deep autoencoder. \n');
fprintf(1,'The Science paper used 50 epochs. This uses %3i \n', maxepoch);

makebatches;
[numcases numdims numbatches]=size(batchdata);

fprintf(1,'RBM: %d-%d \n',numdims,numhid);
restart=1;
rbm;

% finish training rbm
tic;
fprintf(1,'\nCalculating the true log-partition function by brute force.\n');
[logZZ_true] = calculate_true_partition(vishid,hidbiases,visbiases);
toc;
loglik_test_true = ...
    calculate_logprob(vishid,hidbiases,visbiases,logZZ_true,testbatchdata);

save likelihood.mat loglik_test_true

% restart for rbm_bp
restart=1;
rbm_mine;
tic;
fprintf(1,'\nCalculating the true log-partition function by brute force.\n');
[logZZ_true] = calculate_true_partition(vishid,hidbiases,visbiases);
toc;
loglik_test_true_bp = ...
    calculate_logprob(vishid,hidbiases,visbiases,logZZ_true,testbatchdata);

save likelihood.mat loglik_test_true loglik_test_true_bp




