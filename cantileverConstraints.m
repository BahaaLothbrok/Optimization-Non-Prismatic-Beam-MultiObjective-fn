function [c, ceq] = cantileverConstraints(x)
P = 100;  % N
L = 2000; % mm
sigma_all = 8; 


D_1=x(1);
n=x(2);
m=x(3);
D_2=D_1*n;
D_3=D_2*m;
x_v1=0:1:500;   %length of the beam
x_v2=500:1:2000;   %length of the beam
M_x1=P.*x_v1;
M_x2=P.*x_v2;
S_x1=(pi/32)*(D_1+(D_3-D_1).*x_v1./L).^3;
S_x2=(pi/32)*(D_2+(D_3-D_1).*x_v2./L).^3;
sigma_x1= M_x1./S_x1;
sigma_x2= M_x2./S_x2;
sigma = [sigma_x1-sigma_all, sigma_x2-sigma_all] ;

c = sigma;
ceq = [];