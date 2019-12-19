% This program aims to process a sin windows function
% N is the number of the sampling points
N = 1000;
Fs = 1;
F = 0.2;
% F is the frequency of the original signal
Tg = 1/ Fs;
% sample frequency @ 500hz, Tg means the time gap between each sample point
resolution = 4096;
% set te resolution in the time domain
t = linspace(0,N*Tg,N+1);
ti = linspace(0,N*Tg,N*Tg*1000);
% calculate the time at each point, t is time of sampling, ti is built to
% show the orginal signal
L = length(t);
S = floor(sin(2*pi*F*t)/2+1)*2-1;
si = floor(sin(2*pi*F*ti)/2+1)*2-1;
% construct the original function
figure(1);
subplot(2,2,1)
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
subplot(2,2,2)
plot(f,yy)
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
set(gca,'XLim',[0 Fs/2]);
set(gca,'YLim',[0 1]);

n = 1000;
% The number of the sampling points in the time domain
bt = 5;
% The original singnal generating period bt
bw = 1/bt;
% The original singnal generating frequency fs
stream = randombitstream(n,bt);
% The sampling frequency remains 1 Hz
t = 1:1:n*bt;
% calculate the time at each point 
L = length(t);
S = stream;
% construct the original function
hold
figure(1);
subplot(2,2,3)
plot(t,S)
hold
title('Original Signal')
xlabel('t (seconds)')
ylabel('X(t)')
set(gca,'XLim',[0 n*bt]);
set(gca,'YLim',[-1.2 2.2]);
% print the original image of the singnal
Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
f = 1*(0:(L/2))/L;
 
 
Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
subplot(2,2,4)
plot(f,P1)
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
set(gca,'XLim',[0 0.5]);

