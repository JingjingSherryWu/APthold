function browseEventSingle( xArray, yArray,y2Array,nth )


    figure;
    set(gcf, 'Position', [1024, 500, 1000, 800])
    grid on;
    
    [~,nData] = size(yArray);
    
    scale = max(abs(yArray(:,nth)))/max(abs(y2Array(:,nth)));

    y2Array(:,nth) = y2Array(:,nth)*scale;
    y2Array(:,nth) = y2Array(:,nth) + min(yArray(:,nth));

    
    plot(xArray(:,nth),  yArray(:,nth));
    hold on;
     plot(xArray(:,nth),  y2Array(:,nth), 'r');
     
     grid on;

%     hold on;
%     for i = 1:nData
%         plot(xArray(markerArray(i),i),yArray(markerArray(i),i), 'o', 'MarkerEdgeColor','k','MarkerFaceColor','r')
%         
%         grid on;
%        
%     end
    title(['Spikes # : ' num2str(nth)]);
    ylabel('Voltage(mV)')
    xlabel('time (ms)')
    legend(['Spike'],['Curvature'])
%     ylim([min(min(yArray)) max(max(yArray)) ]);
%     xlim([min(min(xArray)) max(max(xArray)) ]);  
    hold off;

end


