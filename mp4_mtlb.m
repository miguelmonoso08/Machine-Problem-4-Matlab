
h = input('Initial height: ');
v = input('Initial velocity: ');
ad = input('Angle in degrees: ');
ax = input('x-component acceleration: ');
ay = input('y-component acceleration (in negative): ');

if ay >= 0
    disp("Invalid vertical acceleration value.")
    return
end

vx = v*cosd(ad);
vy = v*sind(ad);

tm = max(roots([(ay/2),vy,h]));
d = 0:0.01:tm+1;    
x = zeros(1,length(d)+1);
y = zeros(1,length(d)+1);

t=0.01;
x(1)=0;
y(1)=h;

for i = 1:length(d)-1
    xt = ((ax*(t^2))/2) + (vx*t);
    yt = ((ay*(t^2))/2) + (vy*t) + h;
    x(i+1) = xt;
    y(i+1) = yt;
    t=t+0.01;
end

x(length(d)+1)=(ax/2)*tm^2 + vx*0.01;
y(length(d)+1)=0;

plot(x,y)
grid on
xlim([0 max(x)+1])
ylim([0 max(y)+1])
title("Projectile Motion")
xlabel("Distance")
ylabel("Height")
