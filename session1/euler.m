function [t,y]=euler(f,t0,tf,u0,m)
%
% Aproximation of the IVP:
% du/dt = f(t,u(t)), u(t0) = u0  t en [t0,tf],
% by using the Euler method in a unform grid (m+1 nodes).
% For n-dimensional systems u0 is a column vector.
%
% Returns:
% t grid vector
% y aproximated values vector: y(:,i) approx u(t(i)).
% Type plot(t,y) for plotting the results
%
% Variables inicialization
    k= (tf-t0)/(m);          % k= delta t
    t=linspace(t0,tf,m+1);     % note t(1)=t0 and t(m+1)=tf; 
    y=[u0];                    % initial condition
    %
    % Time evolution loop
    for i= 1:m
        y=[y, y(:,i) + k*feval(f,t(i),y(:,i))];
    endfor
endfunction



