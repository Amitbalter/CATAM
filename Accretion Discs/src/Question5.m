for i  = [0,2,8,32,128,512]
    [m,k] = max(sig(2000*i+1,:)); %peak in surface density
    fprintf('%.5f & %.4f \\\\ \n',m,X(k)^2);
end

L0 = trapz(X,2*(X.^4).*sig(1,:));%total angular momentum at t=0
N = nT-1;
L = zeros(1,N);
Time = zeros(1,N);
for i = 1:N
    L(i) = trapz(X,2*(X.^4).*sig((nT-1)*i/N,:))/L0;%Total angular momentum
    Time(i) = ((nT-1)*i)*dT/N;
end
plot(Time,L)

N = nT-1;
M = zeros(1,N);%Peak of angular momentum surface density
Time = zeros(1,N);
for i = 1:N
    [l,M(i)] = max(X.*sig((nT-1)*i/N,:));
    Time(i) = ((nT-1)*i)*dT/N;
end
f = fit(transpose(Time),transpose(X(M)),'poly9');%curve of best fit
plot(f,transpose(Time),transpose(X(M)))
