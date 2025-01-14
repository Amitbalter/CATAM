X = (1:1:100); %R/Rin
Y = (1-X.^(-1/2))./(3*pi); %NuSigma
plot(X,Y)