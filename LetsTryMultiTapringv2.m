close all
clc
clear all

%% Load Data
%Load an EDF file
[hdr, record] = edfread('example_EDF.edf');


%Choose options from EDF file
size = length(record);
%Fs = hdr.frequency(channels);
data = record;

%choose options manually
size = 200000;
Fs = 256;
data = record(4, 1:size);

% % Plot the raw data
% t = seconds(1:length(data))/Fs(1);



%% Prosses Data

%Generate Tapers
seq_length = length(data);
time_halfbandwidth = 2.5;%(28398/256)/2;
num_tapers = 5;%floor(2*(time_halfbandwidth)-1);
[dps_seq,lambda] = dpss(seq_length,time_halfbandwidth,2*2.5-1);

%Generate DPSS tapers (STEP 1)
DPSS_tapers = dpss(seq_length, time_halfbandwidth, num_tapers) * 2000;% * sqrt(Fs);
plot(DPSS_tapers)
title('Slepian Sequences')
axis([0 seq_length -5.0 5.0])
legend('1st','2nd','3rd','4th')

%Use the tapers on the data
mean_tapered_data = zeros([1, size]);
for i = 1:num_tapers
     tapered_data = data(1, :).*DPSS_tapers(:, i).';
     mean_tapered_data = mean_tapered_data +tapered_data;
end
mean_tapered_data = mean_tapered_data/num_tapers;
figure;
pspectrum(mean_tapered_data, 256, 'spectrogram', 'MinThreshold', -50, 'FrequencyLimits',[0,20]);
colorbar off
colormap('jet')
caxis([-30 0])
title('Multitaper Results')

figure;
pspectrum(data(1, :), 256, 'spectrogram', 'MinThreshold', -50, 'FrequencyLimits',[0,20]);
colorbar off
colormap('jet')
caxis([-30 0])
%caxis([-10 20])
title('Original Data')
