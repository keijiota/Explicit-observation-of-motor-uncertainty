clear all; close all;

% Singed deviation from theoretical optimal setting

load('data_nofb.mat');
load('data_fb.mat');

range = 9:14;
rs_nod2 = mean(aimpoint_no(:,range)') - mean(bdt_optAim_no(:,range)');
rs_fbd2 = mean(aimpoint_fb(:,range)') - mean(bdt_optAim_fb(:,range)');

range = 3:8;
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

setpoint_no = [dot_mean_no, gauss_mean_no, uni_mean_no, dotL_mean_no, gaussL_mean_no,uniL_mean_no];
setpoint_fb = [dot_mean_fb, gauss_mean_fb, uni_mean_fb, dotL_mean_fb, gaussL_mean_fb, uniL_mean_fb];
optsetpoint_no = [dot_optAim_no, gauss_optAim_no, uni_optAim_no, dotL_optAim_no, gaussL_optAim_no, uniL_optAim_no];
optsetpoint_fb = [dot_optAim_fb, gauss_optAim_fb, uni_optAim_fb, dotL_optAim_fb, gaussL_optAim_fb, uniL_optAim_fb];

[N_no c] = size(setpoint_no);
[N_fb c] = size(setpoint_fb);

figure
subplot(1,2,1)
hold on 
% seshade(setpoint_no - optsetpoint_no, 0.4, 'k','k',1:6);
bar(1:6, mean(setpoint_no - optsetpoint_no), 0.7, 'FaceColor', [255/255 255/255 255/255]); 
errorbar(1:6, mean(setpoint_no - optsetpoint_no), std(setpoint_no - optsetpoint_no)/sqrt(N_no), 'ko', 'linewidth', 1.5, 'MarkerSize', 0.1, 'CapSize',6);
plot(1:6, setpoint_no - optsetpoint_no, 'k-'); hold on
ylabel('Difference from optimal setting [cm]'); 
xlim([0.5 6.5]); xticks(1:1:6);
xticklabels({'Dot', 'Gaussian', 'Uniform', 'Dot large', 'Gaussian large', 'Uniform large'});
ylim([-3.5 2.1]); yticks(-3:1:2); 
lineplot(0, 'h', 'k--');
title('No display')  
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 10, 'linewidth', 1);

subplot(1,2,2)
hold on 
% seshade(setpoint_fb - optsetpoint_fb, 0.4, 'k','k',1:6);
bar(1:6, mean(setpoint_fb - optsetpoint_fb), 0.7, 'FaceColor', [125/255 125/255 125/255]); 
errorbar(1:6, mean(setpoint_fb - optsetpoint_fb), std(setpoint_fb - optsetpoint_fb)/sqrt(N_fb), 'ko', 'linewidth', 1.5, 'MarkerSize', 0.1, 'CapSize',6);
plot(1:6, setpoint_fb - optsetpoint_fb, 'k-'); hold on
ylabel('Difference from optimal setting [cm]'); 
xlim([0.5 6.5]); xticks(1:1:6);
xticklabels({'Dot', 'Gaussian', 'Uniform', 'Dot large', 'Gaussian large', 'Uniform large'});
ylim([-3.5 2.1]); yticks(-3:1:2); 
lineplot(0, 'h', 'k--');
title('Display')
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 10, 'linewidth', 1);
pos(3) = 900; pos(4) = 400;
set(gcf, 'Position', pos);
