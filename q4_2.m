fs = 100;
Tg = 1/ fs;
L = 500;
n = 0:L-1;
t = Tg*n;
y = square(2*pi*t);
rolloff = 0.3;
span = 0.4;
sps = 50;
b = rcosdesign(rolloff,span,sps,'sqrt');
x = upfirdn(y,b);
stairs(t,y)
hold on
plot(t,x(1:500))