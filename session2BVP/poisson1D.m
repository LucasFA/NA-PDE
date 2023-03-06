% poisson1D.m -- 
% Compute a numerical approximation to the solution
% to the boundary value problem: 
% u_{xx} = f , x\in[a,b],
%  u(a)= \alpha, u (b)= \beta 
% by using finite difference method.
% This is the Poisson model that corresponds to the 
% steady state of a diffusive process, as heat transfer, 
% with an external source.
%
% Data problem declaration
a = 0;     
b = 4; 
alpha = 1;
beta = 2;
% function f(x) (point-wise evaluable on vectors)
f = @(x) -cos(x);                 
%
% Grid data
m = 30;                   % # of interior nodes >=3
h = (b-a)/(m+1); 
% Grid nodes, boundaries included
x = linspace(a,b,m+2);   
%
% Linear system declaration
% Matrix
e = ones(m,1);
A= spdiags([e -2*e e],[-1 0 1],m,m);			
A= A/h^2;
% Right hand side.
xint=(x(2:m+1))';
rhs=f(xint);
rhs(1) = rhs(1) -alpha/h^2;
rhs(m) = rhs(m)- beta/h^2;
%
% Linear system solving
uvec = A\rhs;  
%
% Solution plotting
usoln = [alpha; uvec; beta];
%clf;
plot(x,usoln,'*')