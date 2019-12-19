% This function is to form a random bit stream(¡À1)
% The first value should be the number of original signal bits
% The second value should be the value of the repeating times
% This is not a 100% random bit stream, if you want it to be totally random
% , please delete rng(100);
function [n] = randombitstream(l,bw)
rng(100);
o = (round(rand(l)));
o = o(1,:);
o = 2.*o-1;
for i = 1:1:length(o)
    for x =1:1:bw
        n(i*bw-bw+x) = o(i);
    end
end
end