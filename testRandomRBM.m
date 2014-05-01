%% this script generates random RBM for exact inference

numdims = 100;
numhid = 100;

vishid = randn(numdims, numhid);
visbiases = randn(1, numdims);
hidbiases = randn(1, numhid);

filename = '../deep/rbm.uai';
% writeUAI;

visn = numdims;
hidn = numhid;
M = zeros(visn, hidn);
Mr = zeros(hidn, visn);
N = zeros(visn, hidn);
Nr = zeros(hidn, visn);

restart = 1;
numcases = 1;
bp_inference
negvisact