h = 0.1;%step size
n = 10;%no of steps
y = zeros(2,n+1);
y(1,1) = 0;%initial y
y(2,1) = 1;%initial y'
t1 = 0;%initial t
t = t1:h:t1+n*h;

g = 1;%gamma
w = 2;%omega
m1 = (-g+sqrt(g^2-4))/2;
m2 = (-g-sqrt(g^2-4))/2;
C = (1-w^2)/((1-w^2)^2+w^2*g^2);
D = -w*g/((1-w^2)^2+w^2*g^2);
alpha1 = (m2*D-w*C)/sqrt(g^2-4);
alpha2 = -(m1*D-w*C)/sqrt(g^2-4);
F = alpha1*exp(m1*t)+alpha2*exp(m2*t)+C*sin(w*t)+D*cos(w*t);%analytic solution
for l = 1:n+1
    if l==1
        fprintf('%4g & %14g \\\\ \n', t(l), y(1,l));
        fprintf('%4g & %14g & %14g & %15e \\\\ \n', t(l), y(1,l), F(l), y(1,l)-F(l));
    else
        k1 = h*func3(t(l-1),y(1,l-1),y(2,l-1));
        k2 = h*func3(t(l-1)+h/2,y(1,l-1)+k1(1)/2,y(2,l-1)+k1(2)/2);
        k3 = h*func3(t(l-1)+h/2,y(1,l-1)+k2(1)/2,y(2,l-1)+k2(2)/2);
        k4 = h*func3(t(l-1)+h,y(1,l-1)+k3(1),y(2,l-1)+k3(2));
        y(:,l) = y(:,l-1)+(k1+2*k2+2*k3+k4)/6;
        fprintf('%4g & %14g \\\\ \n', t(l), y(1,l));
        fprintf('%4g & %14g & %14g & %15e \\\\ \n', t(l), y(1,l), F(l), y(1,l)-F(l));
    end
end

subplot(2,2,4); plot(t,y(1,:)); title('20'); xlabel('t'); ylabel('Y');print('Q8','-depsc2')
hold on

