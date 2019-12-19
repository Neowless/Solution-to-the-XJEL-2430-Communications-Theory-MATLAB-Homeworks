% This program aims to process a sin windows function
% N is the number of the sampling points
for r = 1:1:200
N = 5000;
Fs = 500;
F = 50;
% F is the frequency of the original signal
Tg = 1/ Fs;
% sample frequency @ 500hz, Tg means the time gap between each sample point
resolution = r*50;
% set te resolution in the time domain
t = linspace(0,N*Tg,N+1);
ti = linspace(0,N*Tg,N*Tg*1000);
% calculate the time at each point, t is time of sampling, ti is built to
% show the orginal signal
L = length(t);
S = 0.7*sin(2*pi*50*t);
si = 0.7*sin(2*pi*50*ti);
% construct the original function
figure(1);
subplot(2,1,1)
plot(t,S)
hold
plot(ti,si)
title('Original Signal')
xlabel('t (seconds)')
ylabel('X(t)')
set(gca,'XLim',[0 N/Fs]);
set(gca,'YLim',[-1.2 1.2]);
% print the original image of the singnal
Y = fft(S,resolution);
P2 = abs(Y);
i=1:resolution/2; 
f=(i-1)*Fs/resolution;
yy=zeros(floor(resolution/2),1);
yy(i)=P2(i);
yy=yy/(L/2);
yy(1)=yy(1)/2;
subplot(2,1,2)
plot(f,yy)
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
set(gca,'XLim',[0 Fs/2]);
set(gca,'YLim',[0 1]);
str1 = 'sinc_fft';
str2 = num2str(N);
str3 = '.png'
name = [str1,str2,str3]
end
