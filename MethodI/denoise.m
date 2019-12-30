function [ V_denoise ] = denoise( V,Fs,Fc )
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here
    % ==== Besell filter =========
    [z,p,k] = besself(8,Fc*2*pi);          % Bessel analog filter design
    [zd,pd,kd] = bilinear(z,p,k,Fs);    % Analog to digital mapping
    sos = zp2sos(zd,pd,kd);             % Convert to SOS form
    [b, a] = zp2tf(zd,pd,kd);             % Convert to SOS form
    % fvtool(sos)                         % Visualize the digital filter
    % sisotool(sos)
    % ==============================
    V_denoise = filtfilt(b,a,V);

end

