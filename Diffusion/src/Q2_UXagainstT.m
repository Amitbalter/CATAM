n = 10;%Number of terms in sum
N= 100;%Number of values of T
h = (2-0.0625)/N;%increment of T
T = zeros(1,N+1);
U_X = zeros(1,N+1);%semi-infinite
U_X1 = zeros(1,N+1);%fixed-endpoint-temperature
U_X2 = zeros(1,N+1);%insulated-end
for i = 1:N+1
    T(i) = 0.0625+h*(i-1);
    U_X(i) = 1/(sqrt(pi*T(i)));
    Y1 = zeros(1,n);
    Y2 = zeros(1,n);
    for k =1:n
        Y1(k) = exp(-(k^2)*(pi^2)*T(i));%terms of sum for fixed-endpoint-temperature   
        Y2(k) = exp(-(((k-(1/2))*pi)^2)*T(i));%terms of sum for fixed-endpoint-temperature      
    end
    U_X1(i) = 1+2*sum(Y1);
    U_X2(i) = 2*sum(Y2);
end
plot(T,U_X1);
hold on
plot(T,U_X2);
plot(T,U_X);
xlabel('T');ylabel('-U_X');
print('Q2_HeatFluxPlot', '-depsc2');



