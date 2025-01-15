%Prints out a vector in Latex syntax

function DB(M)
m = size(M,1);%rows
n = size(M,2);%columns
for i = 1:m
    fprintf('\\begin{pmatrix}')
    for j = 1:n
        fprintf('%3g \\\\', M(i,j))
    end
    fprintf('\\end{pmatrix} \n')
end