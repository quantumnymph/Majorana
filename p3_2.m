%parametri
epsilon_0 = 0; %eV
t = 1; %eV, u apsolutnoj vrijednosti
ka = linspace(-pi, pi, 1000);

E1 = epsilon_0 + 2*t*cos(ka);
E2 = epsilon_0 - 2*t*cos(ka);

figure(1),...
    plot(ka/pi, E1), grid on, xlim([-1,1]), ylim([-3,3]),...
    xlabel('ka/pi'), ylabel('E, za t = 1')
figure(2),...
    plot(ka/pi, E2), grid on, xlim([-1,1]), ylim([-3,3]),...
    xlabel('ka/pi'), ylabel('E, za t = -1')