n = 4;%terms in series
N = 32;
N1 = N+1;%number of values of X
U = zeros(1,N1);%semi-infinite
U1 = zeros(1,N1);%fixed-endpoint-temperature
U2 = zeros(1,N1);%insulated-end
X = zeros(1,N1);
for i = 1:N1
    X(i) = (i-1)/N;%increments of X
    T = 0.5;% T
    Y1 = zeros(1,n);%Terms of infinite sum fixed-endpoint-temperature
    for k = 1:n
        Y1(k) = (2/(k*pi))*exp(-(k^2)*(pi^2)*T)*sin(k*pi*X(i));
    end
    Y2 = zeros(1,n);%Terms of infinite sum for insulated-end
    for k = 1:n
        Y2(k) = (2/((k-1/2)*pi))*exp(-((k-1/2)*pi)^2*T)*sin(((k-1/2)*pi)*X(i));
    end
    U(i) = erfc(X(i)/(2*sqrt(T)));
    U1(i) = 1-X(i)-sum(Y1);
    U2(i) = 1-sum(Y2);
    %fprintf('%.4f & %.4f & %.4f & %.4f \\\\ \n',X(i), U1(i),U2(i),U(i));
end
% subplot(3,2,6);
% plot(X,U1); 
% hold on;
%  plot(X,U2);
% hold on;
% plot(X,U);xlabel('X');ylabel('U'); title(['T = ', num2str(T)]);
% print('Q2_TempPlot', '-depsc2');