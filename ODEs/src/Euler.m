h = ; %step size
n = ; %no of steps
y = zeros(1,n+1);
x1 = ; %initial x
y(1) = ; %initial y
x = x1:h:x1+n*h;
w = ; %analytic solution - exp(-x)-exp(-4*x)
for l  = 1:n+1
    if l == 1
        fprintf('%3g & %10g & %10g & %10g \n', x(l), y(l), w(l), y(l)-w(l));
    else
        y(l) = y(l-1)+h*func(x(l-1),y(l-1));
        fprintf('%3g & %10g & %10g & %10g \n', x(l), y(l),w(l), y(l)-w(l));
    end
end
plot(x,y,x,w);
legend('Euler', 'exact solution'); xlabel('x'); ylabel('y');
print('Euler','-depsc2');


