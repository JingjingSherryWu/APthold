function [ loc_max_peak,abnormal, peaks_values,loc_peaks ] = peaks_loc( fx,SortOrder, tol )

    abnormal=0;
%     [peaks_values, loc_peaks]=findpeaks(fx,'SortStr','descend','NPEAKS', 2);


     if (numel(fx) < 3)
         warning('peak search length too short');
         abnormal = 1;
         loc_max_peak = 1;
         peaks_values = 0;
         loc_peaks = 1;
     else 
         
        [peaks_values, loc_peaks]=findpeaks(fx,'SortStr',SortOrder,'NPEAKS', 5);

        if (isempty(loc_peaks))
            warning('peak cannot be found');
            abnormal=1;
            loc_max_peak = 10;

        elseif (numel(loc_peaks)<2)
%             warning('Only ONE peak found');
            abnormal=1;
            loc_max_peak = loc_peaks(1);
        else
            peaks_distance = loc_peaks(1) - loc_peaks(2);
            peaks_diff = abs(peaks_values(1) - peaks_values(2));

            if ((peaks_distance <=0)) % make sure loc2 is always larger than loc1

%                 loc_max_peak = loc_peaks(2);
%                 warning('Unexpected peaks locations');
                loc_max_peak = loc_peaks(1);
                if (peaks_diff > tol)
                    %normally , loc1 peaks is always larger thans loc2 peak
                    %values
                    abnormal=1;
                end
            else 
                loc_max_peak = loc_peaks(1);
            end
        end
        
     end
        
    


end

