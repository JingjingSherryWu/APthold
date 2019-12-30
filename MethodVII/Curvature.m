function [ Kp ] = Curvature( V1,V2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    Kp = V2.*(1+V1.^2).^(-3/2);
end

