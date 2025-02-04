N = 100000; %number of timesteps
h = (nT-1)/N; %timestep
n = 1001; %number of spacesteps
a = 0.9; 
b = 1.1;
R0 = a:(b-a)/(n-1):b;
p = 100000; %precision 
Max = zeros(1,n);%max distance
Ind = zeros(1,n);%time to reach max distance
Boun= zeros(1,n);%time to hit boundary
for j = 1:n
    R = zeros(1,N);%position vector
    R(1) = R0(j); %r0
    for i  = 1:N+1
            x = sqrt(R(i));
            I = floor(50*x); %position in vector
        if 4 > round(p*R(i))/p && 0.0004 < round(p*R(i))/p
            v = ((V((i-1)*h+1,I+1)*(x-X(I)))+(V((i-1)*h+1,I)*(X(I+1)-x)))/dX;
            %linear interpolation of velocity
            R(i+1) = R(i)+h*dT*v; %calculating next position
            Length = i;
        else
            Boun(j) = Length*h*dT ;
            break
        end 
    end
    time = 0:dT*h:(Length-1)*dT*h;
    plot(time,R(1:Length)); xlabel('\tau');ylabel('r');
    hold on;
    [Max(j),Ind(j)] = max(R);
end
Time = Ind*h*dT;
plot(R0,Max);
plot(R0,Time);
k = 960; plot(R0(1:k),Boun(1:k));