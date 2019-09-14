clear all; close all;


width = [1:1:4000];
TL = 3000 ;
SL = 700 ; 
for i = 1:length(width)
    if i < SL 
       gainFunc(i) = 0;
    elseif i >= SL && i <= TL 
       gainFunc(i) = (i-SL)/(TL-SL)*100;
    elseif i > TL
       gainFunc(i) = 0;
    end    
end

%% 
sigma = 200 ;  
highrewardthres = 2770; % 90 points

for i = 1:4000
  resProb_g = exp(-(width-i).^2/(2*sigma^2)) / sqrt(2*pi*sigma^2) ;            
  resProb_g = resProb_g /sum(resProb_g);
  eg_g = sum(resProb_g.*gainFunc) ; 
  EG_g(i) = eg_g;   
  misrate_g(i) = sum(resProb_g(3001:end));   
  highrewardrate_g(i) = sum(resProb_g(highrewardthres:3000));   
end

[opteg_g tmp] = max(EG_g) ; 
optaim_g = width(tmp);
resProb_g =  exp(-(width-optaim_g).^2/(2*sigma^2)) / sqrt(2*pi*sigma^2) ;            
resProb_g = resProb_g /sum(resProb_g);
optmisrate_g = sum(resProb_g(3001:end)); 
opthighreward_g = sum(resProb_g(highrewardthres:3000));   

% Uniform pdf
for target = 1:4000    
    b_a = sigma*2*sqrt(3);
    b = target + (b_a/2);
    a = target - (b_a/2);    
    for i = 1:length(width)
        if i > a && i <= b
            p_uni(i) = 1/(b-a);
        else
            p_uni(i) = 0;
        end
    end 
    p_uni = p_uni./sum(p_uni);
    eg_uni = sum(p_uni.*gainFunc);
    EG_uni(target) = eg_uni;
    misrate_uni(target) = sum(p_uni(3001:end));   
    highrewardrate_uni(target) = sum(p_uni(highrewardthres:3000));   
end

[OptPoint_uni temp] = max(EG_uni) ;
OptTarget_uni = width(temp) ;

b_a = sigma*2*sqrt(3);
b = OptTarget_uni + (b_a/2);
a = OptTarget_uni - (b_a/2);
for i = 1:length(width)
    if i > a && i <= b
        p_uni(i) = 1/(b-a);
    else
        p_uni(i) = 0;
    end
end
p_uni = p_uni./sum(p_uni);
optmisrate_uni = sum(p_uni(3001:end)); 
opthighreward_uni = sum(p_uni(highrewardthres:3000));   

figure
% Gaussian
subplot(5,2,1)
plot(width(1:3000), gainFunc(1:3000), 'r-', 'linewidth',2); hold on
plot(width(3001:end), gainFunc(3001:end), 'r-', 'linewidth',2); hold on
lineplot(3000, 'v', 'k--', 'linewidth', 1.5);
ylabel('Gain'); xlabel('Reaching endpoint [cm]'); 
xlim([700 3500]); ylim([0 0.0025]);
ylim([0 100]); yticks([0:25:100]);
xticks([700 1850 3000 3500]); xticklabels({'7', '18.5','30','35'}); 
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 11, 'linewidth', 1);

subplot(5,2,3)
plot(width, resProb_g, 'k-', 'linewidth',2); hold on
ylabel('Probability'); xlabel('Reaching endpoint [cm]'); 
xlim([700 3500]); ylim([0 0.0025]);
lineplot(optaim_g, 'v', 'k-', 'linewidth', 1.5);
lineplot(3000, 'v', 'g-', 'linewidth', 1.5);
xticks([700 1850 3000 3500]); xticklabels({'7', '18.5','30','35'}); 
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 11, 'linewidth', 1);

subplot(5,2,5)
plot(width, EG_g, '-',  'Color', [150/255 150/255 150/255], 'linewidth',2); hold on 
lineplot(optaim_g, 'v', 'k-', 'linewidth', 1.5);
lineplot(3000, 'v', 'g-', 'linewidth', 1.5);
ylabel('Expected gain'); xlabel('Reaching aimpoint [cm]'); 
xlim([700 3500]); 
ylim([0 100]); yticks([0:25:100]);
xticks([700 1850 3000 3500]); xticklabels({'7', '18.5','30','35'}); 
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 11, 'linewidth', 1);

