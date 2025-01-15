N = 32;
C = 1/2;
dX = 1/N;
dT = C*(dX)^2;
T = 0.5;
M = T/dT;
U = zeros(M+1,N+2);

U(1,1) = 1/2;
U(2:M+1,1) = ones(1,M);
for m = 1:M
    for n = 2:N+1
        U(m+1,n) = U(m,n)+C*(U(m,n+1)-2*U(m,n)+U(m,n-1));
    end
    U(m+1,N+2) = U(m+1,N);
end

X = zeros(1,N+1);
for k = 1:N+1
    X(k) = (k-1)/N;
end

E = zeros(1,N+1);

for i = 1:N+1
    E(i) = abs(U2(i)-U(M+1,i));
    fprintf('%.4f & %.4f & %.4f & %.4e \\\\ \n',X(i),U2(i),U(M+1,i),E(i));
end

plot(X, E)
% subplot(3,2,6)
% plot(X,U(M+1,1:N+1));
% hold on;
% xlabel('X');ylabel('U'); title(['T = ' num2str(T)]);
% print('Q3_ii', '-depsc2');
