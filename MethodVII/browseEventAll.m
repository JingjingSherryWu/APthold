function browseEventAll( xArray, yArray,markerArray )

    figure;
    set(gcf, 'Position', [1024, 500, 1000, 800])
    grid on;
    j = 1;
    k = 1;
    [~,nData] = size(yArray);
    
    plot(xArray,  yArray );

    hold on;
    for i = 1:nData
        plot(xArray(markerArray(i),i),yArray(markerArray(i),i), 'o', 'MarkerEdgeColor','k','MarkerFaceColor','r')
        
        grid on;
       
    end
    title(['All Spikes']);
    xlabel('Voltage(mV)')
    ylabel('dV/dt')
    ylim([min(min(yArray)) max(max(yArray)) ]);
    xlim([min(min(xArray)) max(max(xArray)) ]);  
    hold off;

end

