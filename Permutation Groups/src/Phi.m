function F = Phi(a,p,A)
o = p(a); %image of a under the perm
B = Orb(a,A);
for j = 1:size(B,2)
    if B(1,j) == o
        F = B(2:end,j); %the witness of the orbit element
    end 
end
