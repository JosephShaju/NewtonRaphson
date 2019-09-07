clc,close all,clear all
L = .15; %(m) 
D = .01125; %(m) 
d = 8933; %(kg/m3) 
c = 385; %(kg*K) 
a = 1.17*(10^-4); %(W/(m·K) alpha^2 is a constant which will be evaluated as 'a'
rta = sqrt(a);
P = 8; %(W)
S = -P/(d*pi*((D/2)^2)*c*L*a);
T0 = 18 + 273.15; %(K)
TL = 25 + 273.15; %(K)
x=(0:0.01:L)';
t=(0:1:1000)';
[T,X]=meshgrid(t,x);

U= (S/2)*X.^2 + TL - (S/2)*L^2;
figure(2),clf
plot(x,U(:,1000)-273.15)
hold on
axis ([x(1) x(end) min(0) max(50)])

for n=1:1000
    B0 = ((4*(-1)^n*(TL - T0))/(pi*(2*n-1))) - ((16*S*L^2*(-1)^n)/(pi^3*((2*n-1)^3)));
    if n < 6
        disp(B0)
    end
    U = U + B0.*(exp(-((2*n-1)*pi*rta/(2*L))^2*T)).*(cos((2*n-1)*pi*X./(2*L)));     
end
%figure(1), clf, surf(X,T,U,'edgecolor','none')
figure(1),clf
plot(x,U(:,41)-273.15)
hold on
axis ([x(1) x(end) min(25) max(26)])

figure(3),clf
plot(t,U(1,:)-273.15)
hold on
axis ([t(1) t(end) min(0) max(50)])








