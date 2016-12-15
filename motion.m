function [Fx,Fy] = motion(x,y,t,m)
%Function used to determine the x and y components of force required to
%move a particle along a given path 
vx=diff(x)./diff(t);
%velocity is change in x vector divided by change in t. The dot indicates
%term by term division, rather than matrix by matrix
vx=[vx(1),vx];
%Diff function makes matrix one column shorter, need to do this to
%calculate ax
vy=diff(y)./diff(t);
%velocity is change in y vector divided by change in t. The dot indicates
%term by term division, rather than matrix by matrix
vy=[vy(1),vy];
%Diff function makes matrix one column shorter, need to do this to
%calculate ay
ax=diff(vx)./diff(t);
%acceleration is change in velocity in x direction divided by change in t.
%The dot indicates term by term division, rather than matrix by matrix
ay=diff(vy)./diff(t);
%acceleration is change in velocity in y direction divided by change in t.
%The dot indicates term by term division, rather than matrix by matrix
Fx=m*ax;
%Newtons second Law - Force in x direction is mass times acceleration in x
%direction
Fy=m*ay;
%Newtons second Law - Force in y direction is mass times acceleration in y
%direction
Fx=[Fx(1),Fx];
Fy=[Fy(1),Fy];
%Need to do these two steps in order for the plot function to work. Fx/Fy
%and t vectors must be same size in order to make plot
plot(t,Fx,'r',t,Fy,'b')
%This creates a plot of time vs Fx and time vs Fy. the 'r' indicates a red
%line and the 'b' indicates a blue line
end

