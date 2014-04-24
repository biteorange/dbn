[cases, dim, batches] = size(batchdata);
output = fopen('mnist.txt','w');
for b = 1:batches
    tic
    for n = 1:cases
        fprintf(output, '%d ', batchdata(n, :, b));
        fprintf(output, '\n');
    end
    toc
end