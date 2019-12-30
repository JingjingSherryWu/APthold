function [ Vth,Vth_loc,loc1,loc2,abnormal, gt] = method_VIb( V,V1,V2)
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here
%     V1 = [0 ; diff(V)];
%     V2 = [0 ; diff(V1)];

    abnormal = 0;
    gt=V2./V1;
    
    [ loc2, abn_a,peaks_val_2,loc_peaks_2 ] = peaks_loc( V1,'descend',0.1 );
    [ loc1, abn_b,peaks_val_1,loc_peaks_1 ] = peaks_loc( -V1(1:loc2),'ascend',0.1 );
%     [ loc3, abn_c,peaks_val_3,loc_peaks_3a ] = peaks_loc( gt(loc1:loc2),'descend',0.1 );
%     
    if (abn_a || abn_b)
        abnormal =1;
    end
%     [~,loc2]=max(V1);
%     [ loc2, abnormal ] = two_peaks_loc( V1,0.1 );
%     [~,loc1] = method_VI_range(V,V1,loc2);

    gt_search = gt(loc1:loc2);
    [~,loc3]=max(gt_search);
    Vth_loc = loc1 + loc3 -1;
    Vth = V(Vth_loc);
    

end