subplot(5,2,7)
plot(width, highrewardrate_g, '-',  'Color', [150/255 150/255 150/255], 'linewidth',2); hold on 
lineplot(optaim_g, 'v', 'k-', 'linewidth', 1.5);
lineplot(3000, 'v', 'g-', 'linewidth', 1.5);
ylabel('Probability of obtaining 90 points or more'); xlabel('Reaching aimpoint [cm]'); 
xlim([700 3500]); 
ylim([0 0.45]); yticks([0:0.15:0.45]);
xticks([700 1850 3000 3500]); xticklabels({'7', '18.5','30','35'}); 
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 11, 'linewidth', 1);

subplot(5,2,9)
plot(width, misrate_g, '-',  'Color', [150/255 150/255 150/255], 'linewidth',2); hold on 
lineplot(optaim_g, 'v', 'k-', 'linewidth', 1.5);
lineplot(3000, 'v', 'g-', 'linewidth', 1.5);
ylabel('Probability of obtaining 0 points'); xlabel('Reaching aimpoint [cm]'); 
xlim([700 3500]); 
ylim([0 1]); yticks([0:0.25:1]);
xticks([700 1850 3000 3500]); xticklabels({'7', '18.5','30','35'}); 
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 11, 'linewidth', 1);

% uniform
subplot(5,2,2)
plot(width(1:3000), gainFunc(1:3000), 'r-', 'linewidth',2); hold on
plot(width(3001:end), gainFunc(3001:end), 'r-', 'linewidth',2); hold on
lineplot(3000, 'v', 'k--', 'linewidth', 1.5);
ylabel('Gain'); xlabel('Reaching endpoint [cm]'); 
xlim([700 3500]); ylim([0 0.0025]);
ylim([0 100]); yticks([0:25:100]);
xticks([700 1850 3000 3500]); xticklabels({'7', '18.5','30','35'}); 
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 11, 'linewidth', 1);

subplot(5,2,4)
plot(width, p_uni, 'k-', 'linewidth',2); hold on
ylabel('Probability'); xlabel('Reaching endpoint [cm]'); 
xlim([700 3500]); ylim([0 0.0025]);
lineplot(OptTarget_uni, 'v', 'k-', 'linewidth', 1.5);
lineplot(3000, 'v', 'g-', 'linewidth', 1.5);
xticks([700 1850 3000 3500]); xticklabels({'7', '18.5','30','35'}); 
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 11, 'linewidth', 1);

subplot(5,2,6)
plot(width, EG_uni, '-',  'Color', [150/255 150/255 150/255], 'linewidth',2); hold on 
lineplot(OptTarget_uni, 'v', 'k-', 'linewidth', 1.5);
lineplot(3000, 'v', 'g-', 'linewidth', 1.5);
ylabel('Expected gain'); xlabel('Reaching aimpoint [cm]'); 
xlim([700 3500]); 
ylim([0 100]); yticks([0:25:100]);
xticks([700 1850 3000 3500]); xticklabels({'7', '18.5','30','35'}); 
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 11, 'linewidth', 1);

subplot(5,2,8)
plot(width, highrewardrate_uni, '-',  'Color', [150/255 150/255 150/255], 'linewidth',2); hold on 
lineplot(OptTarget_uni, 'v', 'k-', 'linewidth', 1.5);
lineplot(3000, 'v', 'g-', 'linewidth', 1.5);
ylabel('Probability of obtaining 90 points or more'); xlabel('Reaching aimpoint [cm]'); 
xlim([700 3500]); 
ylim([0 0.4]); yticks([0:0.1:0.4]);
xticks([700 1850 3000 3500]); xticklabels({'7', '18.5','30','35'}); 
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 11, 'linewidth', 1);

subplot(5,2,10)
plot(width, misrate_uni, '-',  'Color', [150/255 150/255 150/255], 'linewidth',2); hold on 
lineplot(OptTarget_uni, 'v', 'k-', 'linewidth', 1.5);
lineplot(3000, 'v', 'g-', 'linewidth', 1.5);
ylabel('Probability of obtaining 0 points'); xlabel('Reaching aimpoint [cm]'); 
xlim([700 3500]); 
ylim([0 1]); yticks([0:0.25:1]);
xticks([700 1850 3000 3500]); xticklabels({'7', '18.5','30','35'}); 
set(gca, 'Fontname', 'Arial Regular', 'Fontsize', 11, 'linewidth', 1);


pos(3) = 950; pos(4) = 1200;
set(gcf, 'Position', pos);



