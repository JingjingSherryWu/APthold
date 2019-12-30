function  CheckSpike( nth, Vth_loc, V, V_denoise,V1,V2,loc1,loc2,gt, time )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here


V1_orig = [0;diff(V(:,nth))];

% =====  Scaling and offset for easy viewing ========
yscale = 20;
yoffset = -65;
% ==== Orignal signal =====
% figure(1)
% nth = 2;            % change this number to plot particular spikedata
plot(time,V(:,nth))

grid on;
hold on;
% ==== denoise sigal =====
plot(time,V_denoise(:,nth),'o')
% plot(time(Vth_loc(nth)),V_denoise(Vth_loc(nth),nth),'rx')
vline(time(Vth_loc(nth)), 'r--', ['Inflection Point = ' num2str(V(Vth_loc(nth),nth)) ' mV']);

plot(time,V1_orig.*yscale+yoffset,'g')
plot(time,V1(:,nth).*yscale+yoffset,'r')
% plot(time(3:end),V2_denoise(:,nth).*yscale+yoffset,'black')
plot(time(loc1(nth):loc2(nth)),gt(loc1(nth):loc2(nth),nth).*yscale+yoffset,'black')


legend('Orignal', 'Denoise', 'dV/dt orignal', 'dV/dt denoise');
hold off;

xlabel('time(ms)')
ylabel('Voltage (mV)')
title(['Spike number : ' num2str(nth) ])

end

