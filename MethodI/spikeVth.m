clear all;
% spikeData = importfile_mat('AEY080527_0003_DA-2m-con.txt',6);
FirstDataRow = 7;
%  spikeData = dlmread('AEY080527_0003_DA-2m-con.txt','\t',FirstDataRow,0);
% spikeData = dlmread('CEY080722_0008_wash-2mAfter2.txt','\t',FirstDataRow,0);
% spikeData = dlmread('AEY080903_0002_wash-2m.txt','\t',FirstDataRow,0);
spikeData = dlmread('BEY090501_0006_wash-2m.txt','\t',FirstDataRow,0);



Fs = 5000;                    % Hz :  Sampling Frequency 50kHz
Fc = 1250;                    % Hz : lower pass filter cut off frequency
t_start = 1;                  % inflection search range in ms
t_end   = 20;



% ======  Finding inflection point by using method VI =========
[Vth,Vth_loc, V,V_denoise,V1,V2,loc1,loc2,gt,time, ab_num, ab_pos]= findSpikeVth(spikeData,t_start,t_end,Fs,Fc);
save('./Vth.txt', 'Vth','-ascii')
ab_pos

figure(1)
CheckSpike(4, Vth_loc, V,V_denoise,V1,V2,loc1,loc2,gt,time)

figure(2)
% plot(Vth)
scatter(1:length(Vth),Vth,'+')
xlabel('#Spike')
ylabel('Threshold (mV)')
title(['mean : ' num2str(mean(Vth)) ' STD: ' num2str(std(Vth)) ])
grid on;

figure(3)
CheckSpikeArray(1:20, Vth_loc, V,V_denoise,V1,V2,loc1,loc2,gt,time)