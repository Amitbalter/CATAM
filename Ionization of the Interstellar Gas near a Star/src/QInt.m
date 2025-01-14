function I = QInt(t)
v0 = 3.29;
f = @(v)(v.^(-1)).*((v0./v).^(4.4)).*exp(-t*(v0./v).^3-(v./(10*v0)));
I = integral(f,v0,Inf);
end