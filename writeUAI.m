fid = fopen(filename,'w');
fprintf(fid, 'MARKOV\n');
% numdims = 4 % number of visible
% numhid = 2 % number of hidden
% vishid = rand(numdims, numhid);
% hidbiases = rand(1, numhid);
% visbiases = rand(1, numdims);

expvishid = exp(vishid);
exphidbiases = exp(hidbiases);
expvisbiases = exp(visbiases);

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
    norm = 1+expvisbiases(i);
    fprintf(fid, sprintf('%f %f\n', 1/norm, expvisbiases(i)/norm));
end

% write for hidden
for i = 1:numhid
    fprintf(fid, '2\n');
    norm = 1+exphidbiases(i);
    fprintf(fid, sprintf('%f %f\n', 1/norm, exphidbiases(i)/norm));
end

% write for visible
for i = 1:numdims
    for j = 1:numhid
        vis = i-1;
        hid = numdims+j-1;
        norm = expvishid(i,j)+3;
        fprintf(fid, '4\n');
        fprintf(fid, '%f %f\n', 1/norm, 1/norm);
        fprintf(fid, sprintf('%f %f\n', 1/norm, expvishid(i,j)/norm));
    end
end
        




    