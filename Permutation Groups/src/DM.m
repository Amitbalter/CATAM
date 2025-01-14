function DM(M)
m = size(M,1);%rows
n = size(M,2);%columns
fprintf('$$\\begin{pmatrix} \n')
for i = 1:m
    for j = 1:n
        if j == n
            fprintf('%3g \\\\ \n', M(i,j));
        else
            fprintf('%3g &', M(i,j))
        end    
    end
end
fprintf('\\end{pmatrix} $$\n')