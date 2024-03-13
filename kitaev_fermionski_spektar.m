N = 25; %duljina lanca
t=1; %hopping
D=t; %supravodljivi clan
mu = linspace(0,4,1001); %on site energy range

eigE=zeros(length(mu),2*N);

for k = 1:length(mu)
    Em=[-mu(k) 0; 0 mu(k)];
    Tm=[-t -D; D t];

    H = kron(diag(ones(1,N)),Em)... 
       +kron(diag(ones(1,N-1),1),Tm)...
       +kron(diag(ones(1,N-1),-1),Tm');

    [Vxx,Dxx] = eig(H);
    eigE(k,:) = diag(Dxx);
end

plot(mu/t, eigE/D, 'k');
hold on
plot(mu/t, eigE(:,25)/D, mu/t, eigE(:,26)/D, 'r', 'LineWidth',1.5);
xlabel('µ/t'), ylabel('E/∆');
