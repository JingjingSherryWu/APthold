function [ Vth_Kp, Vth_Kp_loc, Kp ] = findSpikeCur(V, V1,V2 )


    Kp=Curvature(V1,V2);
    [~, Vth_Kp_loc] = max(Kp);
    
    [~,nData] = size(Kp);
    
    Vth_Kp = zeros(1,nData);
    for i = 1:nData
       Vth_Kp(i) = V(Vth_Kp_loc(i),i);
        
    end
    Vth_Kp = Vth_Kp';
end

