N = 20; %broj fermionskih siteova
t=1; %hopping
D=t; %supravodljivi clan

P1 = zeros(N,4);
P2 = zeros(N,4);

Tm=[-t -D; t D];
for i = 1:4
    mu = (i-1)*t; %on site energy, promjenjivi parametar
    Em=[-mu 0; 0 mu];

    %hamiltonijan
    H = kron(diag(ones(1,N)),Em)... 
        +kron(diag(ones(1,N-1),1),Tm)...
        +kron(diag(ones(1,N-1),-1),Tm');
    
    %izdvajanje valnih funkcija od MZM (sredisnja dva)
    %prvo uzbudeno stanje se nalazi na N-1 i N+2, itd.
    [V,D] = eig(H);
    
    psi1 = V(1:2:2*N, N);
    P1_i = psi1.*conj(psi1);
    P1(:, i) = P1(:, i) + P1_i;
    
    psi2 = V(1:2:2*N, N+1);
    P2_i = psi2.*conj(psi2);
    P2(:, i) = P2(:, i) + P2_i;
    
end

figure(1),...
    subplot(1, 4, 1),...
        plot(2*(P1(:, 1)+P2(:, 1)), 'k', 'LineWidth',1),...
        xlim([1 N]), ylim([0 1]), ylabel('|ψ|^2'), xlabel('site n'),...
        legend ('mu/t = 1','Location','northwest');
    subplot(1, 4, 2),...
        plot(2*(P1(:, 2)+P2(:, 2)), 'k', 'LineWidth',1),...
        xlim([1 N]), ylim([0 1]), ylabel('|ψ|^2'), xlabel('site n'),...
        legend ('mu/t = 2','Location','northwest');
    subplot(1, 4, 3),...
        plot(2*(P1(:, 3)+P2(:, 3)), 'k', 'LineWidth',1),...
        xlim([1 N]), ylim([0 1]), ylabel('|ψ|^2'), xlabel('site n'),...
        legend ('mu/t = 3','Location','northwest');
    subplot(1, 4, 4),...
        plot(2*(P1(:, 4)+P2(:, 4)), 'k', 'LineWidth',1),...
        xlim([1 N]), ylim([0 1]), ylabel('|ψ|^2'), xlabel('site n'),...
        legend ('mu/t = 4','Location','northwest');

    
