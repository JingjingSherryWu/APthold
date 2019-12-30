function browseEventZoom( xArray, yArray,markerArray, zoomTime )

    figure;
    set(gcf, 'Position', [100, 100, 1500, 1000])
    grid on;
    j = 1;
    k = 1;
    [~,nData] = size(yArray);
    
    ymin = min(min(yArray));
    ymax = max(max(yArray));
    xmin = min(min(xArray));
    xmax = max(max(xArray));
    if (zoomTime >= 1)
        
        xmin = xArray(min(markerArray))*zoomTime;
        xmax = xArray(max(markerArray))*zoomTime;
    end
    for i = 1:nData
        subplot(5,5,j)
        plot(xArray(:,i),  yArray(:,i));
        title(['peak Number #' num2str(i)]);
    
        ylim([ymin ymax ]);
        xlim([xmin xmax ]);  
        hold on;
        plot(xArray(markerArray(i),i),yArray(markerArray(i),i), 'ro')
        hold off;
        grid on;
        j = j +1;
        if ( i >= 25*k)
            choice = menu('Browse all event?','Next', 'Exit');
            switch choice
                case 1
                                             
                case 2
                    break;
    %                 waitforbuttonpress
            end 

           j = 1;
           k = k + 1;
        end


    end


end

