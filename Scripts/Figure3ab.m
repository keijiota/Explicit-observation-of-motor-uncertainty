clear all; close all;

% correlation between the risk-sensitivity on day 1 and that on day 2

load('data_nofb.mat');
load('data_fb.mat');

range1 = 2:7; range2 = 9:14;  cs = 5; ms = 5.3;
srange = length(range1) ;
rs_no_d1 =  aimpoint_no(:,range1) - bdt_optAim_no(:,range1);
rs_no_d2 =  aimpoint_no(:,range2) - bdt_optAim_no(:,range2);
rs_fb_d1 =  aimpoint_fb(:,range1) - bdt_optAim_fb(:,range1);
rs_fb_d2 =  aimpoint_fb(:,range2) - bdt_optAim_fb(:,range2);
mrs_no_d1 = mean(rs_no_d1')';
mrs_no_d2 = mean(rs_no_d2')';
mrs_fb_d1 = mean(rs_fb_d1')';
mrs_fb_d2 = mean(rs_fb_d2')';


[N T] = size(aimpoint_no); [Nf Tf] = size(aimpoint_fb);

figure
subplot(1,2,1)
errorbar(mean(rs_no_d1'), mean(rs_no_d2'), std((rs_no_d2'))/sqrt(srange), 'ko', 'linewidth', 1, 'MarkerSize', 0.1, 'CapSize',cs); hold on
errorbar(mean(rs_no_d1'), mean(rs_no_d2'), std((rs_no_d1'))/sqrt(srange), 'horizontal','ko', 'linewidth', 1, 'MarkerSize', 0.1, 'CapSize',cs);
plot(mean(rs_no_d1'), mean(rs_no_d2'), 'ok', 'MarkerFaceColor', 'k', 'MarkerSize',ms);
plot(-2:2,-2:2,'k--');
lineplot(0, 'h','k-'); lineplot(0, 'v','k-');
axis('square');
ylim([-1.2 1.2]);  xlim([-1.2 1.2]); xticks(-1:0.5:1); yticks(-1:0.5:1);
xlabel('Risk-sensitivity on day 1 [cm]'); ylabel('Risk-sensitivity on day 2 [cm]');
title('No display')
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 10, 'linewidth', 1);

[a b] = polyfit(mean(rs_no_d1'), mean(rs_no_d2'),1);
y = polyval(a, min(mean(rs_no_d1')):0.01:max(mean(rs_no_d1')));
plot(min(mean(rs_no_d1')):0.01:max(mean(rs_no_d1')), y, 'k-');
[r1 p1] = corr(mean(rs_no_d1')', mean(rs_no_d2')');


subplot(1,2,2)
errorbar(mean(rs_fb_d1'), mean(rs_fb_d2'), std((rs_fb_d2'))/sqrt(srange), 'ko', 'linewidth', 1, 'MarkerSize', 0.1, 'CapSize',cs); hold on
errorbar(mean(rs_fb_d1'), mean(rs_fb_d2'), std((rs_fb_d1'))/sqrt(srange), 'horizontal','ko', 'linewidth', 1, 'MarkerSize', 0.1, 'CapSize',cs);
plot(mean(rs_fb_d1'), mean(rs_fb_d2'), 'ok', 'MarkerFaceColor', 'k', 'MarkerSize',ms);
plot(-2:2,-2:2,'k--');
lineplot(0, 'h','k-'); lineplot(0, 'v','k-');
axis('square');
ylim([-1.2 1.2]);  xlim([-1.2 1.2]); xticks(-1:0.5:1); yticks(-1:0.5:1);
xlabel('Risk-sensitivity on day 1 [cm]'); ylabel('Risk-sensitivity on day 2 [cm]');
title('Display')
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 10, 'linewidth', 1);

[aa bb] = polyfit(mean(rs_fb_d1'), mean(rs_fb_d2'),1);
y = polyval(aa, min(mean(rs_fb_d1')):0.01:max(mean(rs_fb_d1')));
plot(min(mean(rs_fb_d1')):0.01:max(mean(rs_fb_d1')), y, 'k-');
[r2 p2] = corr(mean(rs_fb_d1')', mean(rs_fb_d2')');


pos(3) = 600; pos(4) = 600;
set(gcf, 'Position', pos);
