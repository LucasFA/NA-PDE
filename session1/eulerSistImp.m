function [t,y]=eulerSistImp(t0,tf,u10,u20,m)
%
% eulerSistImp.m
%
% Solve the initial value problem du/dt = A u(t), u(t0)=[u10,u20] on [t0,tf],
% using the backward Euler method with m+1 nodes.
%
% Returns t, y, nodes and aproximated values at the nodes.
%

    k= (tf-t0)/(m+1);          % k= delta t
    t=linspace(t0,tf,m+1);     % note t(1)=t0 and t(m+1)=tf; 
    y=[u10,u20];               % initial condition


    A=[-1001,999 ; 999, -1001];
    B=(eye(2)-k.*A)^-1;

    for i= 1 : m
        y=[y; (B *(y(i,:))')'];
    endfor
endfunction
%plot(t,u)


