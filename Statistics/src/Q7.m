n = 50;
t = 2.2; %theta
u = rand(n,1);
x = real((-1/t)*(lambertw(-1,(u-1)/exp(1))+1));

t = 0.5:0.1:5;
plot(t,loglike2(x,t,n));
xlabel('theta'); ylabel('log likelihood');
%print('loglike_Q7','-depsc2');
hold on;

that = 2*n/sum(x);
