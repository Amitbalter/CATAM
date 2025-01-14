f = @(z) exp(-1000*(z.^(1/2)-1).^2);%initial distribution
ML = integral(f,0.0004, 0.969); %mass left inner boundary
MU = integral(f,1.08, 4); %mass left outer boundary
M = integral(f,0.0004,4); %total mass initially
M512 = trapz(X.^2,sig(2000*512+1,:));%mass left at 0.512
disp(ML/M); disp(MU/M); disp(M512/M);
