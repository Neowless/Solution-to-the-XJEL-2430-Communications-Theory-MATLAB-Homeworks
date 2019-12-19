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
figure(1);
subplot(2,1,1)
plot(t,S)
hold
title('Original Signal')
xlabel('t (seconds)')
ylabel('X(t)')
set(gca,'XLim',[0 n*bt]);
set(gca,'YLim',[-1.2 1.2]);
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
subplot(2,1,2)
plot(f,P1)
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
set(gca,'XLim',[0 0.5]);
