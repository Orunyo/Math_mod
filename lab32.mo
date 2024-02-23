model lab32 "Battle beetwen forces"
parameter Integer x0 = 31000;
parameter Integer y0 = 12000;
parameter Real a = 0.299;
parameter Real b = 0.788;
parameter Real c = 0.311;
parameter Real h = 0.466;
Real P;
Real Q;
Real x(start=x0);
Real y(start=y0);
equation
P = abs(cos(0.5*time));
Q = abs(sin(4*time));
der(x) = - a * x - b * y + P;
der(y) = - c * x * y - h * y + Q;
end lab32;
