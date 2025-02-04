c = 2.998*10^(-4); av = 6.3*10^(-16); h = 6.626; 
k = 1.381; v0 = 3.29 ;nH = 10^(-3);

R0 = 6.96*10^11; Tstar = 0.58;dR =10^14; %Sun
R0 = 1.9*10^12; Tstar = 2;dR =10^18; %Solar mass 7
R0 = 3.8*10^12; Tstar = 2.5;dR =2*10^18; %Solar mass 12
R0 = 10^21;dR =4*10^21; %Quasar

Tgas = 0.5; alpha = 4.54*10^(-25);
Tgas = 1; alpha = 2.59*10^(-25); 
Tgas = 2; alpha = 2.52*10^(-25); 

N =500;
R = R0:dR:(R0+(N-1)*dR);
T = zeros(1,N); T(1) = 0;
nH0 = zeros(1,N);
np = zeros(1,N);
C = zeros(1,N);
for i = 1:N
    C(i) = (v0^3)*((R0/R(i))^2)*(2*pi/(c^2))*...
        (av/alpha)*Int(T(i),Tstar); %stars
    C(i) = ((10^(43))*av/(alpha*4*pi*h*(R(i)^2)))...
        *QInt(T(i));%quasar
    if C(i) > 10^(8)
        np(i) = nH - (nH^2)/C(i)+2*(nH^3)/(C(i)^2);
    else
        np(i) = (-C(i)+sqrt(C(i)^2+4*C(i)*nH))/2;
    end
    nH0(i) = nH-np(i);
    if i == N
        break
    end
    if i <= 4
        T(i+1) = T(i)+dR*av*nH0(i);
    else
        T(i+1) = T(i)+(dR/720)*av*(1901*nH0(i)-2774*nH0(i-1)...
        +2616*nH0(i-2)-1274*nH0(i-3)+251*nH0(i-4));
    end
end

plot(10^(-3)*R,10^3*np)
hold on;
plot(10^(-3)*R,10^3*nH0)
hold on; plot(10^(-3)*R(1),1.01);hold on; plot(10^(-3)*R(1),-0.01);
xlabel('r');ylabel('Proportion');

for j = 1:n
fprintf('%.0f & %.6f \\\\ \\xrowht{15pt} \n',...
    10^(-23)*R(j*N/n),10^3*nH0(j*N/n));
fprintf('%.1f & %.6f \\\\ \\xrowht{15pt} \n',...
    10^(-23)*R(800 +10*(j-1)),10^3*nH0(800 +10*(j-1)));
end