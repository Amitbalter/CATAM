V = zeros(nT, nX);
for i = 1:nT
    for j  = 2:nX-1
       V(i,j) = -(g(i,j+1)-g(i,j))/(2*sig(i,j)*(X(j)^2)*dX);
    end
end

