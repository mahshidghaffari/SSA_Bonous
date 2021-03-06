%CIplot calculate mean confidence interval and plot it
%input: data we want to study( mean delays, queuelength etc) 
%n : sample size
%tScore : t-Score coefficient 
%name : title for the graph 

function [m,CI] = CIplot(input,n, tScore, name)

m = mean(input);

%sample variance
s = sum((input - m).^2) ./ (n-1) ;
%confidence interval
CI = [m- tScore*(sqrt(s./n)), m + tScore*(sqrt(s./n))];

%plotting data with their respectives 95% confidence interval
figure 
histogram(input)
hold on 
ylim = get(gca, 'YLim');
plot(m*[1,1],ylim*1.05,'r-','LineWidth',2);
plot(CI(1)*[1,1],ylim*1.05,'g-','LineWidth',2);
plot(CI(2)*[1,1],ylim*1.05,'g-','LineWidth',2);
title(name)
end

