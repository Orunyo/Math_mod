model lab3 "Battle beetwen forces"
parameter Integer x0 = 31000;
parameter Integer y0 = 12000;
parameter Real a = 0.34;
parameter Real b = 0.744;
parameter Real c = 0.51;
parameter Real h = 0.52;
Real P;
Real Q;
Real x(start=x0);
Real y(start=y0);
equation
P = cos(time+10);
Q = sin(time+5);
der(x) = - a * x - b * y + P;
der(y) = - c * x - h * y + Q;
end lab3;
