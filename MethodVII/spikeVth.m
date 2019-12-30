


clear all;
close all;
FirstDataRow = 7;
spikeData = dlmread('BEY090501_0006_2ndWash-2mAfter2.txt','\t',FirstDataRow,0);



Fs = 5000;                    % Hz :  Sampling Frequency 50kHz
Fc = 1250;                    % Hz : lower pass filter cut off frequency
t_start = 2;                  % inflection search range in ms
t_end   = 10;
dvdt_vth= 0;                 % unit mV /20us



% ======  Finding inflection point by using method VI =========
[Vth,Vth_loc, V,V_denoise,V1,V2,time]= findSpikeDvDtVth(spikeData,dvdt_vth, t_start,t_end,Fs,Fc);
[Vth_Kp, Vth_Kp_loc,Kp]=findSpikeCur(V,V1,V2);


save('./Vth_dvdt.txt', 'Vth','-ascii') % Threshold according to dvdt_vth
save('./Vth_cur.txt', 'Vth_Kp','-ascii') % threshold according to max curvature

browseEventAll(V,V1,Vth_loc); % Phase plot according  to dvdt_vth
browseEventAll(V,V1,Vth_Kp_loc); % Phase plot according  to max curvature
browseEventAll(repmat(time,1,length(Vth_loc)),V,Vth_Kp_loc); % time plot accourding to max curvature 
% browseEvent(V,V1,Vth_loc);
browseEventZoom(repmat(time,1,length(Vth_loc)),V,Vth_Kp_loc,1.5);
% browseEventSingle(repmat(time,1,length(Vth_loc)),V,Kp,35)

