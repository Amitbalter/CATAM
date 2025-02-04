c = 2.998*10^(-4); av = 6.3*10^(-16); h = 6.626; 
k = 1.381; v0 = 3.29; nH = 10^(-3);

R0 = 6.96*10^11; Tstar = 0.58;%Sun
R0 = 1.9*10^12; Tstar = 2;%Solar mass 7
R0 = 3.8*10^12; Tstar = 2.5;%Solar mass 12

Tgas = 0.5; alpha = 4.54*10^(-25);
Tgas = 1; alpha = 2.59*10^(-25);
Tgas = 2; alpha = 2.52*10^(-25);

f = @(v)((v.^(2))./(exp((h*v)/(k*Tstar))-1)); %stars
Q = 10^(15)*(8*pi^2*R0^2/c^2)*integral(f,0,Inf);
r1 = 10^(-3)*(3*Q*10^(15)/(4*pi*nH^2*alpha))^(1/3);

f = @(v)((v0./v).^(1.4)).*exp(-(v./(10*v0)))./(h*v);%quasar
Q = 10^(43)*integral(f,v0,Inf)
r1 = 10^(-3)*(3*Q/(4*pi*(nH^2)*alpha))^(1/3)