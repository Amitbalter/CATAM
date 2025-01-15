n = 50;
t= 1.2; %theta
%u = [0.1703, 0.5678, 0.8448, 0.3876, 0.6143, 0.5114];%n=6, Q2
u = rand(n,1);
x =(-1/t)*log(1-u);

m =0.2:0.01:2;
plot(m,loglike1(x,m,n));
xlabel('m'); ylabel('log likelihood');
%print('loglike_Q3','-depsc2');
hold on;

mhat = sum(x)*log(2)/n;

