function [ Vth, dvdt_loc, V, V_denoise,V1,V2,time ] = findSpikeDvDtVth( spikeData,dvdt_vth,tstart,tend,Fs,Fc )


    % === Truncate time======
    time = spikeData(:,1);
    search_range =find( (time>tstart & time<tend));
    time = time(search_range);
    % =========================
    
    [~, nData] = size(spikeData);
    
    Vth = zeros(1,nData-1);
    dvdt_loc = zeros(1,nData-1);

    dt = spikeData(2,1) - spikeData(1,1); % difference in time step in ms 
    
    V = zeros(length(time),nData-1);
    V_denoise = zeros(length(time),nData-1);
    V1  = zeros(length(time),nData-1);
    V2  = zeros(length(time),nData-1);
    gt  = zeros(length(time),nData-1);
    
    for i=2:nData
%       i
        V(:,i-1) = spikeData(search_range,i);
        V_denoise(:,i-1) = denoise(V(:,i-1),Fs,Fc);
        V1(:,i-1) = [0 ; diff(V_denoise(:,i-1))];   %   dV/dt
        V2(:,i-1) = [0 ; diff(V1(:,i-1))];          %   dV2/d2t

%         [~,dvdt_loc(i-1),loc1(i-1),loc2(i-1), abnormal(i-1), gt(:,i-1)] = method_VIb(V_denoise(:,i-1),V1(:,i-1),V2(:,i-1));
        dvdt_loc(i-1)= find(V1(:,i-1)>dvdt_vth, 1 );
%         Vth(i) = V_denoise(dvdt_loc(i),i);
    
        Vth(i-1) = V(dvdt_loc(i-1),i-1);
    end

     Vth = Vth';
     dvdt_loc = dvdt_loc';
    
end

