function I = Int(t,Tstar)
h = 6.626; k = 1.381; v0 = 3.29;
f = @(v)((v.^(-1)).*exp(-t*(v0./v).^3))./(exp((h*v)/(k*Tstar))-1);
I = integral(f,v0,Inf);
end