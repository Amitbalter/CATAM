h = ;%step size
n = ;%no of steps
y = zeros(1,n+1);
xl = ;%initial x
y(1) = ;%initial y
x= xl:h:xl+n*h;
for l  = 1:n+1
    if l==1
        fprintf('& %10g \n', y(l));
    else
        k1 = h*func(x(l-1),y(l-1));
        k2 = h*func(x(l-1)+h/2,y(l-1)+k1/2);
        k3 = h*func(x(l-1)+h/2,y(l-1)+k2/2);
        k4 = h*func(x(l-1)+h,y(l-1)+k3);
        y(l) = y(l-1)+(k1+2*k2+2*k3+k4)/6;
        fprintf('& %10g \n', y(l));
    end
end
w = ;%analytic solution - exp(-x)-exp(-4*x)
plot(x,y,x,w);
legend('RK4', 'exact solution'); xlabel('x'); ylabel('y');
%print('RK4','-depsc2')