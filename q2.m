close all
clear all
x = -2.5:0.01:2.5;
% set the range of x between -2.5 and 2.5
y = linspace(0.5,0.5,501);
% set the gap between each x equals 0.01, and initialize the y = 0.5 for 
% a0 = 0.5
o = round((cos(x*pi)+1)/2);
% biuld the original square wave function 
N = input('Please input the number of N.')
for i = 1:N
    % assuming that it iterates  120 times and save the image of each
    % iteration function
    a = 2*sin(i*pi/2)/i/pi;
    y = y + a*cos(i*pi*x);
    % b =  0 can be proved by calculation
end	
figure(1)
plot(x,y,'-r')
hold
plot(x,o,'-b')
hold
% set the colour of each lines
set(gca,'XLim',[-2.5 2.5]);
set(gca,'YLim',[0 2]);
% set the range of the image
 