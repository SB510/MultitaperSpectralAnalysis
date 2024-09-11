close all
clear all
clc
%% Filter types (Most of these have FIR and IIR versions you probably want FIR
    %High pass & Low pass: Lets high or low frequencys through 
    %Bandpass: highlights (lets through) one(A section of) frequency(s)
    %BandStop: stops one (A section of) frequency(s)
    %Hilbert transformer: middle is highligted (let through)
    %Arbitrary-Mangitude: like high pass and low pass but for many peaks

%% If I want to do multi taper 
%     %this generates tapers. seq_legth is how long (data set size?),
%     %time_halfbandwidth is what part of the data they highlight
%     %num_seq is how many
%     seq_length = 512;
%     time_halfbandwidth = 2.5;
%     num_seq = 2*(time_halfbandwidth)-1;
%     [dps_seq,lambda] = dpss(seq_length,time_halfbandwidth,num_seq);
% 
%     plot(dps_seq)
%     title('Slepian Sequences, N = 512, NW = 2.5')
%     axis([0 512 -0.15 0.15])
%     legend('1st','2nd','3rd','4th')
%     
%% Library



 %mbFilt = designfilt('arbmagfir','FilterOrder',60, ...
 %         'Frequencies',0:50:500,'Amplitudes',[0 0 0 0.5 0.7 0 0 1 1 0 0], ...
 %         'SampleRate',1000);
 %fvtool(mbFilt)
%
%hFilt = designfilt('hilbertfir','FilterOrder',18,'TransitionWidth',0.25); %It functions like a sin wave, A2 is frequency A4 is how long till it gets going, also amplitude
%fvtool(hFilt,'MagnitudeDisplay','magnitude')
% 
%bsFilt = designfilt('bandstopiir','FilterOrder',50, ... %a section is cut out A3 changes by how much how fast, A8 is dementions?, A4 and A6 are when it cuts out
%         'HalfPowerFrequency1',500,'HalfPowerFrequency2',560, ...
%         'SampleRate',1500);
%
%fvtool(bsFilt)
% 
% 
% bsFilt = designfilt('bandstopfir','FilterOrder',20, ...
%          'CutoffFrequency1',500,'CutoffFrequency2',560, ...
%          'SampleRate',1500);
% fvtool(bsFilt)
% 
% bpFilt = designfilt('bandpassiir','FilterOrder',30, ...
%          'HalfPowerFrequency1',8,'HalfPowerFrequency2',12, ...
%          'SampleRate',120);
%fvtool(bpFilt)
%

%bpFilt = designfilt('bandpassfir','FilterOrder',1000, ...
%         'CutoffFrequency1',8,'CutoffFrequency2',12, ...
%         'SampleRate',60);
%fvtool(bpFilt)
 

d = designfilt('bandpassiir', 'StopbandFrequency1', 7, ...
               'PassbandFrequency1', 8, 'PassbandFrequency2', 12, ...
               'StopbandFrequency2', 13, 'StopbandAttenuation1', 1, ...
               'PassbandRipple', 0.00001, 'StopbandAttenuation2', 1, ...
               'SampleRate', 40);
fvtool(d)
 % 
% hpFilt = designfilt('highpassiir','FilterOrder',8, ...
%          'PassbandFrequency',75e3,'PassbandRipple',0.2, ...
%          'SampleRate',200e3);
% fvtool(hpFilt)
% 
% lpFilt = designfilt('lowpassfir','PassbandFrequency',0.25, ...
%          'StopbandFrequency',0.35,'PassbandRipple',0.5, ...
%          'StopbandAttenuation',65,'DesignMethod','kaiserwin');
% fvtool(lpFilt)
% 
% hpFilt = designfilt('highpassfir','StopbandFrequency',0.25, ... %same asfillter above but high pass
%          'PassbandFrequency',0.35,'PassbandRipple',0.5, ...
%          'StopbandAttenuation',65,'DesignMethod','kaiserwin');
% fvtool(hpFilt)
