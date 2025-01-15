EE = zeros(1,16);
EL = zeros(1,16);
ERK = zeros(1,106);
h = zeros(1,16);
for k = 0:15
    n = 2^k;
    h(k+1) = 0.4/n;
    x1 = 0;
    y1 = 0;
    yE = zeros(1,n+1);
    yL = zeros(1,n+1);
    yRK = zeros(1,n+1);
    x = x1:h(k+1):x1+h(k+1)*n;
    w = exp(-x)- exp(-4*x);
    %Euler Method
    for l = 2:n+1
        yE(l) = yE(l-1)+h(k+1)*func(x(l-1),yE(l-1));
    end
    yL(2) = yL(1) + h(k+1)*func(x(1),yL(1));
    %LF Method
    for l = 3:n+1
        yL(l) = yL(l-2)+2*h(k+1)*func(x(l-1),yL(l-1));
    end 
    %RK4 Method
    for l = 2:n+1
        k1 = h(k+1)*func(x(l-1),yRK(l-1));
        k2 = h(k+1)*func(x(l-1)+h(k+1)/2,yRK(l-1)+k1/2);
        k3 = h(k+1)*func(x(l-1)+h(k+1)/2,yRK(l-1)+k2/2);
        k4 = h(k+1)*func(x(l-1)+h(k+1),yRK(l-1)+k3);
        yRK(l) = yRK(l-1)+(k1+2*k2+2*k3+k4)/6;
    end
    EE(k+1) = yE(n+1)-w(n+1);
    EL(k+1) = yL(n+1)-w(n+1);
    ERK(k+1)= yRK(n+1)-w(n+1);
    %fprintf('%3g & %13g & %15g & %15g \\\\ \n', k, EE(k+1), EL(k+1), ERK(k+1));
end

figure (1), loglog(h,abs(EE)); 
xlabel('h');
ylabel('|E|'); 
print('ErrorEuler', '-depsc2');
gradient(log(abs(EE)),log(h))

% figure (2), loglog(h,abs(EL)); 
% xlabel('h');
% ylabel('|E|'); 
% print('ErrorLF', '-depsc2');
% gradient(log(abs(EL)),log(h))

% figure(3);
% loglog(h,abs(ERK)); 
% xlabel('h');
% ylabel('|E|'); 
% print('ErrorRK4', '-depsc2');
% gradient(log(abs(ERK)),log(h))
