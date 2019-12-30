function  CheckSpikeArray( nth, Vth_loc, V, V_denoise,V1,V2,loc1,loc2,gt, time )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here




    % =====  Scaling and offset for easy viewing ========
    yscale = 20;
    yoffset = -65;
    % ==== Orignal signal =====
    % figure(1)
    % nth = 2;            % change this number to plot particular spikedata
    
    for i=nth;
        V1_orig = [0;diff(V(:,i))];
        plot(time,V(:,i))

        grid on;
        hold on;
        % ==== denoise sigal =====
        plot(time,V_denoise(:,i),'b+')
        % plot(time(Vth_loc(nth)),V_denoise(Vth_loc(nth),nth),'rx')
        vline(time(Vth_loc(i)), 'r--');

%         plot(time,V1_orig.*yscale+yoffset,'g')
%         plot(time,V1(:,i).*yscale+yoffset,'r')
        % plot(time(3:end),V2_denoise(:,nth).*yscale+yoffset,'black')
%         plot(time(loc1(i):loc2(i)),gt(loc1(i):loc2(i),i).*yscale+yoffset,'black')
    end

%     legend('Orignal', 'Denoise', 'dV/dt orignal', 'dV/dt denoise');
    hold off;

    xlabel('time(ms)')
    ylabel('Voltage (mV)')
    title(['Spike number : ' 'From :' num2str(min(nth)) ' to '  num2str(max(nth)) ])

end

