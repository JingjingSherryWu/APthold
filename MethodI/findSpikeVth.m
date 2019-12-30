function [ Vth, Vth_loc, V, V_denoise,V1,V2,loc1,loc2,gt, time,  abnormal_num, abnormal_position ] = findSpikeVth( spikeData,tstart,tend,Fs,Fc )


    % === Truncate time======
    time = spikeData(:,1);
    search_range =find( (time>tstart & time<tend));
    time = time(search_range);
    % =========================
    
    [~, nData] = size(spikeData);
    
    Vth = zeros(1,nData-1);
    Vth_loc = zeros(1,nData-1);
    loc1 = zeros(1,nData-1);
    loc2 = zeros(1,nData-1);
    abnormal = zeros(1,nData-1);
    
    
    V = zeros(length(time),nData-1);
    V_denoise = zeros(length(time),nData-1);
    V1  = zeros(length(time),nData-1);
    V2  = zeros(length(time),nData-1);
    gt  = zeros(length(time),nData-1);
    
    for i=2:nData
%       i
        V(:,i-1) = spikeData(search_range,i);
        V_denoise(:,i-1) = denoise(V(:,i-1),Fs,Fc);
        V1(:,i-1) = [0 ; diff(V_denoise(:,i-1))];
        V2(:,i-1) = [0 ; diff(V1(:,i-1))];

%         [~,Vth_loc(i-1),loc1(i-1),loc2(i-1), abnormal(i-1), gt(:,i-1)] = method_VIa(V_denoise(:,i-1),V1(:,i-1),V2(:,i-1));
        
        [~,Vth_loc(i-1),loc1(i-1),loc2(i-1), abnormal(i-1), gt(:,i-1)] = method_VIb(V_denoise(:,i-1),V1(:,i-1),V2(:,i-1));
        
        Vth(i-1) = V(Vth_loc(i-1),i-1);
    end

     Vth = Vth';
     Vth_loc = Vth_loc';
     abnormal_num = sum(abnormal);
     abnormal_position = find(abnormal==1);
end

