clear all; close all;

load('data_nofb.mat');
load('data_fb.mat');

t = 0.4;

% Time series of SD of endpoint
figure
subplot(1,2,1)
plot(1:7, sigma_no(:,1:7), 'k-'); hold on
seshade(sigma_no(:,1:7), t, 'k','k',1:7);
plot(8:14, sigma_no(:,8:14), 'k-');
seshade(sigma_no(:,8:14), t, 'k','k',8:14);
ylabel('SD of endpoint [cm]'); xlabel('block');
xlim([0 15]); ylim([0.5 2]); xticks([1 7 8 14]);
title('No dislay')
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 10, 'linewidth', 1);

subplot(1,2,2)
plot(1:7, sigma_fb(:,1:7), 'k-'); hold on
seshade(sigma_fb(:,1:7), t, 'k','k',1:7);
plot(8:14, sigma_fb(:,8:14), 'k-');
seshade(sigma_fb(:,8:14), t, 'k','k',8:14);
ylabel('SD of endpoint [cm]'); xlabel('block');
xlim([0 15]); ylim([0.5 2]); xticks([1 7 8 14]);
title('Display')
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 10, 'linewidth', 1);

pos(3) = 1000; pos(4) = 350;
set(gcf, 'Position', pos);


% Time series of risk-sensitivity (aim point - optimal aim point)
figure
subplot(1,2,1)
plot(1:7, aimpoint_no(:,1:7) - bdt_optAim_no(:,1:7), 'k-'); hold on
seshade(aimpoint_no(:,1:7) - bdt_optAim_no(:,1:7), 0.4, 'k','k',1:7);
plot(8:14, aimpoint_no(:,8:14) - bdt_optAim_no(:,8:14), 'k-'); hold on
seshade(aimpoint_no(:,8:14) - bdt_optAim_no(:,8:14), 0.4, 'k','k',8:14);
lineplot(0, 'h', 'k--');
ylabel('Risk-sensitivity [cm]'); xlabel('block');
xlim([0 15]); ylim([-2 2]); yticks(-2:1:2); xticks([1 7 8 14]);
title('No dislay')
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 10, 'linewidth', 1);

subplot(1,2,2)
plot(1:7, aimpoint_fb(:,1:7) - bdt_optAim_fb(:,1:7), 'k-'); hold on
seshade(aimpoint_fb(:,1:7) - bdt_optAim_fb(:,1:7), 0.4, 'k','k',1:7);
plot(8:14, aimpoint_fb(:,8:14) - bdt_optAim_fb(:,8:14), 'k-'); hold on
seshade(aimpoint_fb(:,8:14) - bdt_optAim_fb(:,8:14), 0.4, 'k','k',8:14);
lineplot(0, 'h', 'k--');
ylabel('Risk-sensitivity [cm]'); xlabel('block');
xlim([0 15]); ylim([-2 2]); yticks(-2:1:2); xticks([1 7 8 14]);
title('Display')
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 10, 'linewidth', 1);

pos(3) = 1000; pos(4) = 350;
set(gcf, 'Position', pos);





