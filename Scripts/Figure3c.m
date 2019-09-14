clear all; close all;

% absolute risk-sensitivity

load('data_nofb.mat');
load('data_fb.mat');

a = [1 4 7 10 13 16 19 22];
b = [2 5 8 11 14 17 20 23];

meanaimpoint_nod1 = mean(aimpoint_no(:,2:7)');
meanoptAim_nod1 = mean(bdt_optAim_no(:,2:7)');
meanaimpoint_fbd1 = mean(aimpoint_fb(:,2:7)');
meanoptAim_fbd1 = mean(bdt_optAim_fb(:,2:7)');

absdiff_nod1 = abs(meanaimpoint_nod1 - meanoptAim_nod1)' ;
absdiff_fbd1 = abs(meanaimpoint_fbd1 - meanoptAim_fbd1)' ;


[s N_no] = size(meanaimpoint_nod1);
[s N_fb] = size(meanaimpoint_fbd1);

ib  = 1;
bar(a(ib), mean(abs(meanaimpoint_nod1 - meanoptAim_nod1)), 1, 'w'); hold on
errorbar(a(ib), mean(abs(meanaimpoint_nod1 - meanoptAim_nod1)), std(abs(meanaimpoint_nod1 - meanoptAim_nod1))/sqrt(N_no), 'ko', 'linewidth', 1.5, 'MarkerSize', 0.1, 'CapSize',6);
plot(a(ib), abs(meanaimpoint_nod1 - meanoptAim_nod1), 'ok', 'MarkerFaceColor', 'w', 'MarkerSize',5);

bar(b(ib), mean(abs(meanaimpoint_fbd1 - meanoptAim_fbd1)), 1, 'FaceColor', [100/255 100/255 100/255]); hold on
errorbar(b(ib), mean(abs(meanaimpoint_fbd1 - meanoptAim_fbd1)), std(abs(meanaimpoint_fbd1 - meanoptAim_fbd1))/sqrt(N_fb), 'ko', 'linewidth', 1.5, 'MarkerSize', 0.1, 'CapSize',6);
plot(b(ib), abs(meanaimpoint_fbd1 - meanoptAim_fbd1), 'ok', 'MarkerFaceColor', 'k', 'MarkerSize',5);

for ib = 8:14
    bar(a(ib-6), mean(abs(aimpoint_no(:,ib) - bdt_optAim_no(:,ib))), 1, 'w'); hold on
    plot(a(ib-6), abs(aimpoint_no(:,ib) - bdt_optAim_no(:,ib)), 'ok', 'MarkerFaceColor', 'w', 'MarkerSize',5);
    errorbar(a(ib-6), mean(abs(aimpoint_no(:,ib) - bdt_optAim_no(:,ib))), std(abs(aimpoint_no(:,ib) - bdt_optAim_no(:,ib)))/sqrt(N_no), 'ko', 'linewidth', 1.5, 'MarkerSize', 0.1, 'CapSize',6);
    
    bar(b(ib-6), mean(abs(aimpoint_fb(:,ib) - bdt_optAim_fb(:,ib))), 1, 'FaceColor', [100/255 100/255 100/255]); hold on
    plot(b(ib-6), abs(aimpoint_fb(:,ib) - bdt_optAim_fb(:,ib)), 'ok', 'MarkerFaceColor', 'k', 'MarkerSize',5);
    errorbar(b(ib-6), mean(abs(aimpoint_fb(:,ib) - bdt_optAim_fb(:,ib))), std(abs(aimpoint_fb(:,ib) - bdt_optAim_fb(:,ib)))/sqrt(N_fb), 'ko', 'linewidth', 1.5, 'MarkerSize', 0.1, 'CapSize',6);
    
end

absdiff_nod2 = abs(aimpoint_no(:,8:14) - bdt_optAim_no(:,8:14));
absdiff_fbd2 = abs(aimpoint_fb(:,8:14) - bdt_optAim_fb(:,8:14));

xlim([-0.5 24.5]); ylim([0 1.5]); yticks(0:0.5:1.5)
xticks(1.5:3:22.5);
xticklabels({'day 1', '1', '2', '3', '4', '5', '6', '7'});
ylabel('Absoluete risk-sensitivity [cm]'); xlabel('Block');

pos(3) = 750; pos(4) = 400;
set(gcf, 'Position', pos);


