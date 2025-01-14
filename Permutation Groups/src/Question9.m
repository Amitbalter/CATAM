n = 14;
count = 0;%number of pairs that generate S_n
for i = 1:100
    A = randperm(n,n);
    B = randperm(n,n);
    G = transpose([A;B]);
    o = Ord(G);
    if o == factorial(n)
        count = count+1;
    end 
end
count/100