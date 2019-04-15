%% DSP LAB EXPERIMENT NO.9
%%
% Name: RITWIKA RAI
%%
% PRN.NO: 16070123082
%%
% Class: IIIrd Year, B1, 2016 - 2020

%% Question:
%%
% Write a MATLAB code to design IIR Butterworth low pass digital filter for following 
%%
% specifications using bilinear transformation technique. Assume T=1 sec. Plot the frequency 
%%
% response of the designed IIR filter.
%%
clc;
clear all;
close all;
Ap=0.8;                  %Passband Attenuation
As=0.2;                  %Stopband Attenuation
Wp=0.2*pi;               %Passband Edge
Ws=0.6*pi;               %Stopband Edge
T=1;
Op=(2/T)*tan(Wp/2)
Os=(2/T)*tan(Ws/2)
N=log((((1/As^2)-1)/((1/Ap^2)-1))^0.5)/log(Os/Op); 
N=ceil(N)               %Round toward positive integer
Oc=Op/(((1/Ap^2)-1)^(0.5/N))
[Num,Den]=butter(N,Oc,'s');
tf(Num,Den);
[N1,D1]=bilinear(Num,Den,1);
tf(N1,D1,1);
[H,W]=freqz(N1,D1);
plot(W/pi, abs(H));
xlabel('w')
ylabel('|H(w)|')
title('IIR BUTTERWORK LPF USING BLT')
%%
%% CONCLUSION:
% 1:The steps to design IIR filter for given specifications using bilinear transformation
% technique are:
% A. Determine the CT filter class
%%
% B.Transform the DT filter specifications to CT (sampling period Td is
% arbitrary) including prewarping the band edge frequencies.
%%
% C.Design CT filter based on the magnitude squared response |Hc(j?)|:
% Determine filter order
% Determine cutoff frequency
%%
% D.Determine Hc(s) corresponding to a stable causal filter
%%
% E.Convert to DT filter H(z) via bilinear transform such that
% H(z) = Hc[(2/Td)(1-z^-1)/(1+z^-1)]
%%
% 2: [b,a] = butter(n,Wn)
%%
% It returns the transfer function coefficients of an nth-order lowpass digital Butterworth filter with normalized cutoff frequency Wn.
%%
% 3:[H,W]=freqz(N1,D1)
%%
% It gives the cut off frequency.
%%
% 4:The cut-off frequency of the designed IIR filter satisfies pass band.




