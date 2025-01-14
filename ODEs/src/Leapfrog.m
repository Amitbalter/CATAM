h = ;%step size
n = ;%no of steps
y = zeros(1,n+1);
xl = ;%initial x
y(1) = ;%initial y
x = xl:h:xl+n*h;
y(2) = y(1) + h*func(x(1),y(1));
E = zeros(1,n+1);
w = ;%analytic solution - exp(-x)-exp(-4*x)
for l  = 1:n+1
    if l <=2
        E(l) = y(l)- w(l);
        fprintf('%6g & %15e & %15e & %15e \\\\ \n', x(l), y(l), w(l), E(l))
    else 
        y(l) = y(l-2)+2*h*func(x(l-1),y(l-1));
        E(l) = y(l)- w(l);
        fprintf('%3g  & %15e & %15e & %15e \\\\ \n', x(l), y(l), w(l), E(l))
    end
end