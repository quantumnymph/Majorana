t=1; %hopping
D=t; %supravodljivi clan

ka = linspace(-pi, pi, 1000);
E_k1 = zeros(7, length(ka));
E_k2 = zeros(7, length(ka));

%dobiveno iz analitičkog izraza
for i = 1:7
    mu = 3 - (i-1);
    for j = 1:length(ka)
        E_k1(i, j) = sqrt((mu+2.*t.*cos(ka(j))).^2+4.*D.^2.*(sin(ka(j))).^2);
        E_k2(i, j) = -sqrt((mu+2.*t.*cos(ka(j))).^2+4.*D.^2.*(sin(ka(j))).^2);
    end
end


figure(1),...
    subplot(3, 4, 1),...
        plot(ka, E_k1(1, :)./t, 'k', ka, E_k2(1,:)./t, 'k', 'LineWidth',1), xlim([-pi pi]), ylim([-5 5]);
        xlabel('ka'), ylabel('E/t'), title('µ/t = 3, trivijalna');
    subplot(3, 4, 2),...
        plot(ka, E_k1(2, :)./t, 'k', ka, E_k2(2,:)./t, 'k', 'LineWidth',1), xlim([-pi pi]), ylim([-5 5]);
        xlabel('ka'), ylabel('E/t'), title('µ/t = 2, topološka');
    subplot(3, 4, 3),...
        plot(ka, E_k1(3, :)./t, 'k', ka, E_k2(3,:)./t, 'k', 'LineWidth',1), xlim([-pi pi]), ylim([-5 5]);
        xlabel('ka'), ylabel('E/t'), title('µ/t = 1, topološka');
    subplot(3, 4, 4),...
        plot(ka, E_k1(4, :)./t, 'k', ka, E_k2(4,:)./t, 'k','LineWidth',1), xlim([-pi pi]), ylim([-5 5]);
        xlabel('ka'), ylabel('E/t'), title('µ/t = 0, topološka');
    subplot(3, 4, 5),...
        plot(ka, E_k1(5, :)./t, 'k', ka, E_k2(5,:)./t, 'k', 'LineWidth',1), xlim([-pi pi]), ylim([-5 5]);
        xlabel('ka'), ylabel('E/t'), title('µ/t = -1, topološka');
    subplot(3, 4, 6),...
        plot(ka, E_k1(6, :)./t, 'k', ka, E_k2(6,:)./t, 'k', 'LineWidth',1), xlim([-pi pi]), ylim([-5 5]);
        xlabel('ka'), ylabel('E/t'), title('µ/t = -2, topološka');
    subplot(3, 4, 7),...
        plot(ka, E_k1(7, :)./t, 'k', ka, E_k2(7,:)./t, 'k', 'LineWidth',1), xlim([-pi pi]), ylim([-5 5]);
        xlabel('ka'), ylabel('E/t'), title('µ/t = -3, topološka');





