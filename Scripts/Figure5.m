clear all; close all;

% Difference of subjective optimal aim point from theoretical optimal aim point in Full information task 

load('data_nofb.mat');
load('data_fb.mat');

range = 3:8; % the last 6 of the 8 trials

dot_mean_no = nanmean(dot_endpoint_no(:,range)')' ;
dot_mean_fb = nanmean(dot_endpoint_fb(:,range)')' ;
dotL_mean_no = nanmean(dotL_endpoint_no(:,range)')' ;
dotL_mean_fb = nanmean(dotL_endpoint_fb(:,range)')' ;

gauss_mean_no = nanmean(gauss_endpoint_no(:,range)')' ;
gauss_mean_fb = nanmean(gauss_endpoint_fb(:,range)')' ;
gaussL_mean_no = nanmean(gaussL_endpoint_no(:,range)')' ;
gaussL_mean_fb = nanmean(gaussL_endpoint_fb(:,range)')' ;

uni_mean_no = nanmean(uni_endpoint_no(:,range)')' ;
uni_mean_fb = nanmean(uni_endpoint_fb(:,range)')' ;
uniL_mean_no = nanmean(uniL_endpoint_no(:,range)')' ;
uniL_mean_fb = nanmean(uniL_endpoint_fb(:,range)')' ;


setpoint_no = [dot_mean_no, gauss_mean_no, uni_mean_no, dotL_mean_no, gaussL_mean_no, uniL_mean_no];
setpoint_fb = [dot_mean_fb, gauss_mean_fb, uni_mean_fb, dotL_mean_fb, gaussL_mean_fb, uniL_mean_fb];
optsetpoint_no = [dot_optAim_no, gauss_optAim_no, uni_optAim_no, dotL_optAim_no, gaussL_optAim_no, uniL_optAim_no];
optsetpoint_fb = [dot_optAim_fb, gauss_optAim_fb, uni_optAim_fb, dotL_optAim_fb, gaussL_optAim_fb, uniL_optAim_fb];

setpoint = [setpoint_no; setpoint_fb];
optsetpoint = [optsetpoint_no; optsetpoint_fb];
[N c] = size(setpoint);

absdiff = abs(setpoint - optsetpoint) ;

figure
for con = 1:3
    bar(con, mean(abs(setpoint(:,con) - optsetpoint(:,con))), 0.7, 'FaceColor', [100/255 100/255 100/255]); hold on
end
for con = 4:6
    bar(con, mean(abs(setpoint(:,con) - optsetpoint(:,con))), 0.7, 'FaceColor', [150/255 150/255 150/255]); hold on
end

plot(1:6, abs(setpoint - optsetpoint), 'ko', 'MarkerFaceColor', 'w', 'MarkerSize',5);
for con = 1:6
    errorbar(con, mean(abs(setpoint(:,con) - optsetpoint(:,con))), std(abs(setpoint(:,con) - optsetpoint(:,con)))/sqrt(N), 'ko', 'linewidth', 1.5, 'MarkerSize', 0.1, 'CapSize',6);
end
xlim([0.25 6.75]); ylim([0 3.6]);
xticks(1:1:6);yticks(0:1:4);
xticklabels({'Dots', 'Gaussian','Uniform', 'Dots large',  'Gaussian large',  'Uniform large'});
ylabel('Absolute difference from optiaml setting [cm]');

pos(3) = 550; pos(4) = 350;
set(gcf, 'Position', pos);

