fid = fopen('rbm.uai','w');
fprintf(fid, 'MARKOV\n');
numdims = 4 % number of visible
numhid = 2 % number of hidden
vishid = rand(numdims, numhid);
hidbiases = rand(1, numhid);
visbiases = rand(1, numdims);

numNodes = numdims + numhid

fprintf(fid, sprintf('%d\n', numNodes));
for i = 1:numNodes
    fprintf(fid, '2 ');
end
fprintf(fid, '\n');

%%%%%%%%% Preabmle %%%%%%%%%%%%%%%
fprintf(fid, sprintf('%d\n', numNodes+numdims*numhid));
% write for visible
for i = 1:numdims
    fprintf(fid, sprintf('1 %d\n', i-1));
end

% write for hidden
for i = 1:numhid
    fprintf(fid, sprintf('1 %d\n', numdims+i-1));
end

% write for visible
for i = 1:numdims
    for j = 1:numhid
        vis = i-1;
        hid = numdims+j-1;
        fprintf(fid, sprintf('2 %d %d\n', vis, hid));
    end
end

fprintf(fid, '\n');
%%%%%%%%%%% Potentials %%%%%%%%%%%%%%
for i = 1:numdims
    fprintf(fid, '2\n');
    fprintf(fid, sprintf('0 %f\n', visbiases(i)));
end

% write for hidden
for i = 1:numhid
    fprintf(fid, '2\n');
    fprintf(fid, sprintf('0 %f\n', hidbiases(i)));
end

% write for visible
for i = 1:numdims
    for j = 1:numhid
        vis = i-1;
        hid = numdims+j-1;
        fprintf(fid, '4\n');
        fprintf(fid, '0 0\n');
        fprintf(fid, sprintf('0 %f\n', vishid(i,j)));
    end
end
        




    