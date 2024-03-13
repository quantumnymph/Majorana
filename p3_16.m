% parametri, SI jedinice osim energije (eV)
kBT=0.025;
h=4.135e-15; % eV-s
q=1.6e-19;
E=linspace(-5,5,1000);
dE=E(2)-E(1);

% definicija gustoce modova, primjer 3.14
M1=ones(1,length(E));
M2=ones(1,length(E));
M3=ones(1,length(E));

M1(find(E<-2))=0;M1(find(E>2))=0;
M2(find(E<-3))=0;M2(find(E>3))=0;M2(find((E>-1)&(E<1)))=0;
M3(find(E<-4))=0;M3(find(E>4))=0;M3(find((E>-2)&(E<2)))=0;

% parametri za proracun struje 
Ef=1;
NV=20; V=linspace(0,1,NV);
I1=zeros(1,NV); I2=zeros(1,NV); I3=zeros(1,NV);

for n=1:NV
    Vx=V(n);
    EfL=Ef+Vx/2;
    EfR=Ef-Vx/2;
    fL=1./(1+exp((E-EfL)/kBT));
    fR=1./(1+exp((E-EfR)/kBT));

    I=sum(M1.*(fL-fR))*dE * (-2*q/h); I1(n)=abs(I);
    I=sum(M2.*(fL-fR))*dE * (-2*q/h); I2(n)=abs(I);
    I=sum(M3.*(fL-fR))*dE * (-2*q/h); I3(n)=abs(I);
end

figure(1), ...
    subplot(1,2,1),...
        plot(V,I1,'b-','LineWidth',2), grid on, xlim([0 1]), xlabel('U (V)'),...
        ylabel('I (A)'), hold on,...
        plot(V,I2,'r--','LineWidth',2), plot(V,I3,'k:','LineWidth',2), ...
        legend ('t_{2} = -1 eV','t_{2} = -2 eV','t_{2} = -3 eV','Location',...
        'northwest'), hold off,...
    subplot(1,2,2),...
        plot(M2,E,'b',(fL-fR),E,'k:','LineWidth',2), xlim([0 1.2]),...
        xlabel('M(E), f(E)'), ylabel('E (eV)'),...
        legend ('M(E) za t_{2} = -2 eV','f_{L} - f_{R} za U = 1 V','Location',...
        'southeast');






