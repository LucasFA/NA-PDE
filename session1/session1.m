% Preliminars: codes
%
% Finite differences inestabilities

x=1;
h=[0.001,0.0025, 0.005, 0.01,0.025,0.05,0.075,0.1]
Dfor = (sin(x+h)-sin(x))./h;
Dback = (sin(x)-sin(x-h))./h;
Dcentred = (sin(x+h)-sin(x-h))./(2*h);
plot(h,abs(Dfor-cos(x)),h,abs(Dback-cos(x)),h,abs(Dcentred-cos(x)))
plot(h,abs(Dcentred-cos(x)))



function eval = test(t,u);
% Test function definition
  eval = 1*u;
end


[x,y]=euler('test',0,1,1,10);
plot(x,y,'--rs')
plot(x,y,'rs',x,exp(x))

[x,y]=euler('test',0,1,1,20);
plot(x,y,'rs',x,exp(x))

[x,y]=euler('test',0,1,1,40);
plot(x,y,'rs',x,exp(x))

[x,y]=euler('test',0,1,1,100);
plot(x,y,x,exp(x))


% 
function eval = f(t,u);
% function f for the equation u''=-u
eval = [u(2);-u(1)];
end 



[x,y]=euler('f',0,pi,[0;1],50)
plot(x,y(1,:),'rs',x,sin(x))




%-------------------------------

function eval=finest(t,u);
% Stiff IVP example
% Example: du/dt = lambda*(u-cos(t))-sin(t) u(0)=1
% Real solution u(t) = cos(t)
eval=-1000*(u-cos(t))-sin(t);
end


[x,y]=euler('finest',0,1,1,450);
plot(x,y)
[x,y]=euler('finest',0,1,1,480);
plot(x,y)
[x,y]=euler('finest',0,1,1,490);
plot(x,y)
[x,y]=euler('finest',0,1,1,492);
plot(x,y)
[x,y]=euler('finest',0,1,1,500);
plot(x,y)


